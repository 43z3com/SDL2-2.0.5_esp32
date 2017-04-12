# Makefile to build the SDL library

INCLUDE = -I./include \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/config \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/bluedroid \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/bt \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/driver \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/esp32 \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/ethernet \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/fatfs \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/freertos \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/log \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/mdns \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/mbedtls \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/mbedtls_port \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/vfs \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/ulp \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/newlib \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/nvs_flash \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/spi_flash \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/sdmmc \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/openssl \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/app_update \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/tcpip_adapter \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/xtensa-debug-module \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/newlib \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/coap \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/wpa_supplicant \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/expat \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/json \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/nghttp \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/tools/sdk/include/lwip \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/cores/esp32 \
-I/Users/Pooh/.platformio/packages/framework-arduinoespressif32/variants/esp32

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
-DHAVE_MORECORE=0

CC  = /Users/Pooh/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-gcc
AR	= /Users/Pooh/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ar
RANLIB	=/Users/Pooh/.platformio/packages/toolchain-xtensa32/bin/xtensa-esp32-elf-ranlib

TARGET  = libSDL.a
SOURCES = \
	src/*.c \
	src/audio/*.c \
	src/audio/dummy/*.c \
	src/cpuinfo/*.c \
	src/events/*.c \
	src/file/*.c \
	src/haptic/*.c \
	src/haptic/dummy/*.c \
	src/joystick/*.c \
	src/joystick/dummy/*.c \
	src/loadso/dummy/*.c \
	src/power/*.c \
	src/filesystem/dummy/*.c \
	src/render/*.c \
	src/render/software/*.c \
	src/stdlib/*.c \
	src/thread/*.c \
	src/thread/generic/*.c \
	src/timer/*.c \
	src/timer/dummy/*.c \
	src/video/*.c \
	src/video/dummy/*.c \

OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(AR) crv $@ $^
	$(RANLIB) $@

clean:
	rm -f $(TARGET) $(OBJECTS)
