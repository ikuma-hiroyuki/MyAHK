WinMoveCenter(){
    WinGetPos, x, y, appWidth, appHeight, A
    appWidth /= 2
    appHeight /= 2
    x := (A_ScreenWidth / 2) - appWidth
    y := (A_ScreenHeight / 2) - appHeight
    WinMove,A , , x, y
}

WindowMove(moveX, moveY) {
    if GetKeyState("shift") {
        moveX *= 5
        moveY *= 5
    }
    WinGetPos,x ,y , , , A
    x += moveX
    y += moveY
    WinMove, A, , x, y
}

WinAutoResize(){
    WinGetTitle,wintitle,A
    if WinActive("ahk_exe Explorer.EXE") {
        Gosub, exp
    } else if (InStr(wintitle,"Youtube")>0) {
        Gosub, youtube
    } else if WinActive("ahk_exe chrome.exe") {
        Gosub, chrome
    } else if WinActive("ahk_exe Code.exe") {
        Gosub, fhd
    }
}

WinResize(Width, Height) {
    WinRestore,A
    WinMove, A, , , , Width, Height
}

WinResizeMenu(){
    WinGetPos, , , appWidth, appHeight, A
    Menu, winsize, add, &exp, exp
    Menu, winsize, add, &youtube, youtube
    Menu, winsize, add, &chrome, chrome
    Menu, winsize, add, &fhd, fhd
    Menu, winsize, show, % appWidth / 2 - 100 , % appHeight / 2 - 100
}

Return ; ???????s????

exp:
    WinResize(900,800)
    Return

youtube:
    WinResize(1000,800)
    Return

chrome:
    WinResize(1600,1000)
    Return

fhd:
    WinResize(1920,1080)
    Return
