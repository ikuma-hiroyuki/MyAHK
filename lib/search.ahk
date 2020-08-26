TransParameter(waei,eiwa) {
    selectionString := GetSelectionString(true)
    match := RegExMatch(StrReplace(selectionString,"%0A"),"[a-zA-Z]")

    if (match > 0) {
        Return waei selectionString
    } else {
        Return eiwa selectionString
    }
}

runGoogleSerch(){
    run,% "https://www.google.com/search?q=" GetSelectionString(true)
}

runAmazonSerch(){
    run,% "https://www.amazon.co.jp/s?k=" GetSelectionString(true)
}

runDeepLTrans(){
    run,% "https://www.deepl.com/ja/translator" TransParameter("#en/ja/","#ja/en/")
}

runGoogleTrans(){
    run,% "https://translate.google.com/#view=home&op=translate&sl=auto&tl=" TransParameter("ja&text=","en&text=")
}
