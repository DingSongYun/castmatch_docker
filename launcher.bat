@echo off
PUSHD ..
SET WORKSPACE_DIR=%cd%
POPD
SET IMAGE_NAME="cast_match"
SET CONTAINER_NAME="cast_match"
@echo on

@goto begin

:begin
@if "%1" == "status" goto status
@if "%1" == "build" goto build
@if "%1" == "start" goto start_iamge
@if "%1" == "attach" goto attach
@if "%1" == "stop" goto stop
@if "%1" == "clean_containers" goto clean_containers
@if "%1" == "clean_image" goto clean_image
exit

:status
@echo -------------images-------------
@call docker images
@echo.
@echo -------runing containers--------
@call docker ps
exit

:build
call docker build -t %IMAGE_NAME% .
exit

:start_iamge
docker run -d -it --rm -p 8001:8001 -p 20022:22 -p 3306:3306 --name %CONTAINER_NAME% %IMAGE_NAME% /bin/bash
call docker start %CONTAINER_NAME%
exit

:attach
call docker attach %CONTAINER_NAME%
exit

:stop
@for /f "delims=" %%i in ('call docker ps -a -q') do docker stop %%i
exit

:clean
exit

:clean_image
@if "%2" == "" echo need image id 
@else docker rmi "%2"
exit

:clean_containers
@for /f "delims=" %%i in ('call docker ps -a -q') do docker rm %%i
exit