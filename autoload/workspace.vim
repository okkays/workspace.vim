""
" @section Introduction, intro
" A plugin providing vim bindings for https://github.com/okkays/workspace
"

""
" Selects the given arg, visual selection, or word under the cursor.
function! workspace#GetContentArg(arg, is_visual) abort
  if !empty(a:arg)
    return a:arg
  endif
  let l:visual = maktaba#buffer#GetVisualSelection()
  if a:is_visual && !empty(trim(l:visual))
    return l:visual
  endif
  return expand("<cword>")
endfunction

""
" @public
"
" Opens a fzf#vim#grep window for `workspace ag`
function! workspace#FzfAgGrep(arg, is_visual) abort
  let l:ag_args = shellescape(workspace#GetContentArg(a:arg, a:is_visual))
  call fzf#vim#grep(
  \   'workspace ag --column '.l:ag_args, 1,
  \   fzf#vim#with_preview({'dir': systemlist('workspace root')[0]}), 0)
endfunction

""
" @public
"
" Opens a fzf window for all of the files in the current workspace.
function! workspace#FzfWorkspaceFiles() abort
  let root = systemlist('workspace root')[0]
  call fzf#run(extend(fzf#wrap(
      \ 'ListWorkspaceFiles',
      \ {
      \   'source': "workspace ls",
      \   'dir': root,
      \   'sinklist': function('helpers#BuildQuickfixList')
      \ },
      \ 0), {'options': '--multi --bind ctrl-a:select-all'}))
endfunction
