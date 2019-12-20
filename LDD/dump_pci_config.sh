#!/bin/bash

pci_config=(
  "VENDOR_ID"
  "DEVICE_ID"
  "COMMAND"
  "STATUS"
  "REVISION"
  "CLASS_PROG"
  "CLASS_DEVICE"
  "CACHE_LINE_SIZE"
  "LATENCY_TIMER"
  "HEADER_TYPE"
  "BIST"
  "BASE_ADDRESS_0"
  "BASE_ADDRESS_1"
  "BASE_ADDRESS_2"
  "BASE_ADDRESS_3"
  "BASE_ADDRESS_4"
  "BASE_ADDRESS_5"
  "CARDBUS_CIS"
  "SUBSYSTEM_VENDOR_ID"
  "SUBSYSTEM_ID"
  "ROM_ADDRESS"
  "INTERRUPT_LINE"
  "INTERRUPT_PIN"
  "MIN_GNT"
  "MAX_LAT"
  "PRIMARY_BUS"
  "SECONDARY_BUS"
  "SUBORDINATE_BUS"
  "SEC_LATENCY_TIMER"
  "IO_BASE"
  "IO_LIMIT"
  "SEC_STATUS"
  "MEMORY_BASE"
  "MEMORY_LIMIT"
  "PREF_MEMORY_BASE"
  "PREF_MEMORY_LIMIT"
  "PREF_BASE_UPPER32"
  "PREF_LIMIT_UPPER32"
  "IO_BASE_UPPER16"
  "IO_LIMIT_UPPER16"
  "BRIDGE_ROM_ADDRESS"
  "BRIDGE_CONTROL"
  "CB_CARDBUS_BASE"
  "CB_CAPABILITIES"
  "CB_SEC_STATUS"
  "CB_BUS_NUMBER"
  "CB_CARDBUS_NUMBER"
  "CB_SUBORDINATE_BUS"
  "CB_CARDBUS_LATENCY"
  "CB_MEMORY_BASE_0"
  "CB_MEMORY_LIMIT_0"
  "CB_MEMORY_BASE_1"
  "CB_MEMORY_LIMIT_1"
  "CB_IO_BASE_0"
  "CB_IO_BASE_0_HI"
  "CB_IO_LIMIT_0"
  "CB_IO_LIMIT_0_HI"
  "CB_IO_BASE_1"
  "CB_IO_BASE_1_HI"
  "CB_IO_LIMIT_1"
  "CB_IO_LIMIT_1_HI"
  "CB_SUBSYSTEM_VENDOR_ID"
  "CB_SUBSYSTEM_ID"
  "CB_LEGACY_MODE_BASE"
)

pci_bdf="$1"
if [ -z $pci_bdf ]; then
  echo "Usage: `basename $0` <pci_bdf>"
  exit 1
fi

for item in ${pci_config[@]}; do
  value=`setpci -s "$pci_bdf" $item`
  printf "%32s: %16s\n" $item $value
done

# end of file
