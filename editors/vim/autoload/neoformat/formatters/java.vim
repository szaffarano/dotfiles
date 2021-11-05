function! neoformat#formatters#java#enabled() abort
    return ['google_java']
endfunction

function! neoformat#formatters#java#google_java() abort
    return {
        \ 'exe': 'java',
        \ 'args': ['-jar', $HOME.'/.local/jars/google-java-format.jar', '-'],
        \ 'stdin': 1
        \ }
endfunction
