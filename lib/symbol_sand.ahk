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
    InputBox, val, % "�L���y�A�o��", % ", �J���}�ō��E����؂�܂�",,200,120, % A_CaretX, % A_CaretY + 50
    if (ErrorLevel = 0) {
        ary := StrSplit(val, ",")
        if (ary.Length() = 2) {
            SymbolSandwich(ary[1], ary[2])
        } else {
            SymbolSandwich(val, val)
        }
    }
}

Return ; �������s���

SymbolSandwichMenu(){
    Menu, symbolMenu, add, % """ """ "`t" "&2",doubleCrotation
    Menu, symbolMenu, add, % "' '" "`t" "&7",singleCrotation
    Menu, symbolMenu, add, % "( )" "`t" "&8",roundBracket
    Menu, symbolMenu, add, % "�u �v" "`t" "&9",kagikakko
    Menu, symbolMenu, add, % "[ ]" "`t" "&[",squareBrackets
    Menu, symbolMenu, add, % "{ }" "`t" "&]",curlyBrackets
    Menu, symbolMenu, add, % "�C�ӂ̕���" "`t" "&i",anySymbol
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
    SymbolSandwich("�u","�v")
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
