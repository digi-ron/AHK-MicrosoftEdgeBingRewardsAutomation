# AHK-MicrosoftEdgeBingRewardsAutomation
AHK Script to automate the daily searches for MS Edge

This script was made with AHK V1.1.33.10, and while it is not a particularly complex script (sub 50 lines) it is a reasonable example of automation using AHK for repetitive tasks

---

## Prerequisites
- Edge Chromium (any modern version of Windows 10 should have this pre-installed)
- make sure you are signed into your MS account in Bing on Edge, so that you can get your points automatically
- AutoHotKey (once installed, script can be compiled to a *.exe file if required)
- a words.txt file in the same directory as the script. The file I used when creating this file is from dwyl's repo [HERE](https://github.com/dwyl/english-words/blob/master/words.txt), but any file with different words on every line and no commas will work fine (not included as it isn't mine to include)

---

## Usage
### Edge-Rewards-WindowsF2.ahk
This script will not run until the hotkey is pressed, and sits in wait until then
- run script
- press Windows+F2
- wait for the messagebox to show saying "Automation Complete. Exiting" and press OK

### Edge-Rewards-Automatic.ahk
This script is designed to be run as a scheduled task or as a simple shortcut as required:
- run script
- wait for the messagebox to show saying "Automation Complete. Exiting" and press OK

---

## Limitations
- I could never get AHK to kill all the PIDs for msedge.exe reliably, so once the script is complete it's up to the user to close the window with 30 tabs it creates. I believe this could be done by looping while not an error, but as this is just so I can continue living in my Google-Centric bubble and occasionally claim stuff from MS, I decided this was acceptable
- Windows only, because AutoHotKey was Windows only last I checked, also even if it was cross compatible it references a folder structure that doesn't exist outside of Windows
- This script assumes your main drive is "C:\\" and that the host system is 64-Bit. It's only coded in one location in the script so if this is not the case then just change that path string
- This **_will_** mess up your search history with a bunch of nonsense searches if you care about that
- UPDATE 01/12/2023 - The script is getting flaky seemingly because Bing is getting smarter against automated searches. I've added some URL params that it seems to expect and randomized the wait time to combat this, but it may not register every search anyways.