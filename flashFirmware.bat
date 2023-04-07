@echo off
SET PORT=COM13
SET BAUDRATE=921600
SET ESPTOOL=./esptool/esptool.exe
SET BUILD_DIR=./build
SET FLASH_SIZE=2MB
SET FLASH_COMM=dio


"%ESPTOOL%" --chip esp32c6 --port %PORT% --baud %BAUDRATE% --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 40m --flash_size detect^
 0x00 ".\build\bootloader\bootloader.bin"^
 0x8000 ".\build\partition_table\partition-table.bin"^
 0x10000 ".\build\app.bin"


timeout 2
