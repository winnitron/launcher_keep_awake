#Persistent
#SingleInstance Force

debug := true

WriteLog("----")

EnvGet, homeDrive, HOMEDRIVE
EnvGet, homePath, HOMEPATH

pidFile := homeDrive . homePath . "\winnitron.pid"

WriteLog(pidFile)

delay = 30000
launcherPid := ""
launcherExe := ""

Sleep, 300000

Loop
{
	UpdatePid()
	RelaunchIfNotRunning()
	Sleep, %delay%
}

ExitApp

UpdatePid() {
	global launcherPid, launcherExe, pidFile
	
	FileReadLine, launcherPid, %pidFile%, 1
	
	if (!launcherExe) {
		WriteLog("reading exe for the first time")
		FileReadLine, launcherExe, %pidFile%, 2
	}
	
	WriteLog("error: " . ErrorLevel . " " . %A_LastError%)
	WriteLog("pid: " . launcherPid)
	WriteLog("exe: " . launcherExe)
}


RelaunchIfNotRunning() {
	global launcherPid, launcherExe
	
	if (!launcherPid || !launcherExe) {
		; i.e. there was no pid file, probably because the launcher hasn't been run for the first time yet
		WriteLog("no pid or exe loaded")
		return
	}
	
	Process, Exist, %launcherPid%
	{
		if (ErrorLevel == 0)
		{
			; process is not running
			WriteLog("LAUNCHER PROCESS NOT RUNNING. RELAUNCH")
			Run, %launcherExe%
		}
	}
}



WriteLog(message)
{
	global debug
	global start

	if (debug) {
		debugLog := "launcher_keep_awake.log"
		FileAppend,
		(
		%message%

		), %debugLog%, UTF-8
	}
}