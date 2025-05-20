# Setup
***
### Start here!
In order so setup the development ecosystem correctly, follow the instructions as seen below. Any deviation from the instructions could potentially render the use of the tools and/or processes impossible, requiring changes to scripts, paths and/or restructuring of the ecosystem's file system.<br>

### Steps to follow
1. Execute the `setup_workspace.sh` script in your **HOME** directory.
2. *(Optional, for flashing the chip)* Follow the [instructions for installing the Starter Package](https://wiki.st.com/stm32mpu/wiki/STM32MP25_Discovery_kits_-_Starter_Package#Installing_the_tools), place the linux image in top-folder in `~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Starter-Package/` and the cube programmer tool in the `STM32MPU_Workspace/STM32MPU_Tools` folder.
3. Follow the [instructions for installing the developer SDK](https://wiki.st.com/stm32mpu/wiki/STM32MPU_Developer_Package#Installing_the_SDK), needed for developing for the Arm Cortex-A. Again, pay attention to the installation directories, the target directory for the installation should be `Developer-Package/SDK`.
4. Follow the [instructions for installing the X-LINUX-AI addon](https://wiki.st.com/stm32mpu/wiki/X-LINUX-AI_Developer_package#X-LINUX-AI_SDK_add-on_installation), that is added on top of the base SDK.
5. [Install the STEdgeAI tool](https://wiki.st.com/stm32mpu/wiki/ST_Edge_AI:_Guide_for_MPU) in the `STM32MPU_Tools` directory, required for converting NN models in order to use them in the MPU.
6. Clone this repository to your local machine, in the `STM32MPU_Workspace` directory.

# Usage
***
### How to develop for the MPU
1. Execute in terminal the following: `source activate_sdk_6.0.1.sh` in order to enter the development environment. This activates cross-compilation, IntelliSense etc.
2. Projects should be placed in the `STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/stm32mp2-openstlinux-24.11.06/sources` directory.
3. *(Optional)* If you are developing in VSCode, use the provide `.vscode/` folder which provides IntelliSense features, as well as activating the SDK inside VSCode.
