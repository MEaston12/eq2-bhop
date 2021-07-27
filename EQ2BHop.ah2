#SingleInstance Force
SetTitleMatchMode 2
SetKeyDelay -1, -1

SleepDuration := 5
TimePeriod := 3

targetKey := "XButton1"

HotIfWinActive("ahk_exe EverQuest2.exe")
XButton1::{
	Send("{Pause Down}")
	;this sets the resolution for the sleep function
	DllCall("Winmm\timeBeginPeriod", "UInt", TimePeriod)
	Loop {
		If(GetKeyState("XButton1", "P") == 0) {
			break
		}
		DllCall("Sleep", "UInt", SleepDuration)
		Send("{Space}")
	}
	DllCall("Sleep", "UInt", SleepDuration)
	Send("{Pause Up}")
	Loop 100 {
		DllCall("Sleep", "UInt", SleepDuration)
		Send("{Space}")
	}
	DllCall("Winmm\timeEndPeriod", "UInt", TimePeriod)
}