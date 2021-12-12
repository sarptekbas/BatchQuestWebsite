@echo off
title=BatchQuest Update Helper
echo a>>internal\temp\updating
if exist yeshitempftp.txt del yeshitempftp.txt
if "%cd:~-10%"=="BatchQuest" cd..

cls
echo Updating BatchQuest...
echo.
echo.
echo.
echo Creating folders...
echo.

for %%a in (BatchQuest BatchQuest\internal BatchQuest\internal\levels BatchQuest\internal\levels\unconverted BatchQuest\internal\scripts) do (
	echo Creating folder "%%a"...
	if exist %%a\nul (
		echo Folder "%%a" already exists, skipped.
	)
	if NOT exist %%a\nul (
		if NOT "%cd:~-10%"=="BatchQuest" mkdir %%a
		if exist %%a\nul echo Created folder "%%a" successfully.
		if NOT exist %%a\nul (
			echo Failed to create folder "%%a".
			goto fail
		)
	)
)

if NOT "%cd:~-10%"=="BatchQuest" cd BatchQuest

echo.
echo.
echo.
echo Deleting old files...
echo.

for %%a in (RUN.bat internal\levels\cave1.bat internal\levels\converter.bat internal\levels\fasttravelmap.bat internal\levels\town1.bat internal\levels\town1_sub1.bat internal\levels\unconverted\cave1.bat internal\levels\unconverted\template.bat internal\levels\unconverted\tiles.txt internal\levels\unconverted\town1.bat internal\levels\unconverted\town1_sub1.bat internal\levels\unconverted\uistuff.txt internal\scripts\bg.exe internal\scripts\changemode.bat internal\scripts\checksavefile.bat internal\scripts\clearlist.bat internal\scripts\clearlist2.bat internal\scripts\dialoguebox.bat internal\scripts\endfade.bat internal\scripts\gameconnection.bat internal\scripts\getfile.bat internal\scripts\giveitem.bat internal\scripts\inventorysprites.bat internal\scripts\main.bat internal\scripts\mouse.bat internal\scripts\prepcraftingmenu.bat internal\scripts\prepitemmenu.bat internal\scripts\save.bat internal\scripts\shop.bat internal\scripts\startfade.bat internal\scripts\testforitem.bat) do (
	echo Deleting file "%%a"...
	if NOT exist %%a (
		echo File "%%a" doesn't exist, skipped.
	)
	if exist %%a (
		del %%a >nul
		if exist %%a (
			echo Failed to delete file "%%a".
			goto fail
		)
		if NOT exist %%a echo Deleted file "%%a" successfully.
	)
)

echo.
echo.
echo.
echo Preparing to download...
echo.

if exist yeshitempftp.txt del yeshitempftp.txt
echo open>>yeshitempftp.txt
echo ftp.batchquest.com>>yeshitempftp.txt
echo user>>yeshitempftp.txt
echo user>>yeshitempftp.txt

for %%a in (RUN.bat internal\levels\cave1.bat internal\levels\converter.bat internal\levels\fasttravelmap.bat internal\levels\town1.bat internal\levels\town1_sub1.bat internal\levels\unconverted\cave1.bat internal\levels\unconverted\template.bat internal\levels\unconverted\tiles.txt internal\levels\unconverted\town1.bat internal\levels\unconverted\town1_sub1.bat internal\levels\unconverted\uistuff.txt internal\scripts\bg.exe internal\scripts\changemode.bat internal\scripts\checksavefile.bat internal\scripts\clearlist.bat internal\scripts\clearlist2.bat internal\scripts\dialoguebox.bat internal\scripts\endfade.bat internal\scripts\gameconnection.bat internal\scripts\getfile.bat internal\scripts\giveitem.bat internal\scripts\inventorysprites.bat internal\scripts\main.bat internal\scripts\mouse.bat internal\scripts\prepcraftingmenu.bat internal\scripts\prepitemmenu.bat internal\scripts\save.bat internal\scripts\shop.bat internal\scripts\startfade.bat internal\scripts\testforitem.bat) do (
	echo Preparing to download file "%%a"...
	echo get>>yeshitempftp.txt
	echo BatchQuest\%%a>>yeshitempftp.txt
	echo %%a>>yeshitempftp.txt
)

echo bye>>yeshitempftp.txt

echo.
echo.
echo.
echo Downloading files...
echo.

ftp -v -s:yeshitempftp.txt >nul

echo.
echo.
echo.
echo Verifying files...
echo.

for %%a in (RUN.bat internal\levels\cave1.bat internal\levels\converter.bat internal\levels\fasttravelmap.bat internal\levels\town1.bat internal\levels\town1_sub1.bat internal\levels\unconverted\cave1.bat internal\levels\unconverted\template.bat internal\levels\unconverted\tiles.txt internal\levels\unconverted\town1.bat internal\levels\unconverted\town1_sub1.bat internal\levels\unconverted\uistuff.txt internal\scripts\bg.exe internal\scripts\changemode.bat internal\scripts\checksavefile.bat internal\scripts\clearlist.bat internal\scripts\clearlist2.bat internal\scripts\dialoguebox.bat internal\scripts\endfade.bat internal\scripts\gameconnection.bat internal\scripts\getfile.bat internal\scripts\giveitem.bat internal\scripts\inventorysprites.bat internal\scripts\main.bat internal\scripts\mouse.bat internal\scripts\prepcraftingmenu.bat internal\scripts\prepitemmenu.bat internal\scripts\save.bat internal\scripts\shop.bat internal\scripts\startfade.bat internal\scripts\testforitem.bat) do (
	echo Verifying file "%%a"...
	if NOT exist %%a (
		echo Failed to verify file "%%a".
		goto fail
	)
	echo Verified file "%%a" successfully.
)

echo.
echo.
echo.
echo Cleaning up...
echo.

for %%a in (yeshitempftp.txt) do (
	echo Deleting file "%%a"...
	if NOT exist %%a (
		echo File "%%a" doesn't exist, skipped.
	)
	if exist %%a (
		del %%a >nul
		if exist %%a (
			echo Failed to delete file "%%a".
			goto fail
		)
		if NOT exist %%a echo Deleted file "%%a" successfully.
	)
)

echo.
echo.
echo.
echo BatchQuest has been successfully downloaded and installed.
echo.
echo For support, news, sneak peaks, discussion, and more, join
echo the BatchQuest Discord server.
echo.
echo.
echo.
echo.
echo.
echo Press "E" to join the Discord.

goto endloop

:fail
echo.
echo.
echo.
echo Failed to update BatchQuest.
echo Please get a new copy from the BatchQuest Discord server.
echo.
echo.
echo.
echo.
echo.
echo Press "E" to join the Discord.

choice -c em -n >nul
if %errorlevel%==1 start https://discord.gg/Kqdh75D43P
goto fail

:endloop
choice -c em -n >nul
if %errorlevel%==1 start https://discord.gg/Kqdh75D43P
goto endloop
