################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Inc/CRSLibtmp/MetaType/sample.cpp 

OBJS += \
./Core/Inc/CRSLibtmp/MetaType/sample.o 

CPP_DEPS += \
./Core/Inc/CRSLibtmp/MetaType/sample.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Inc/CRSLibtmp/MetaType/%.o Core/Inc/CRSLibtmp/MetaType/%.su: ../Core/Inc/CRSLibtmp/MetaType/%.cpp Core/Inc/CRSLibtmp/MetaType/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Inc-2f-CRSLibtmp-2f-MetaType

clean-Core-2f-Inc-2f-CRSLibtmp-2f-MetaType:
	-$(RM) ./Core/Inc/CRSLibtmp/MetaType/sample.d ./Core/Inc/CRSLibtmp/MetaType/sample.o ./Core/Inc/CRSLibtmp/MetaType/sample.su

.PHONY: clean-Core-2f-Inc-2f-CRSLibtmp-2f-MetaType

