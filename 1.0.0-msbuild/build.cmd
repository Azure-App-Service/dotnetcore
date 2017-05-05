@echo off
setlocal

set FRAMEWORK=dotnetcore1.0
set TEST_IMAGE_TAG=%USERNAME%/dotnetcore:1.0.0-msbuild
set ZIPFILE=bin.zip

pushd src
dotnet restore -r=%FRAMEWORK%
if ERRORLEVEL 1 goto :eof
rd/s/q .\publish
dotnet publish -o .\publish
if ERRORLEVEL 1 goto :eof

echo Zipping publish.
if exist ..\%ZIPFILE% del ..\%ZIPFILE%

REM You need zip.exe here...
cd publish
zip -r ..\..\%ZIPFILE% .
if ERRORLEVEL 1 goto :eof

echo Building a docker image as tag: %TEST_IMAGE_TAG%.
popd
docker build --rm -t %TEST_IMAGE_TAG% .
echo Done. Image tag is: %TEST_IMAGE_TAG%
