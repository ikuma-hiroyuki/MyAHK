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
googleTrans := "https://translate.google.com/#view=home&op=translate&"
everythingCommand := "C:\Program Files\Everything\Everything.exe -s "

#Include, %A_ScriptDir%\lib\component.ahk
#Include, %A_ScriptDir%\lib\symbol_sand.ahk
#Include, %A_ScriptDir%\lib\window_Controller.ahk

VK1D::VK1D
VK1C::VK1C

VK1D & 0::Reload

; 拡張コンテキストメニュー表示
VK1D & r::send,+{F10}

; ウィンドウ切り替え
VK1C & o::AltTab
VK1C & i::ShiftAltTab

;ウィンドウを閉じる
VK1D & 4::send,!{F4}

; ウィンドウを最小化する
VK1D & 1::WinMinimize, A

;文字列操-----------------------------------------------------------------------------------------
; カーソルが途中でも下に一行挿入
#Enter::send,{end}{enter}

; delete
VK1D & d::send,{delete}

; backspace
VK1D & b::send,{backspace}

; クリップボード履歴表示
VK1D & v::send,#v

; 一行削除
VK1D & x::send,{end}{home}

; 今日の日付を出力
VK1C & d::CurrentDate()

#s::run,% everythingCommand """" GetSelectionString() """"
; 選択した文字をgoogle検索する
VK1D & s::run,% googlSearch GetSelectionString(true)
; 選択した文字をAmazon検索する
VK1D & a::run,% amazonSerch GetSelectionString(true)
; 選択した文字を翻訳する
VK1D & t::
    if GetKeyState("ctrl"){
        RunTrans(googleTrans)
    }Else{
        RunTrans(deeplTrans)
    }
Return

; window移動
VK1D & left::WindowMove(-25, 0)
VK1D & Right::WindowMove(25, 0)
VK1D & up::WindowMove(0, -25)
VK1D & down::WindowMove(0, 25)
VK1D & e::WinMoveCenter()
VK1D & w::
    if GetKeyState("VK1C"){
        WinResizeMenu()
    } else {
        WinAutoResize()
    }
Return

;マウス操作
VK1C & l::Click,Left
VK1C & r::Click,Right
VK1C & j::Click,WheelDown
VK1C & k::Click,WheelUp

!left::MouseCursorMove("left")
!right::MouseCursorMove("right")
!up::MouseCursorMove("up")
!down::MouseCursorMove("down")
VK1D & c::MouseCursorMoveAppCenter()

+!left::MouseCursorMove("left", true)
+!right::MouseCursorMove("right", true)
+!up::MouseCursorMove("up", true)
+!down::MouseCursorMove("down", true)

; 記号ペア出力-----------------------------------------------------------------------------------------
VK1D & m::SymbolSandwichMenu()
VK1D & 2::gosub, doubleCrotation
VK1D & 7::gosub, singleCrotation
VK1D & 8::gosub, roundBracket
VK1D & 9::gosub, kagikakko
VK1D & i::gosub, anySymbol
VK1D & [::
    if GetKeyState("Shift"){
        gosub, curlyBrackets
    } else {
        gosub, squareBrackets
    }
Return

#IFWinActive ahk_exe Explorer.EXE
    F1::send,!vsf
#IFWinActive
