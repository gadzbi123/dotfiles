" Start pathogen - DEPRICATED
"execute pathogen#infect()
"filetype plugin indent on

" Start vimPlug
call plug#begin()

" Launch gruvbox
Plug 'morhetz/gruvbox'  
" Launch airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Multicursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Stop vimPlug
call plug#end()

" Basic vim config
set number relativenumber
syntax enable 
set hidden
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab smarttab

"""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""

"Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"Mouse scroll
set mouse=nicr

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
"set bg=light
set bg=dark
let g:gruvbox_contrast_dark = '(hard)'
autocmd vimenter * ++nested colorscheme gruvbox
"let g:gruvbox_termcolors=16
"let g:gruvbox_bold= '(0)'
"let g:gruvbox_underline= '(1)'

" Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
