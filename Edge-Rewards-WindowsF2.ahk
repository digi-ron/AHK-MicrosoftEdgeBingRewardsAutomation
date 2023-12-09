; developer variables
TEXTFILEPATH := A_WorkingDir . "\words.txt"
PROCNAME := "msedge.exe"

;working code
Loop, read, %TEXTFILEPATH%
{
	TEXTFILELENGTH := A_Index
}

if TEXTFILELENGTH <= 0
{
	msgbox EMPTY WORD FILE!! Exiting...
	exit
}

#F2::
{
	Loop, 34
	{
		phrase := RWG()
		Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ""%phrase%"", A_WorkingDir, Max, edgePID
		; wait for bing to recognize the search
		; randomized because bing seems to be getting smarter
		Random, SleepTime, 5000, 10000
		sleep, %SleepTime%
		phrase := ""
		sleep 1000
	}
	MsgBox Automation Complete. Exiting...
	Loop {
		Process, Close, % PROCNAME
		Process, Exist, % PROCNAME  ; Improves reliability in some cases.
	} Until not ErrorLevel
	ExitApp
}

; description: this simply chooses 3 random words from a words.txt file in the same directory
RWG()
{
	global TEXTFILEPATH
	global TEXTFILELENGTH
	
	Random, Word1Index, 1, %TEXTFILELENGTH%
	Random, Word2Index, 1, %TEXTFILELENGTH%
	
	FileReadLine, Word1, %TEXTFILEPATH%, %Word1Index%
	FileReadLine, Word2, %TEXTFILEPATH%, %Word2Index%

	outputVariable := "bing.com/search?q=" . Word1 . "%20" . Word2 . "&qs=n&form=QBRE&sp=-1&lq=0&pq=" . Word1 . "&sc=11-6&sk=&ghsh=0&ghacc=0&ghpl="
	
	return %outputVariable%
}