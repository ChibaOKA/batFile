@echo off
rem source�t�H���_���̂��ׂẴt�@�C����destinetion�t�H���_�Ɉړ�
rem �G���[�����̌��ʁ����O�o�͂�file_migration.txt�Ƃ���log�t�H���_�֏o�́B

rem �ړ����t�H���_���Fsource
rem �ړ���t�H���_���Fdestination


rem ���O�t�@�C�����i�[����t�H���_���쐬
if not exist log mkdir log


rem �ړ����t�H���_�ɂ��邷�ׂẴt�@�C�����ړ���t�H���_�Ɉړ�
move source\*.* destination


rem �ړ����t�H���_��������Ȃ�
if not exist source (
	echo %date% %time%  �ړ����t�H���_source��������܂���B >> log/file_migration.txt 
	echo %date% %time%  �ړ��Ώۂ̃t�@�C����������܂���ł����B>> log/file_migration.txt 
	exit /b
)

rem �ړ���t�H���_��������Ȃ�
if not exist destination (
	echo %date% %time%  �ړ���t�H���_destination��������܂���B >> log/file_migration.txt 
)


rem �G���[�̏ꍇ�͏����𑦎��I��
if %errorlevel% neq 0 (
	echo %date% %time%  ���̃t�@�C���̈ړ��Ɏ��s���܂����B >> log/file_migration.txt 
	dir /b /a-d source\*.*  >> log/file_migration.txt
	exit /b
)

rem ���O���o��
echo %date% %time%  �t�@�C���̈ړ����������܂��� >> log/file_migration.txt

exit /b
