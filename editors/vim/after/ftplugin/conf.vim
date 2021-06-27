setlocal foldmethod=marker
setlocal foldtext=GetFoldTextCustom()
setlocal foldcolumn=3
setlocal foldmarker={,}

function! GetFoldTextCustom() abort
  let line = getline(v:foldstart)
  let sub = substitute(line, '^#*\(.*\){\d\=', '\1', 'g')
  return v:folddashes . sub
endfunction
