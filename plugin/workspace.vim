""
" @section Mappings, mappings
"
" *<C-P>*
"
"   Opens a fzf window with a list of files in the current workspace.

if !exists('g:workspace_auto_map_keys')
  ""
  " Whether to use the default mappings. Disable to set up your own.
  let g:workspace_auto_map_keys = 1
endif

if g:workspace_auto_map_keys
  " Set ctrl-p to browse for files in git repository.
  nnoremap <silent> <C-P> :call workspace#FzfWorkspaceFiles()<CR>
endif
