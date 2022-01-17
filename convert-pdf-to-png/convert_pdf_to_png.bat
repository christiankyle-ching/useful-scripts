@REM INSTALL FIRST
@REM ImageMagick : https://imagemagick.org/script/download.php#windows
@REM GhostScript : https://www.ghostscript.com/releases/gsdnld.html

@REM Renames PDFs with a prefix and suffix
@REM then converts them to PNGs
@REM Make sure to PLACE the PDF files within the SAME folder as this script

@echo OFF

@REM Set Prefix and Suffix after = sign
@REM Example:
@REM SET "_prefix=Your Name Here - "
SET /P "_prefix=Enter filename prefix: "
SET /P "_suffix=Enter filename suffix: "

@REM Check whether ImageMagick is installed
where magick || GOTO install_first

MD output\PNGs

@REM COPY PDFs with prefix and suffix
FOR %%i IN (*.pdf) DO COPY "%%i" ".\output\%_prefix%%%i%_suffix%"

@REM Convert PDFs to PNGs inside a folder
cd output
FOR %%i IN (*.pdf) DO (
    magick "%%i" ".\PNGs\%%i.PNG" && ECHO SUCCESS: Converted %%i to PNG || GOTO install_first
)
cd ..

GOTO :EOF

:install_first
ECHO ERROR: Failed to convert. Please make sure to install the following:
ECHO.
ECHO ImageMagick : https://imagemagick.org/script/download.php#windows
ECHO GhostScript : https://www.ghostscript.com/releases/gsdnld.html
pause
EXIT 1
