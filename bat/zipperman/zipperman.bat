@echo off
setlocal

rem ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
rem 設定ファイル(setteing.ini)を変数に格納
rem _______________________________________
set THIS_PATH=%~dp0
set SETTING_FILE_PATH=%THIS_PATH%setteing.ini
for /f "tokens=1,* delims==" %%a in (%SETTING_FILE_PATH%) do (
	set %%a=%%b
)

rem ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
rem 7zipの実行ファイルがあるかチェックし
rem ある場合のみ圧縮を実行する
rem _______________________________________
if exist %SEVEN_ZIP_PATH% (
	rem 引数のファイルすべてをループで圧縮
	rem 圧縮方法：7z,超圧縮
	for %%f in (%*) do (
	  %SEVEN_ZIP_PATH% a -t7z -mx=9 %%f.7z %%f
	)
) else (
	rem 7zipの実行ファイルがないのでエラー出力
	echo 指定されたパスに7zipがありませんでした。正しいパスを設定してください
	echo 設定されているパス:%SEVEN_ZIP_PATH%
)

pause
