@echo off
echo Descargando JavaFX...
if not exist "javafx" mkdir javafx
cd javafx

if not exist "javafx-17.0.2.zip" (
    echo Descargando JavaFX 17.0.2...
    powershell -Command "Invoke-WebRequest -Uri 'https://download2.gluonhq.com/openjfx/17.0.2/openjfx-17.0.2_windows-x64_bin-sdk.zip' -OutFile 'javafx-17.0.2.zip'"
)

if not exist "javafx-sdk-17.0.2" (
    echo Extrayendo JavaFX...
    powershell -Command "Expand-Archive -Path 'javafx-17.0.2.zip' -DestinationPath '.'"
)

cd ..
echo Ejecutando L2smr...
java --module-path "javafx\javafx-sdk-17.0.2\lib" --add-modules javafx.controls,javafx.fxml,javafx.base,javafx.graphics,javafx.swing -jar build\libs\L2smr.jar

pause
