M109 S220.0
M42 P10 S1 ; Turn on LED
G21 ; Set units to millimeters
G90 ; Use absolute coordinates
M82 ; Use absolute distances for extrusion
M204 S500
G1 F300.0 Z1.0

; Prime nozzle
G1 F9000.0 X77.0 Y-40.0
G1 F300.0 Z0.7
G92 E0
G1 F2000.0 Y26.0 E20.95
G1 X78.0
G1 Y-40.0 E41.9

; Finishing
G1 F300.0 Z1.0
G1 F5000.0 X0.0 Y0.0
G92 E0
