# bashrc
[[ -f "${HOME}/.bashrc" ]] && . "${HOME}/.bashrc"

# general
export EDITOR="vim"

# scripts and stuff
export PATH="${HOME}/bin:${PATH}"
export SHELLCHECK_OPTS="-e SC2015"

# adb
export PATH="${HOME}/adb/platform-tools:${PATH}"

# .NET
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# ESP-IDF
export PATH+=":${HOME}/EmbeddedArm/gcc-arm-none-eabi-8-2018-q4-major/bin"
export PATH+=":${HOME}/esp/xtensa-esp32-elf/bin"
export IDF_PATH="${HOME}/esp/esp-idf"
export GPG_TTY=$(tty)
# arduino
export ARDUINO_DIR="${HOME}/arduino/arduino-1.8.8"
export ARDMK_DIR="${HOME}/arduino/Arduino-Makefile"
export AVR_TOOLS_DIR="${ARDUINO_DIR}/hardware/tools/avr"
export AVRDUDE="${ARDUINO_DIR}/hardware/tools/avr/bin/avrdude"
export AVRDUDE_CONF="${ARDUINO_DIR}/hardware/tools/avr/etc/avrdude.conf"
