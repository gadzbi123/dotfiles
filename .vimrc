" Start vimPlug
 call plug#begin()

    " Launch gruvbox
    Plug 'morhetz/gruvbox'  
    
    " Launch airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    " NerdTree
    Plug 'preservim/nerdtree'
    
    " Latex
    " sudo pacman -S texlive-most zathura zathura-pdf-poppler
    Plug 'lervag/vimtex'
    
    " Smooth scroll
    Plug 'psliwka/vim-smoothie'
" Stop vimPlug
call plug#end()

" Basic vim config
set number relativenumber
filetype plugin indent on
syntax enable 
set hidden
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab smarttab
set mouse=nicr

"""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""

"Remap splits navigation to just CTRL + hjkl
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"Exit insert mode
inoremap <C-c> <Esc>

"buffer jumping
nnoremap <C-h> :b 1<CR>
nnoremap <C-j> :b 2<CR>
nnoremap <C-k> :b 3<CR>
nnoremap <C-l> :b 4<CR>

"tab in split
nnoremap <C-q> <C-w>q
noremap <Leader>vb :vertical ball<CR>

"NERDTree maping
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>

" True color for some terminals
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set font
"set guifont=Consolas

" Smoothie settings
"g:smoothie_enabled = 0 
nnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
vnoremap <unique> <C-D> <cmd>call smoothie#do("\<C-D>") <CR>
nnoremap <unique> <C-F> <cmd>call smoothie#do("\<C-F>") <CR>
vnoremap <unique> <C-F> <cmd>call smoothie#do("\<C-F>") <CR>
nnoremap <unique> <C-B> <cmd>call smoothie#do("\<C-B>") <CR>
vnoremap <unique> <C-B> <cmd>call smoothie#do("\<C-B>") <CR>
nnoremap <unique> <C-U> <cmd>call smoothie#do("\<C-U>") <CR>
vnoremap <unique> <C-U> <cmd>call smoothie#do("\<C-U>") <CR>

" Gruvbox config
set bg=dark "light
let g:gruvbox_contrast_dark = '(hard)'
autocmd vimenter * ++nested colorscheme gruvbox
"let g:gruvbox_termcolors=16
"let g:gruvbox_bold= '(0)'
"let g:gruvbox_underline= '(1)'

" Vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

" Latex config
let g:vimtex_view_method = 'zathura'
