; =============== JARED'S CUSTOM AHK SCRIPTS ===============


; ==== PureText - Paste's plain text when using Win+V ====
; Hotkeys: Win+V

#v::                             ; Text�only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return


; ==== Launches a new Notepad window (or activates an existing one) ====
; Hotkeys: Ctrl+Alt+N

^!n::
IfWinExist Untitled - Notepad
	WinActivate
else
	Run Notepad
return


; ==== Launches 1Password (or activates it) ====
; Hotkeys: Alt+p

!p::
If (WinExist 1Password)
{
	WinActivate     ; Activates 1Password
	Sleep 50        ; Wait 50 milliseconds so CTRL+F doesn't active in the other window
	Send ^f		; CTRL+F so search is focused
}
else
{
	Run 1Password
}
return


; ==== Hotstrings ====

; --- msgscrum > Stan, Tomas, Nik, Angelo, Alberto, Paulo, Oliver (Emails) ---
; Hotkeys: msgscrum+Tab

:oc:msgscrum::Stanislavb@madesimplegroup.com;tomasj@madesimplegroup.com;AngeloG@madesimplegroup.com;Albertoc@madesimplegroup.com;Paulom@madesimplegroup.com;oliverj@madesimplegroup.com;borisl@madesimplegroup.com


; --- ac > Acceptance Criteria ---
; Hotkeys: ac+Tab

:oc:ac::Acceptance Criteria


; --- us > User Story Markdown Template (multi-line and setting cursor position) ---
; Hotkeys: us+Tab

:oc:us::{#}{#}User Story`r`r- As a `r- I want `r- So that `r`r{#}{#}Requirements`r`r{Left 39}


; --- bug > Bug Story Markdown Template ---
; Hotkeys: bug+Tab

:oc:bug::{#}{#}Steps to reproduce`r`r`r{#}{#}What you expected to see`r`r`r{#}{#}What you saw instead`r{Left 54}

; --- refactor > Refactor story template ---
; Hotkeys: refactor+Tab

:oc:refactor::{#}{#}Current state`r`r`r{#}{#}Problem`r`r`r{#}{#}Solution`r`r`r{#}{#}Refactor goal`r{Left 43}


; --- auto close brackets and quotes ---
; ( => () AND [ => [] AND " => ""
;
; NB. the asterisk between the first two colons means 
; "ending character not required" (so you don't have to 
; press eg. 'tab' to get it to work - see: https://www.autohotkey.com/docs/Hotstrings.htm)
;
; if it gets annoying in some scenarios maybe take a look 
; at http://www.autohotkey.com/board/topic/44574-intelligent-auto-close-bracketbraceparen/


:*:(::(){Left 1}
:*:[::[]{Left 1}
:*:"::""{Left 1}