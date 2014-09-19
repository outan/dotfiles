" 文字コードとかの設定
set encoding=utf-8

"タブ、空白、改行の可視化"
set list
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"改行コード
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"色設定
syntax on

"タブの設定
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

"新しい行のインデントを現在行と同じにする
set autoindent

" ペーストする時にインデントさせない
imap <F5> <nop>
set pastetoggle=<F5>

"検索
set incsearch
set ignorecase
set smartcase
set nohlsearch

"行数表示
set number

"閉括弧が入力された時、対応する括弧を強調する
set showmatch

"他で編集されたら読み込み直す
set autoread

"新しい行を作った時に高度な自動インデントを行う
set smarttab

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
 " 検索結果のハイライトをEsc連打でクリアする
 nnoremap <ESC><ESC> :nohlsearch<CR>

"補完
set complete=.,w,b,u,k
"set completeopt=menu,preview,longest
set pumheight=20

"検索時に最後まで行ったら最初に戻る"
set wrapscan

"ステータスラインを常に表示（編集中のファイル名が常に確認できるようになる)"
set laststatus=2

"入力中のコマンドをステータスに表示する"
set showcmd

"ステータスラインに文字コードと改行文字を表示する"
"set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

"編集中の内容を保ったまま別の画面に切替えられるようにする(デフォルトだと一度保
"存しないと切り替えられない)"
set hid

"システムのclipboardにコピー＆ペーストできるように"
set clipboard=unnamed,autoselect

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
    
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=/Users/outannexway/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/outannexway/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

NeoBundle 'bling/vim-airline'
  let g:airline_enable_branch = 0
  let g:airline_section_b = "%t %M"
  let g:airline_section_c = ''
  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
  let g:airline_section_x =
        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
        \ "%{strlen(&filetype)?&filetype:'no ft'}"
  let g:airline_section_y = '%3p%%'
  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
  let g:airline#extensions#whitespace#enabled = 0

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
