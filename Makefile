# Makefile to build the SDL library

FRAMEWORK_ARDUINO_ESPRESSIF32=$(HOME)/.platformio/packages/framework-arduinoespressif32
TOOLCHAIN-XTENSA32=$(HOME)/.platformio/packages/toolchain-xtensa32

INCLUDE = -I./include \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/config \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/bluedroid \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/bt \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/driver \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/esp32 \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/ethernet \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/fatfs \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/freertos \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/log \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/mdns \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/mbedtls \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/mbedtls_port \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/vfs \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/ulp \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/newlib \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/nvs_flash \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/spi_flash \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/sdmmc \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/openssl \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/app_update \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/tcpip_adapter \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/xtensa-debug-module \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/newlib \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/coap \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/wpa_supplicant \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/expat \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/json \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/nghttp \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/tools/sdk/include/lwip \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/cores/esp32 \
-I$(FRAMEWORK_ARDUINO_ESPRESSIF32)/variants/esp32

#CFLAGS  = -g -O2 $(INCLUDE)
CFLAGS = $(INCLUDE) \
-Wno-old-style-declaration \
-std=gnu99 \
-Wno-error=deprecated-declarations \
-Wno-unused-parameter \
-Wno-sign-compare \
-Os \
-g3 \
-nostdlib \
-Wpointer-arith \
-Wno-error=unused-but-set-variable \
-Wno-error=unused-variable \
-mlongcalls \
-ffunction-sections \
-fdata-sections \
-fstrict-volatile-bitfields \
-DARDUINO=10610 \
-DARDUINO_ARCH_ESP32 \
-DESP32 \
-DESP_PLATFORM \
-DF_CPU=240000000L \
-DHAVE_CONFIG_H \
-DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" \
-DPLATFORMIO=30400 \
-DESP32_DEV \
-DARDUINO_ESP32_DEV \
-Dunix \
-DHAVE_MMAP=0 \
-DHAVE_MORECORE=0 \
-D_POSIX_THREADS

CC  = $(TOOLCHAIN-XTENSA32)/bin/xtensa-esp32-elf-gcc
AR	= $(TOOLCHAIN-XTENSA32)/bin/xtensa-esp32-elf-ar
RANLIB	=$(TOOLCHAIN-XTENSA32)/bin/xtensa-esp32-elf-ranlib

TARGET  = libSDL.a
SOURCES = \
	src/*.c \
	src/audio/*.c \
	src/cpuinfo/*.c \
	src/events/*.c \
	src/file/*.c \
	src/haptic/*.c \
	src/joystick/*.c \
	src/power/*.c \
	src/render/*.c \
	src/render/software/*.c \
	src/stdlib/*.c \
	src/thread/*.c \
	src/thread/generic/*.c \
	src/timer/*.c \
	src/video/*.c \
	src/filesystem/dummy/*.c \
	src/joystick/dummy/*.c \
	src/loadso/dummy/*.c \
	src/timer/dummy/*.c \
	src/haptic/dummy/*.c \
	src/video/dummy/*.c \
	src/audio/dummy/*.c \

OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(AR) crv $@ $^
	$(RANLIB) $@

clean:
	rm -f $(TARGET) $(OBJECTS)
