@echo off
Rem This script just copies "segoeui.ttf" from your OS fonts if possible.
if exist "C:\Windows\Fonts\segoeui.ttf" (
    copy "C:\Windows\Fonts\segoeui.ttf" "%cd%\segoeui.ttf"
    echo Copied segoeui.ttf to current directory!
) else (
    echo Could not find segoeui.ttf!
)