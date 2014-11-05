;
; Donut Label Printer: 1.0
; Language:       English
; Platform:       Win9x/NT
; Author:         Chris Krueger <ckrueger@ahml.info> 2013
;
; Script Function:
; Script uses ZebraDesigner and "Donut Labels.lbl" to print the last 8 numbers
; of an items bar code on a Computype pre-printed donut label.
;
; System Requirements:
; Zebra Thermal Transfer label printer
; Zebra Designer 1.0.1
; Donut Labels.lbl (Available through AHML)
; Computype pre-printed donut labels
;
; This work is licensed under a Creative Commons 
; Attribution-NonCommercial 4.0 International License.
; http://creativecommons.org/licenses/by-nc/4.0/
;
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Launch ZebraDesigner & wait for it to open
Run, C:\Labels\Donut Labels.lbl ;Update to match your template file name
Sleep, 1000
WinActivate, ZebraDesigner
WinWaitActive, ZebraDesigner
WinMaximize, ZebraDesigner

; Open GUI and request bar code
InputNum:
InputBox, Barcode, Print Donut Labels, Please Enter Barcode, , 250, 120
if ErrorLevel
    {
      ; If Cancel is clicked close ZebraDesigner and end program
      Winactivate, ZebraDesigner
      WinWaitActive, ZebraDesigner
      Send, {ALT DOWN}{F4}{ALT UP}
      exit
    }
; If no bar code scanned open re-open GUI
if Barcode = 
    Goto InputNum
    
; Check for valid bar code length (14 chars), if not display error    
Length := StrLen(Barcode)
If (Length != 14) ; Change match the length of your barcodes
  {
    msgbox, Not a valid barcode, please scan again.
    Goto InputNum
  }

; Trim "311840"
StringTrimLeft, TrimmedBarcode, Barcode, 6 ; Change to match number of characters to trim left of barcode

; Open ZebraDesigner for printing
WinActivate, ZebraDesigner
WinWaitActive, ZebraDesigner

; Open print dialog, send trimmed bar code, print
Send, {CTRL DOWN}p{CTRL UP}
WinWaitActive, Print

; Add space between first and second 4 digits
StringLeft, numleft, TrimmedBarcode, 4
StringRight, numright, TrimmedBarcode, 4
TrimmedBarcode = %numleft% %numright%

; Send fixed bar code to printer
Send, %TrimmedBarcode%
Send, {ENTER}

; Return to GUI
Goto InputNum
