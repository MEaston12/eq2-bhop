#SingleInstance Force
SetTitleMatchMode 2
SetKeyDelay -1, -1

SleepDuration := 5
TimePeriod := 3

activateKey := "XButton1"
floatKey := "Pause"

JumpMash(thisHotkey) {
	Send("{" floatKey " Down}")
	;this sets the resolution for the sleep function
	DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
	Loop {
		If(GetKeyState(activateKey, "P") == 0) {
			break
		}
		DllCall("Sleep", "UInt", SleepDuration)
		Send("{Space}")
	}
	DllCall("Sleep", "UInt", SleepDuration)
	Send("{" floatKey " Up}")
	Loop 100 {
		DllCall("Sleep", "UInt", SleepDuration)
		Send("{Space}")
	}
	DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)
}

HotIfWinActive("ahk_exe EverQuest2.exe")
Hotkey(activateKey, JumpMash)