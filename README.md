# Winnitron Launcher keep-awake

This requires Winnitron Launcher v2.1 or greater. *It will not work with v2.0.*

Despite all our best efforts, sometimes the Winnitron Launcher crashes. This script checks that process is running (the launcher writes its pid and executable path to a file on launch) and then restarts it if it's not running.

Ain't pretty but the more failsafes the better, I say.

## Installation and usage

[Download the exe file from the releases page.](https://github.com/winnitron/launcher_keep_awake/releases) All you have to do is run it on your Winnitron (for example, have it run on startup along with the Launcher). On starting, `launcher_keep_awake` waits five minutes, and then begins checking for a running instance of the Launcher every 30s thereafter.



