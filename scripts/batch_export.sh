#!/bin/bash
BOARD_IP_ADDR="192.168.1.92"
YOLOV5_LOCAL_DIR="$HOME/STM32MPU_Workspace/yolov5"
source $YOLOV5_LOCAL_DIR/.venv/bin/activate
cd $YOLOV5_LOCAL_DIR

FLAGS=(
    --int8 # CoreML/TF/OpenVINO INT8 quantization
    # --optimize # TorchScript: optimize for mobile
    --per-tensor # TF per-tensor quantization
    # --dynamic # ONNX/TF/TensorRT dynamic axes
    # --simplify # ONNX: simplify model
)

ABBREV=("int8" "pt")

mkdir ~/STM32MPU_Workspace/models
mkdir ~/STM32MPU_Workspace/models/BatchExport

# export all sizes
for size in n s m l; do
    echo "Exporting YOLOv5-${size} with options: ${FLAGS[*]}"
    python $YOLOV5_LOCAL_DIR/export.py --weights yolov5${size}.pt --include tflite "${FLAGS[@]}" #2>&1 >/dev/null | grep -i "error"

    for f in *.tflite; do
        base="${f%.*}"
        ext="${f##*.}"
        
        # Remove '-int8' from the original base name if present
        base_no_int8="${base/-int8/}"
        mv "$f" ~/STM32MPU_Workspace/models/BatchExport/"$base_no_int8-${ABBREV[0]}.$ext"
    done
done

echo "Export completed for all sizes."

scp -l 1024 ~/STM32MPU_Workspace/models/BatchExport/*.tflite root@$BOARD_IP_ADDR:/usr/local/models/BatchExport/
echo "Models exported and copied to STM32MPU_Workspace/models/BatchExport on the board."