#!/bin/bash
BOARD_IP_ADDR="192.168.1.92"
MODEL_DIR="$HOME/STM32MPU_Workspace/models/BatchExport"
STEDGEAI_LOCAL_DIR="$HOME/STM32MPU_Workspace/stedgeai"

for model in "$MODEL_DIR"/*.tflite; do
    [ -e "$model" ] || continue
    echo "Running stedgeai on $model"
    stedgeai generate -m "$model" --target stm32mp257 --no-report --output "$OUTPUT_DIR"
done

echo "Running stedgeai completed for all models."

scp -l 1024 ~/STM32MPU_Workspace/models/BatchExport/*.nb root@$BOARD_IP_ADDR:/root/STM32MPU_Workspace/models/BatchExport/
echo "Models converted and copied to STM32MPU_Workspace/models/BatchExport on the board."