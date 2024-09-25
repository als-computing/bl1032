List of changes
===============
06/24/2024: 
- added substraction of two processed XAS spectra
- added crop raw XAS spectra
- GUI modified
-------------------------------------------------------------------
07/29/2024:
- added division of two processed XAS spectra
- added automatic deadtime correction of raw XRF maps
- added regular XAS spot location
- added substraction of XFS spectra
- added XRF histogram
- added average of processed spectra
- GUI modified
- added more details to the manual and documented new features.
-------------------------------------------------------------------
08/15/2024:
- added 1st derivative of XAS spectra.
- refined XAS energy calibration with Io glitch.
- updated legend in the substract spectra plot.
- updated legend in the divide spectra plot.
- in XAS process spectrum, removed two warning messages.
- added the .txt file option to choose from for the stack plot processed, to allow to plot standards.
- updated legend in the XAS average spectrum plot and updated filename
- updated legend for division and substraction of spectra
- added autosave the substraction of XFS spectra and fixed legend
- GUI modified.
- manual updated.
---------------------------
09/09/24
- refined 1s derivative routine
- crop raw XAS for .dat files got fixed
------------------
09/15/24
- 1st derivative: added .txt files (in addition to .xls files); and name of corresponding file got fixed
- removed automatic deadtime correction of raw XRF maps. The software can only read maps that have been deadtime corrected at the beamline.
----------------
09/17/2024
- changed the filename of the autosaved average spectrum, so that > 10 spectra can be averaged and saved.
- stackplot of the .dat files fixed
- Fe_XAS_database_1032 expanded
----------------------------------
09/19/2024
- Fe_XAS_database_1032 expanded
- Fe_standards_VP expanded
- Valence plot figure GUI updated, restricted to .e files (ascii) that can be opened.
-------------------------
09/20/2024
- added .dat files to "stack plot raw"
- in process spectra: saved the file in eV instead of keV, so that they can be stacked in Stack Plot
------------------------