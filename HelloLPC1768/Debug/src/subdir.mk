################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/core_cm3.c \
../src/main.c \
../src/startup_LPC17xx.c \
../src/system_LPC17xx.c 

OBJS += \
./src/core_cm3.o \
./src/main.o \
./src/startup_LPC17xx.o \
./src/system_LPC17xx.o 

C_DEPS += \
./src/core_cm3.d \
./src/main.d \
./src/startup_LPC17xx.d \
./src/system_LPC17xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I"/home/blacksheep/LPC1768/workspace/HelloLPC1768/include" -std=gnu99 -Wbad-function-cast -fgnu89-inline -mcpu=cortex-m3 -mthumb -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


