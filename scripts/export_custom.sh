#!/bin/bash
BOARD_IP_ADDR="192.168.1.92"
YOLOV5_LOCAL_DIR="$HOME/STM32MPU_Workspace/yolov5"
source $YOLOV5_LOCAL_DIR/.venv/bin/activate

# different options to export models with, uses all combinations
FLAGS=(
    --int8 # CoreML/TF/OpenVINO INT8 quantization
    # --optimize # TorchScript: optimize for mobile
    --per-tensor # TF per-tensor quantization
    # --dynamic # ONNX/TF/TensorRT dynamic axes
    # --simplify # ONNX: simplify model
)

# Abbreviations for each flag, in the same order as FLAGS
# ABBREV=("int8" "opt" "pt" "dyn" "simple")
ABBREV=("int8" "pt")

mkdir ~/STM32MPU_Workspace/models
# mkdir ~/STM32MPU_Workspace/models/ONNX
# mkdir ~/STM32MPU_Workspace/models/TFLiteComp
mkdir ~/STM32MPU_Workspace/models/Comparison
# NUM_FLAGS=${#FLAGS[@]}

for ((i=0; i<1<<NUM_FLAGS; i++)); do
    COMBO=()
    OPT_SUFFIX=""
    for ((j=0; j<NUM_FLAGS; j++)); do
        if (( (i>>j)&1 )); then
            COMBO+=("${FLAGS[j]}")
            OPT_SUFFIX+="-${ABBREV[j]}"
        fi
    done

    # Execution
    if [ ${#COMBO[@]} -eq 0 ]; then
        echo "Exporting with options: None"
    else
        echo "Exporting with options: ${COMBO[*]}"
    fi
    # python $YOLOV5_LOCAL_DIR/export.py --weights yolov5n.pt --include tflite onnx "${COMBO[@]}" 2>&1 >/dev/null | grep "Error"
    python $YOLOV5_LOCAL_DIR/export.py --weights yolov5n.pt --include tflite "${COMBO[@]}" --no-report 2>&1 >/dev/null | grep "Error"

    # for f in *.onnx; do
    #     base="${f%.*}"
    #     ext="${f##*.}"
        
    #     # Remove '-int8' from the original base name if present
    #     base_no_int8="${base/-int8/}"
    #     mv "$f" "$HOME/STM32MPU_Workspace/models/ONNX/${base_no_int8}${OPT_SUFFIX}.${ext}"
    # done

     for f in *.tflite; do
        base="${f%.*}"
        ext="${f##*.}"
        
        # Remove '-int8' from the original base name if present
        base_no_int8="${base/-int8/}"
        mv "$f" "$HOME/STM32MPU_Workspace/models/TFLite/${base_no_int8}${OPT_SUFFIX}.${ext}"
    done
done

# Run stedgeai on each ONNX and TFLite model
# ONNX_DIR="$HOME/STM32MPU_Workspace/models/ONNX"
# TFLITE_DIR="$HOME/STM32MPU_Workspace/models/TFLite"
# OUTPUT_DIR="$HOME/STM32MPU_Workspace/models/NBG"

# for model in "$ONNX_DIR"/*.onnx "$TFLITE_DIR"/*.tflite; do
#     [ -e "$model" ] || continue
#     echo "Running stedgeai on $model"
#     stedgeai generate -m "$model" --target stm32mp257 --no-report --output "$OUTPUT_DIR"
# done


# Simple TensorFlow Lite and ONNX export script for YOLOv5 models
# for model in yolov5n yolov5s yolov5m yolov5l yolov5x; do
#     python export.py --weights $model.pt --include tflite onnx
# done


# Move to board and remove from local
scp -l 1024 ~/STM32MPU_Workspace/models/Comparison/*.tflite root@$BOARD_IP_ADDR:/usr/local/models/Comparison/
# scp -l 1024 *.onnx root@$BOARD_IP_ADDR:/usr/local/models/default/
