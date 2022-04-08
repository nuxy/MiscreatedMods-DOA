--
-- Create a Shortcut link when the user exits the game.
--
-- This process works as follows:
--   1) Create/run BATCH script when game client disconnects from the server.
--   2) BATCH creates new VB script to create Shortcut LNK on user Desktop.
--   3) Execute, cleanup, and Profit!
--
-- Resulting LNK will remove Mods/ directory prior to launching the game.
--
function Miscreated.Client:OnDisconnect(cause, desc)
	--Log(">> Miscreated.Client:OnDisconnect")

	if tonumber(cause) == 17 then
		local outfile = "ModsDirectoryCleanup.bat"
		local script = [[
@ECHO OFF

SET GAMEDIR=%1

IF NOT EXIST %GAMEDIR%\ (
	ECHO Not found: %GAMEDIR%
	EXIT
)

SET OUTDIR=%SYSTEMDRIVE%%HOMEPATH%\Desktop

IF NOT EXIST %OUTDIR%\ (
	ECHO Not found: %OUTDIR%
	EXIT
)

IF EXIST %OUTDIR%\Miscreated.lnk (
	ECHO Shortcut exists. Exiting..
	EXIT
)

SET NAME=ModsDirectoryCleanup
SET TMPOUT=%NAME%.vbs

ECHO Set shell = WScript.CreateObject("WScript.Shell") > %TMPOUT%
ECHO Set link = shell.CreateShortcut("%OUTDIR%\Miscreated.lnk") >> %TMPOUT%
ECHO link.Description = "Miscreated (D.O.A. %NAME%)" >> %TMPOUT%
ECHO link.WorkingDirectory = "%GAMEDIR%" >> %TMPOUT%
ECHO link.TargetPath = "C:\Windows\System32\cmd.exe" >> %TMPOUT%
ECHO link.Arguments = "/c RMDIR /s /q %GAMEDIR%\Mods & %GAMEDIR%\Miscreated.exe" >> %TMPOUT%
ECHO link.IconLocation = "C:\Program Files (x86)\Steam\steam\games\1ae20339de3855d8b1eb362854b49428132c96a0.ico" >> %TMPOUT%
ECHO link.Save >> %TMPOUT%

CSCRIPT %TMPOUT%
DEL %TMPOUT%
]]

		fh = io.open(outfile, "w")
		fh:write(script)
		fh:close()

		-- Run BAT script in a subshell.
		os.execute(outfile .. " %CD%")
		os.remove(outfile)
	end
end
