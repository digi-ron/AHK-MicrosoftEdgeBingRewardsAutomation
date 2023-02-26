; developer variables
TEXTFILEPATH := A_WorkingDir . "\words.txt"

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
	Loop, 30
	{
		phrase := RWG()
		Run, "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" ""%phrase%"", A_WorkingDir, Max, edgePID
		; wait for bing to recognize the search
		sleep, 5000
		phrase := ""
		sleep 1000
	}
	MsgBox Automation Complete. Exiting...
	ExitApp
}

; description: this simply chooses 3 random words from a words.txt file in the same directory
RWG()
{
	global TEXTFILEPATH
	global TEXTFILELENGTH
	
	Random, Word1Index, 1, %TEXTFILELENGTH%
	Random, Word2Index, 1, %TEXTFILELENGTH%
	Random, Word3Index, 1, %TEXTFILELENGTH%
	
	FileReadLine, Word1, %TEXTFILEPATH%, %Word1Index%
	FileReadLine, Word2, %TEXTFILEPATH%, %Word2Index%
	FileReadLine, Word3, %TEXTFILEPATH%, %Word3Index%
	
	outputVariable := "bing.com/search?q=" . Word1 . "`%20" . Word2 . "`%20" . Word3
	
	return %outputVariable%
}