SymbolSandwich(leftSymbol, rightSymbol){
    currentClip := Clipboard
    selectionString := GetSelectionString()
    isClipbordNothing := if InStr(selectionString, "`r`n") or (selectionString = "")
    if isClipbordNothing {
        Clipboard := % leftSymbol rightSymbol
    } else {
        Clipboard := % leftSymbol selectionString rightSymbol
    }
    SendEvent, ^v
    sleep, 100
    if isClipbordNothing{
        send,{left}
    }
    Clipboard := currentClip
}

anyChar(){
    CoordMode,Caret,Screen
    InputBox, val, % "記号ペア出力", % ", カンマで左右を区切ります",,200,120, % A_CaretX, % A_CaretY + 50
    if (ErrorLevel = 0) {
        ary := StrSplit(val, ",")
        if (ary.Length() = 2) {
            SymbolSandwich(ary[1], ary[2])
        } else {
            SymbolSandwich(val, val)
        }
    }
}

Return ; 自動実行回避

SymbolSandwichMenu(){
    Menu, symbolMenu, add, % """ """ "`t" "&2",doubleCrotation
    Menu, symbolMenu, add, % "' '" "`t" "&7",singleCrotation
    Menu, symbolMenu, add, % "( )" "`t" "&8",roundBracket
    Menu, symbolMenu, add, % "「 」" "`t" "&9",kagikakko
    Menu, symbolMenu, add, % "[ ]" "`t" "&[",squareBrackets
    Menu, symbolMenu, add, % "{ }" "`t" "&]",curlyBrackets
    Menu, symbolMenu, add, % "任意の文字" "`t" "&i",anySymbol
    Menu,symbolMenu,Show,% A_CaretX, % A_CaretY + 50
}

doubleCrotation:
    SymbolSandwich("""","""")
Return

singleCrotation:
    SymbolSandwich("'","'")
Return

roundBracket:
    SymbolSandwich("(",")")
Return

kagikakko:
    SymbolSandwich("「","」")
Return

anySymbol:
    anyChar()
Return

squareBrackets:
    SymbolSandwich("[","]")
Return

curlyBrackets:
SymbolSandwich("{","}")
Return
