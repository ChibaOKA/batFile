@echo off
rem sourceフォルダ内のすべてのファイルをdestinetionフォルダに移動
rem エラー処理の結果＝ログ出力はfile_migration.txtとしてlogフォルダへ出力。

rem 移動元フォルダ名：source
rem 移動先フォルダ名：destination


rem ログファイルを格納するフォルダを作成
if not exist log mkdir log


rem 移動元フォルダにあるすべてのファイルを移動先フォルダに移動
move source\*.* destination


rem 移動元フォルダが見つからない
if not exist source (
	echo %date% %time%  移動元フォルダsourceが見つかりません。 >> log/file_migration.txt 
	echo %date% %time%  移動対象のファイルが見つかりませんでした。>> log/file_migration.txt 
	exit /b
)

rem 移動先フォルダが見つからない
if not exist destination (
	echo %date% %time%  移動先フォルダdestinationが見つかりません。 >> log/file_migration.txt 
)


rem エラーの場合は処理を即時終了
if %errorlevel% neq 0 (
	echo %date% %time%  次のファイルの移動に失敗しました。 >> log/file_migration.txt 
	dir /b /a-d source\*.*  >> log/file_migration.txt
	exit /b
)

rem ログを出力
echo %date% %time%  ファイルの移動が完了しました >> log/file_migration.txt

exit /b
