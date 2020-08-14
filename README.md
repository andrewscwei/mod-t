# New Matter MOD-t Manual Setup

This is a documentation of manually setting up the New Matter MOD-t after the company has closed down, thus making the New Matter store inaccessible.

## Setup

1. Install MOD-t Printer Tool app. The latest working version is `v1.5.5`.

2. Open MOD-t Printer Tool app and connect the printer via USB to your computer. Update the firmware to the latest (`v1.0.0`). This will disable Wi-Fi on the printer, but this is the only way to get it working unfortunately.

3. Once complete, the status of the printer should now be idle. You can now perform clear nozzle procedure using the included `clearnozzle.gcode` file.

## Printing a Custom 3D Model

1. Design the 3D model using your software of choice, i.e. Maya, Blender, etc.
2. From the 3D modeling software, export the model as `.stl` file.
3. Download the latest [Ultimaker Cura](https://ultimaker.com/software/ultimaker-cura) (latest working version is `v4.6.2`). Cura is used to slice the export model into `.gcode` so the MOD-t knows how to print it.
4. Configure Cura:
    1. Add a new non-networked printer. From the list of printers, under **Custom**, select **Custom FFF printer**.
    2. Name it `MOD-t`
    3. From the **Machine Settings** of this new printer, adjust the following **Printer Settings** (unless specified, leave everything else as defualt):

      ```
      X (Width): 150 mm
      Y (Depth): 100 mm
      Z (Height): 125 mm
      Build plate shape: Rectangular
      Origin at center: checked
      Heated bed: unchecked
      Heated build volume: unchecked
      G-code flavor: Marlin
      ```
    4. From the **Machine Settings** of this new printer, adjust the following **Printhead Settings** (unless specified, leave everything else as default):

      ```
      X min: -20 mm
      Y min: -10 mm
      X max: 10 mm
      Y max: 10 mm
      Gantry Height: 125 mm
      Number of Extruders: 1
      Shared Heater: unchecked
      ```
    5. For **Start G-code**, use the following:

      ```
      G90
      G1 F300 Z1
      G1 F5000 X77 Y26
      G1 F300 Z0.315
      G92 E0
      G1 F2520 X77 Y-45 E4
      G1 F2520 X77.5 Y-45 E4.05
      G1 F2520 X77.5 Y26 E8
      G1 F5000 X77.25 Y26
      G92 E0
      G1 F2520 X77.25 Y-45 E4
      G1 F2520 X77.75 Y-45 E4.05
      G1 F2520 X77.75 Y26 E8
      G1 F5000 X77 Y0
      G1 F300 Z1
      G1 X0 Y0 F5000
      G92 E0
      ```
    6. For **End G-code**, use the following:

      ```
      G92 E0
      G1 E-2 F200 ; Retract the filament a bit before lifting the nozzle, to release some of the pressure
      G1 Z127 F300
      G0 X0 Y35 F3000 ; Move build tray front and center, Leave room to remove build surface
      M104 S0
      M107 ; Fan Off
      M84 ; Motors off
      ```
    7. Under **Extruder 1**, adjust the following (unless specified, leave everything else as default):

      ```
      Nozzle size: 0.4 mm
      Compatible material diameter: 1.75 mm
      Nozzle offset X: 0 mm
      Nozzle offset Y: 0 mm
      Cooling Fan Number: 0
      ```
    8. Done with machine settings. Now create a profile for this machine. From the **Print settings** panel under **Profile** dropdown, select **Manage Profiles...** and import the included `.curaprofile` file to add the new profile.
5. Open the exported `.stl` file in Cura. Ensure that the dimensions are correct and apply scaling accordingly.
6. Slice the model and save the `.gcode` file.
7. Open MOD-t Printer Tool and select **Print GCODE File**, then choose the previously saved `.gcode` file.
8. Done.

## Using Blender to Create a 3D Model

> Last working version: `2.83.3`

Blender is free, so it is an appealing choice of 3D modeling software. When using Blender for Cura and MOD-t, it is best the change the unit system so it can be imported as-is into Cura.

1. Bring up scene settings panel.
2. Under **Units**, change **Length** to `Millimeters`.
3. Under **Units**, change **Unit Scale** to `0.001`.

## Caveats

1. By following the above setup procedures, the printed model is short about 0.5 mm (in z-axis). The Cura printer profile probably needs further calibration.

## Resources

- [New Matter Subreddit](https://www.reddit.com/r/newmatter/)
- [Google Group](https://groups.google.com/g/mod-t)
