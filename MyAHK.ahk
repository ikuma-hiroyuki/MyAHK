; ^ = Ctrl
; + = shIft
; ! = alt
; # = win
; VK1C = �ϊ�
; VK1D = ���ϊ�

#SingleInstance, Force
#UseHook
#NoEnv
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include, %A_ScriptDir%\lib\component.ahk
#Include, %A_ScriptDir%\lib\window_Controller.ahk
#Include, %A_ScriptDir%\lib\search.ahk
#Include, %A_ScriptDir%\lib\symbol_sand.ahk

~vk1d & 0::Reload

; �g���R���e�L�X�g���j���[�\��
~vk1d & r::send,+{F10}

; �E�B���h�E����-----------------------------------------------------------------------------------------
; �E�B���h�E�؂�ւ�
~vk1c & o::AltTab
~vk1c & i::ShiftAltTab

;�E�B���h�E�����
~vk1d & 4::send,!{F4}

; �E�B���h�E���ŏ�������
~vk1d & 1::WinMinimize, A

;������-----------------------------------------------------------------------------------------
; �J�[�\�����r���ł����Ɉ�s�}��
#Enter::send,{end}{enter}

; delete
~vk1d & d::send,{delete}

; backspace
~vk1d & b::send,{backspace}

; �N���b�v�{�[�h����\��
~vk1d & v::send,#v

; ��s�폜
~vk1d & x::send,{end}{home}

; ���t���o��
~VK1C & d::CurrentDate()

; �L���y�A�o��-----------------------------------------------------------------------------------------
~VK1D & m::SymbolSandwichMenu()
~VK1D & 2::gosub, doubleCrotation
~VK1D & 7::gosub, singleCrotation
~VK1D & 8::gosub, roundBracket
~VK1D & 9::gosub, kagikakko
~VK1D & i::gosub, anySymbol
~VK1D & [::
    if GetKeyState("Shift"){
        gosub, curlyBrackets
    } else {
        gosub, squareBrackets
    }
    Return

; �����n-----------------------------------------------------------------------------------------
; �I������������google��������
~vk1d & s::runGoogleSerch()

; �I������������Amazon��������
~vk1d & a::runAmazonSerch()

; �I������������|�󂷂�
~vk1d & t::
    if GetKeyState("vk1c") {
        runDeepLTrans()
    }else{
        runGoogleTrans()
    }
    Return

; window�ړ�-----------------------------------------------------------------------------------------
~vk1d & left::WindowMove(-25, 0)
~vk1d & Right::WindowMove(25, 0)
~vk1d & up::WindowMove(0, -25)
~vk1d & down::WindowMove(0, 25)
~VK1D & e::WinMoveCenter()
~vk1d & w::
    if GetKeyState("vk1c"){
        WinResizeMenu()
    } else {
        WinAutoResize()
    }
    Return

;�}�E�X����-----------------------------------------------------------------------------------------
~VK1C & l::Click,Left
~VK1C & r::Click,Right
~VK1C & j::Click,WheelDown
~VK1C & k::Click,WheelUp

!left::MouseCursorMove("left")
!right::MouseCursorMove("right")
!up::MouseCursorMove("up")
!down::MouseCursorMove("down")

+!left::MouseCursorMove("left", true)
+!right::MouseCursorMove("right", true)
+!up::MouseCursorMove("up", true)
+!down::MouseCursorMove("down", true)

; !left::MouseCursorMove(-mouseSpeed, 0)
; !right::MouseCursorMove(mouseSpeed, 0)
; !up::MouseCursorMove(0, -mouseSpeed)
; !down::MouseCursorMove(0, mouseSpeed)

; +!left::MouseCursorMove(-mouseSpeed, 0, true)
; +!right::MouseCursorMove(mouseSpeed, 0, true)
; +!up::MouseCursorMove(0, -mouseSpeed, true)
; +!down::MouseCursorMove(0, mouseSpeed, true)

#IFWinActive ahk_exe Explorer.EXE
    F1::send,!vsf
#IFWinActive
