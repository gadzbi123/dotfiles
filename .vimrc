execute pathogen#infect()
filetype plugin indent on
set number relativenumber
syntax on

"true color
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:gruvbox_termcolors=16
