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

TransParameter(waei,eiwa) {
    selectionString := GetSelectionString(true)
    match := RegExMatch(StrReplace(selectionString,"%0A"),"[a-zA-Z]")

    if (match > 0) {
        Return waei selectionString
    } else {
        Return eiwa selectionString
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


CurrentDate(){
    currentClip := Clipboard
    FormatTime, timeStamp,, % "ShortDate"
    Clipboard := timeStamp
    SendEvent, ^v
    Clipboard := currentClip
}
