; ^ = Ctrl
; + = shIft
; ! = alt
; # = win
; VK1C = 変換
; VK1D = 無変換

#SingleInstance, Force
#UseHook
#NoEnv
SendMode Input
SetWorkingDir, %A_ScriptDir%

googlSearch := "https://www.google.com/search?q="
amazonSerch := "https://www.amazon.co.jp/s?k="
deeplTrans := "https://www.deepl.com/translator#"
googleTrans := "https://translate.google.com/#view=home&op=translate&sl=auto&tl="
everythingCommand := "C:\Program Files\Everything\Everything.exe -s "

#Include, %A_ScriptDir%\lib\component.ahk
#Include, %A_ScriptDir%\lib\symbol_sand.ahk
#Include, %A_ScriptDir%\lib\window_Controller.ahk

~vk1d & 0::Reload

; 拡張コンテキストメニュー表示
~vk1d & r::send,+{F10}

; ウィンドウ切り替え
~vk1c & o::AltTab
~vk1c & i::ShiftAltTab

;ウィンドウを閉じる
~vk1d & 4::send,!{F4}

; ウィンドウを最小化する
~vk1d & 1::WinMinimize, A

;文字列操-----------------------------------------------------------------------------------------
; カーソルが途中でも下に一行挿入
#Enter::send,{end}{enter}

; delete
~vk1d & d::send,{delete}

; backspace
~vk1d & b::send,{backspace}

; クリップボード履歴表示
~vk1d & v::send,#v

; 一行削除
~vk1d & x::send,{end}{home}

; 今日の日付を出力
~VK1C & d::CurrentDate()

#s::run,% everythingCommand """" GetSelectionString() """"
; 選択した文字をgoogle検索する
~vk1d & s::run,% googlSearch GetSelectionString()
; 選択した文字をAmazon検索する
~vk1d & a::run,% amazonSerch GetSelectionString()
; 選択した文字を翻訳する
~VK1D & t::
    if GetKeyState("ctrl"){
        RunTrans(googleTrans)
    }Else{
        RunTrans(deeplTrans)
    }
Return

; window移動
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

;マウス操作
~VK1C & l::Click,Left
~VK1C & r::Click,Right
~VK1C & j::Click,WheelDown
~VK1C & k::Click,WheelUp

!left::MouseCursorMove("left")
!right::MouseCursorMove("right")
!up::MouseCursorMove("up")
!down::MouseCursorMove("down")
~VK1D & c::MouseCursorMoveAppCenter()

+!left::MouseCursorMove("left", true)
+!right::MouseCursorMove("right", true)
+!up::MouseCursorMove("up", true)
+!down::MouseCursorMove("down", true)

; 記号ペア出力-----------------------------------------------------------------------------------------
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

#IFWinActive ahk_exe Explorer.EXE
    F1::send,!vsf
#IFWinActive
