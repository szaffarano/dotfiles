function! general#FoldText()
    let line            = getline(v:foldstart)
    let nucolwidth      = &foldcolumn+&number*&numberwidth
    let windowwidth     = winwidth(0)-nucolwidth-3
    let foldedlinecount = v:foldend-v:foldstart+1
    let onetab          = strpart('          ', 0, &tabstop)
    let line            = substitute(line, '\t', onetab, 'g')
    let line            = strpart(line, 0, windowwidth-2-len(foldedlinecount))
    let fillcharcount   = windowwidth-len(line)-len(foldedlinecount)

    return line.'…'.repeat(' ',fillcharcount).foldedlinecount.'L'.' '
endfunction

