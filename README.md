## Donut Label Printing Automation

This AutoHotKey script automates the input and printing of spindle labels from ZebraDesigner. This could easily be altered to print any kind of ZebraDesigner template. Included is a sample template file named "Donut Labels.lbl"

### Requirements
* AutoHotKey must be installed on the machine running "Print Donut Labels.ahk".
* A ZebraDesigner template file (default is "Donut Labels.lbl").
* ZebraDesigner software installed and configured to use a Zebra printer as the default printer option.

### Before first run
1. Update label file name (line #28).
2. Adjust required barcode length (line #51).
3. Adjust the number of characters trimmed from the left side of the scanned barcode (line #58).

### Usage
1. Run **"Print Donut Labels.ahk"**.
2. Scan barcode into open dialog box
3. Wait for label to print
4. Repeat!