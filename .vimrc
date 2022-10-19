" Start pathogen
execute pathogen#infect()
filetype plugin indent on

" Basic vim things
set number relativenumber
syntax on

" True color for some terminals
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Gruvbox config
set bg=dark
let g:gruvbox_contrast_dark = '(medium)'
" let g:gruvbox_termcolors=16
"let g:gruvbox_bold= '(0)'
"let g:gruvbox_underline= '(1)'
autocmd vimenter * ++nested colorscheme gruvbox
