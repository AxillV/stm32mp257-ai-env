# Setup
***
### Start here!
In order so setup the development ecosystem correctly, follow the instructions as seen below. Any deviation from the instructions could potentially render the use of the tools and/or processes impossible, requiring changes to scripts, paths and/or reconstruction of the ecosystem's file system.<br>

### Steps to follow
1. Create a directory in your home directory called `STM32MPU_Workspace` and clone this repository to said directory.
2. Execute the `setup_workspace.sh` script from the newly created folder. The workspace will be installed in your home directory. If you already have the files required inside the `STM32MPU_Workspace` directory, you can run the following commands in order to complete the setup:

- `stm32mp2-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06`
- `stm32mp2-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0`
- `stedgeai-linux-onlineinstaller`

`sh ~/STM32MPU_Workspace/stm32mp2-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06/sdk/st-image-weston-openstlinux-weston-stm32mp2.rootfs-x86_64-toolchain-5.0.3-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06.sh -d ~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK`

`cp ~/STM32MPU_Workspace/stm32mp2-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0/st-image-ai-openstlinux-weston-stm32mp2.rootfs-x86_64-toolchain-5.0.3-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0.sh ~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK/; chmod +x ~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK/st-image-ai-openstlinux-weston-stm32mp2.rootfs-x86_64-toolchain-5.0.3-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0.sh; cd ~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK/;~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK/st-image-ai-openstlinux-weston-stm32mp2.rootfs-x86_64-toolchain-5.0.3-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0.sh; rm ~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/SDK/st-image-ai-openstlinux-weston-stm32mp2.rootfs-x86_64-toolchain-5.0.3-openstlinux-6.6-yocto-scarthgap-mpu-v24.11.06-addon-x-linux-ai-v6.0.0.sh`

3. *(Optional, for flashing the chip)* Follow the [instructions for installing the Starter Package](https://wiki.st.com/stm32mpu/wiki/STM32MP25_Discovery_kits_-_Starter_Package#Installing_the_tools), place the linux image in top-folder in `~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Starter-Package/` and the CUBE programmer tool in the `STM32MPU_Workspace/STM32MPU_Tools` folder.
4. Follow the [instructions for installing the developer SDK](https://wiki.st.com/stm32mpu/wiki/STM32MPU_Developer_Package#Installing_the_SDK), needed for developing for the Arm Cortex-A. Again, pay attention to the installation directories, the target directory for the installation should be `Developer-Package/SDK`.
5. Follow the [instructions for installing the X-LINUX-AI addon](https://wiki.st.com/stm32mpu/wiki/X-LINUX-AI_Developer_package#X-LINUX-AI_SDK_add-on_installation), that is added on top of the base SDK.
6. [Install the STEdgeAI tool](https://wiki.st.com/stm32mpu/wiki/ST_Edge_AI:_Guide_for_MPU) in the `STM32MPU_Tools` directory, required for converting NN models in order to use them in the MPU.
7. *(Optional, if not already installed in the chip)* Follow the [instructions for installing the X-LINUX-AI Starter Package](https://wiki.st.com/stm32mpu/wiki/X-LINUX-AI_Starter_package) on the **chip**.

# Usage
***
### How to develop for the MPU
1. Execute in terminal the following: `source activate_sdk_6.0.1.sh` in order to enter the development environment. This activates cross-compilation, IntelliSense etc.
2. Projects should be placed in the `~/STM32MPU_Workspace/STM32MPU_Ecosystem_6.0.1/Developer-Package/stm32mp2-openstlinux-24.11.06/sources` directory when preparing for deployment, in order to comply with the ST working directory organization suggestions. However, you can also use this repository for ease of use.
3. *(Optional)* If you are developing in VSCode, make sure to run VSCode from a terminal that has sourced the sdk (`source activate_sdk_6.0.1.sh`) script , also use the provided `.vscode/` folder which provides IntelliSense features.
