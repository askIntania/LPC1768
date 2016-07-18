# LPC1768
This work was developed under linux operating system using GNU ARM Eclipse OpenOCD.
##Tools:
- [GNU Tools for ARM Embedded Processors 5.4.1 20160609 (release)](https://launchpad.net/gcc-arm-embedded)
- Eclipse Mars.2
- [OpenOCD 0.9.0](https://sourceforge.net/projects/openocd/files/openocd/0.9.0/)

##Configure for eclipse
1. Install GNU ARM Eclipse plug-ins from the following URL `http://gnuarmeclipse.sourceforge.net/updates`
2. Goto project->properties
  - Tool Settings
    - Cross ARM GNU Assembler's Options
    
        ```
        -x assembler-with-cpp -I"/path/to/workspace/HelloLPC1768/include"
        ```
    - Cross ARM C Compiler's Options 
      
        ```
        -I"/path/to/workspace/HelloLPC1768/include" -std=gnu99 -Wbad-function-cast -fgnu89-inline -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections
        ```
    - Cross ARM C Linker's Options
    
        ```
        -T "/path/to/workspace/HelloLPC1768/ldscripts/LPC17xx.ld" -Xlinker --gc-sections -Wl,-Map,"HelloLPC1768.map"
        ```
    - Cross ARM GNU Create Flash Image
    
        ```
        -O ihex "HelloLPC1768.elf"
        ```
  - Toolchains
    - Choose architecture to 32 bits
    - Set path to `/path/to/gcc-arm-none-eabi-5_4-2016q2/bin`   
    - Set prefix as `arm-none-eabi-`
    - In addition, this can be set to associate to the current workspace.
3. Configure run method (J-Link)
  - Goto Run->Run Configurations..
  - Add new configuration in C/C++ Application 
  - In the Main tab set C/C++ Application to `exec`. This make the eclipse to execute the <b><i>exec</i></b> script which is included in each project. Note the script is used to write the image using the openocd. It is somehow needs to change the name of the binary file to match the compiled one.
4. Configure debug method (J-Link)
 - Goto Run->Debug Configurations..
 - Add new configuration in GDB OpenOCD Debugging
 - In the Main tab set C/C++ Application to the compiled executable file.
 - In the Debugger tab set Config Options to `-f interface/jlink.cfg -f target/lpc17xx.cfg`.
 * Before debugging, the target must be halted first. I do it manually using the command line.
