#!/bin/julia

MAX_VOLTAGE = 42
MIN_VOLTAGE = 36

MAX_AH = 19
CHARGER_AMPS = 3
EFFICIENCY = 0.8
CHARGE_RATE = MAX_AH/(CHARGER_AMPS * EFFICIENCY)

DESIRED_CHARGE = 0.8

# li-ion cells have pretty linear discharge profiles so this is a reasonable estimate
charge_level(voltage) = (voltage-MIN_VOLTAGE)/(MAX_VOLTAGE-MIN_VOLTAGE)

time_to_charge(current_voltage, desired_charge=DESIRED_CHARGE) = CHARGE_RATE * (desired_charge - charge_level(current_voltage))
