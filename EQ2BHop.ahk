#SingleInstance Force
SetTitleMatchMode 2
SetKeyDelay, -1, -1
SetBatchLines -1

SleepDuration = 5
TimePeriod = 3

XButton1::
	Send {Pause Down}
	DllCall("Winmm\timeBeginPeriod", UInt, TimePeriod)
	Loop
	{
		GetKeyState, SpaceState, XButton1, P
			If SpaceState = U
				break

		DllCall("Sleep", UInt, SleepDuration)
		Send {Space}
	}
	DllCall("Sleep", UInt, SleepDuration)
	Send {Pause Up}
	DllCall("Winmm\timeBeginPeriod", UInt, TimePeriod)
	Loop, 100
	{
		DllCall("Sleep", UInt, SleepDuration)
		Send {Space}{Pause Up}
	}
Return