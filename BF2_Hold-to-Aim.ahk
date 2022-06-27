; 
; Battlefield 2 hold-to-aim V1.0
; Author:			SelfAndrewKB
; 
; The full readme and changelog are available at https://github.com/selfAndrewKB/battlefield2-holdaim


#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1

; --- USER-EDITABLE VARIABLES ------------------------------------------------------

; How long (in milliseconds) should the Right Mouse be held down for it to be
; detected as a button-hold and not a button-tap? 
; The default value of 115 is the upper 95 % CI of 200 of my own mouse-taps. 
; You might try a larger number like 156 (95 % of my button-taps were 156 ms 
; or faster) or 171 (99 % of my taps were 171 ms or faster).
; DEFAULT:    hold_threshold := 115
hold_threshold := 70


; How often (in milliseconds) should the script check whether the aim mode needs 
; to be reset?
; Sometimes the game pops you out of aim mode, like when you walk too close to 
; a wall. You can also do it to yourself by sprinting during aiming. At these 		(<--- Currently unused, intended for another game but might be useful one day)
; times the script might becomes confused about your actual state, so it will 
; check at regular intervals to ensure that its internal state matches what 
; you're doing in the game.
; DEFAULT:    sync_interval := 10
;sync_interval := 10


; --- END OF USER-EDITABLE VARIABLES -----------------------------------------------


in_aim_mode := FALSE

;SetTimer, Reset_Aim_Mode, %sync_interval%,

#IfWinActive, BF2,

{
    ~$^RButton::Press_RMB(in_aim_mode, "RButton", hold_threshold)

	~$^RButton Up::Release_RMB(in_aim_mode)
    
    ~$RButton::Press_RMB(in_aim_mode, "RButton", hold_threshold)
	
	~$RButton Up::Release_RMB(in_aim_mode)
	
	~$LButton Up::Release_LMB(in_aim_mode)
	
	~LShift & RButton::Press_RMB_Shift(in_aim_mode, "RButton", hold_threshold)
	
	~0::Suspend
	
}

Press_RMB(ByRef aiming, trigger_key, hold_time) 
{
	if (aiming == FALSE)
	{
		Click, Down R
		Sleep, 50
		Click, Up R
	}
	
    
	Sleep, hold_time
    
	if (GetKeyState(trigger_key, "P") == 1)
	{
		aiming := TRUE
	}

}


Press_RMB_Shift(ByRef aiming, trigger_key, hold_time) ; This is needed in case the sprint key is being held when the right mouse button is pressed.
{
	if (aiming == FALSE)
	{
		Click, Down R ; No "Click Up R". Crucial difference.
		Sleep, 50
	}
    
	Sleep, hold_time
    
	if (GetKeyState(trigger_key, "P") == 1)
	{
		aiming := TRUE
	}	
}


Release_RMB(ByRef aiming) 
{
    if (aiming == TRUE and GetKeyState("LButton", "P") == 0)
    {
		Click, Up R		; This is needed in case Press_Key_Shift was the preceding function. Releases the right mouse button if already held.
		Sleep, 50
		Click, Down R
		Sleep, 50
		Click, Up R
		aiming := FALSE
    }
}

Release_LMB(ByRef aiming) 
{
    if (aiming == TRUE and GetKeyState("RButton", "P") == 0) ; This function is needed if the left mouse button is still being held when the right is released. Its purpose is to stop the ADS when done shooting.
    {														 ; The calls to Sleep could probably use some fine-tuning.
		Sleep, 150
		Click, Down R
		Sleep, 50
		Click, Up R
		aiming := FALSE
    }
}


;Reset_Aim_Mode:
;"""Currently unused""".

    if (in_aim_mode == TRUE and GetKeyState("RButton", "P") == 0)
    {
        in_aim_mode := FALSE
		;Sleep, 100
		;SendInput {RButton}
		;Click, Down R
		;Sleep, 50
		;Click, Up R
		;tooltip NEEDS RESET
    }
	
;Reset_Aim_Mode()
;"""(Function version of Reset_Aim_Mode, might be useful someday)"""
;{
;	;sleep, 500
;    ;in_aim_mode := FALSE
;	Sleep, 500
;	SendInput {RButton}
;	Click, Down R
;	Sleep, 50
;	Click, Up R
;	tooltip NEEDS RESET
;}

return