GetSelectionString(urlEncode := false){
    Clipboard := ""
    send,^c
    ClipWait, 0.5
    query := Clipboard
    if urlEncode {
        query := StrReplace(query, A_Space , "%20")
        query := StrReplace(query,"`r`n","%0A")
    }
    Return query
}

RunTrans(baseURL){
    if (InStr(baseURL, "translate.google") > 0){
        waei := "ja&text="
        eiwa := "en&text="
    } else if (InStr(baseURL, "deepl.com") > 0){
        waei := "en/ja/"
        eiwa := "ja/en/"
    }
    selectionString := GetSelectionString(true)
    match := RegExMatch(StrReplace(selectionString,"%0A"),"[a-zA-Z]")

    if (match > 0) {
        run,% baseURL waei selectionString
    } else {
        run,% baseURL eiwa selectionString
    }
}

MouseCursorMove(direction, baisoku := false) {
    mouseSpeed := 10
    if (direction = "left"){
        x := -mouseSpeed
        y := 0
    } else if (direction = "right"){
        x := mouseSpeed
        y := 0
    } else if (direction = "up"){
        x := 0
        y := -mouseSpeed
    } else if (direction = "down"){
        x := 0
        y := mouseSpeed
    }
    if baisoku {
        cursorSpeed := 10
        x *= cursorSpeed
        y *= cursorSpeed
    }
    MouseClick,,x,y,,,U,R
}

MouseCursorMoveAppCenter(){
    WinGetPos,,,appWidth,appHeight,A
    MouseMove, appWidth/2, appHeight/2
}

CurrentDate(){
    currentClip := Clipboard
    FormatTime, timeStamp,, % "ShortDate"
    Clipboard := timeStamp
    SendEvent, ^v
    Clipboard := currentClip
}
