G92 E0
G1 E-2 F200  ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z127 F300
G0 X0 Y35 F3000 ;move build tray front and center, Leave room to remove build surface
M104 S0
M107  ;Fan Off
M84   ;Motors off
