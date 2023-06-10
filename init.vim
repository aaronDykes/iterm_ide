filetype plugin indent on
syntax on
set number
set cursorcolumn
set cursorline

set tabstop=6
set shiftwidth=6

set history=1000
set scrolloff=20
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set clipboard=unnamedplus
set wildmenu
set wildmode=list:longest
set hidden
set cmdheight=4
set relativenumber
set noshowmode

" PLUGINS ---------------------------------------------------------------- {{{


call plug#begin()
    " Appearance
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'navarasu/onedark.nvim'
    Plug 'uga-rosa/ccc.nvim'
    " Utilities
    
    Plug 'beauwilliams/focus.nvim'
    Plug 'sheerun/vim-polyglot'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    "Plug 'preservim/nerdtree'
    Plug 'ap/vim-css-color'
    Plug 'matze/vim-move'   
    Plug 'jiangmiao/auto-pairs'
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    " Completion / linters / formatters
    "
    Plug 'neoclide/coc.nvim',  {'branch': 'release'}
    Plug 'vim-scripts/javacomplete'
    Plug 'tjdevries/coc-zsh'
    Plug 'rhysd/vim-clang-format'
    Plug 'plasticboy/vim-markdown'
    Plug 'dense-analysis/ale'
    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    " Git
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{


colorscheme onedark
inoremap jk             <esc>l
inoremap <a-u>          <esc>gUiwi
inoremap <a-BS>         <c-w>
inoremap <a-l>          <esc>guawi

inoremap <expr> <a-j> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <a-k> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <s-cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"



nnoremap <a-o>  <cmd>CHADopen<cr>

nnoremap a        <S-A>


nnoremap <c-a-c>    :CccPick<cr>
nnoremap <c-j>    <c-w>j
nnoremap <c-k>    <c-w>k
nnoremap <c-h>    <c-w>h
nnoremap <c-l>    <c-w>l

nnoremap <a-Up>   :vertical resize +10 <CR>
nnoremap <a-Down> :vertical resize -10 <CR>
nnoremap <a-=>    :resize +5  <CR>
nnoremap <a-->    :resize -5  <CR>

nnoremap <a-u>    gUiw
nnoremap <a-l>    guaw

nnoremap x        dd
nnoremap o        o<Esc>
nnoremap O        O<Esc>

nnoremap <a-x>    :q!<CR>
nnoremap <a-s>    :w <CR>
nnoremap <a-cr>   :wq<CR>
nnoremap <A-BS>   :<c-w><Esc>


nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>


vnoremap i      <S-I>
vnoremap q      <Esc>
" <Leader>f{char} to move to {char}



map   <Leader> <Plug>(easymotion-prefix)
map   <S-l>    <Plug>(easymotion-bd-jk)
nmap  f        <Plug>(easymotion-bd-w)
nmap  s        <Plug>(easymotion-bd-e)
map   n        <Plug>(easymotion-bd-w)
map   z/       <Plug>(incsearch-easymotion-/)
map   z?       <Plug>(incsearch-easymotion-?)
map   zg/      <Plug>(incsearch-easymotion-stay)

"
" You can use other keymappings like <C-l> instead of <CR> if you want to
" use these mappings as default search and sometimes want to move cursor with
" EasyMotion.
noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

nmap          gs <Plug>(coc-git-chunkinfo)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:clang_format#style_options = {
            \ "AlignArrayOfStructures": "Left",
            \ "AlignConsecutiveAssignments": "Consecutive",
            \ "AlignAfterOpenBracket": "BlockIndent",
            \ "AlignConsecutiveDeclarations": "Consecutive",
            \ "IndentWidth": 6,
            \ "TabWidth": 6,
            \ "AllowShortBlocksOnASingleLine": "Empty",
            \ "UseTab": "AlignWithSpaces",
            \ "AllowShortEnumsOnASingleLine": "False",
            \ "AllowShortFunctionsOnASingleLine": "None",
            \ "AllowShortLoopsOnASingleLine": "False",
            \ "BreakBeforeBraces": "Stroustrup",
            \ "AlignConsecutiveMacros": "Consecutive",
            \ "IndentCaseLabels": "false",
            \ "AllowShortIfStatementsOnASingleLine": "false"}

autocmd FileType c ClangFormatAutoEnable
let g:clang_format#auto_format=1

lua << END
require('lualine').setup()
END

lua require("focus").setup()
lua require("toggleterm").setup()

autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><a-i> <Cmd>exe v:count1 . "ToggleTerm"<CR>

nnoremap <silent><a-i> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><a-i> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

let g:EasyMotion_use_smartsign_us=1 
let g:python3_host_prog="/usr/bin/python3"
let g:coc_node_path='/opt/homebrew/bin/node'
let g:EasyMotion_smartcase=1
let g:loaded_perl_provider=0
let g:move_key_modifier='a'


autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocGitStatusChange {command}

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{



if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


augroup mygroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <c-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <c-m> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <c-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <c-m> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <c-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <c-m> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" }}}

