@echo off
setlocal

rem ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
rem �ݒ�t�@�C��(setteing.ini)��ϐ��Ɋi�[
rem _______________________________________
set THIS_PATH=%~dp0
set SETTING_FILE_PATH=%THIS_PATH%setteing.ini
for /f "tokens=1,* delims==" %%a in (%SETTING_FILE_PATH%) do (
	set %%a=%%b
)

rem ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
rem 7zip�̎��s�t�@�C�������邩�`�F�b�N��
rem ����ꍇ�݈̂��k�����s����
rem _______________________________________
if exist %SEVEN_ZIP_PATH% (
	rem �����̃t�@�C�����ׂĂ����[�v�ň��k
	rem ���k���@�F7z,�����k
	for %%f in (%*) do (
	  %SEVEN_ZIP_PATH% a -t7z -mx=9 %%f.7z %%f
	)
) else (
	rem 7zip�̎��s�t�@�C�����Ȃ��̂ŃG���[�o��
	echo �w�肳�ꂽ�p�X��7zip������܂���ł����B�������p�X��ݒ肵�Ă�������
	echo �ݒ肳��Ă���p�X:%SEVEN_ZIP_PATH%
)

pause
