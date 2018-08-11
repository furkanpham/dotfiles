# bashrc
[[ -f ${HOME}/.bashrc ]] && . ${HOME}/.bashrc

# scripts and stuff
export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"
# ESP-IDF
export PATH+=":${HOME}/EmbeddedArm/gcc-arm-none-eabi-5_4-2016q3/bin"
export PATH+=":${HOME}/esp/xtensa-esp32-elf/bin"
export IDF_PATH="${HOME}/esp/esp-idf"
export GPG_TTY=$(tty)
# adb
export PATH="${HOME}/adb-fastboot/platform-tools:${PATH}"
# arduino
export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/usr/share/arduino
export AVR_TOOLS_DIR=/usr
export AVRDUDE=/usr/bin/avrdude
export AVRDUDE_CONF=/etc/avrdude.conf
# quartus
export QSYS_ROOTDIR="${HOME}/intelFPGA_lite/16.1/quartus/sopc_builder/bin"
