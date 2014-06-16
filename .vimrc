" $BJ8;z%3!<%I$H$+$N@_Dj(B
set encoding=utf-8

"$B2~9T%3!<%I(B
set fileformats=unix,dos,mac

" $B""$H$+!{$NJ8;z$,$"$C$F$b%+!<%=%k0LCV$,$:$l$J$$$h$&$K$9$k(B
if exists('&ambiwidth')
  set ambiwidth=double
  endif

"$B?'@_Dj(B
syntax on

"$B%?%V$N@_Dj(B
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

"$B?7$7$$9T$N%$%s%G%s%H$r8=:_9T$HF1$8$K$9$k(B
set autoindent

" $B%Z!<%9%H$9$k$H$-$K%$%s%G%s%H$5$;$J$$(B
imap <F5> <nop>
set pastetoggle=<F5>

"$B8!:w(B
set incsearch
set ignorecase
set smartcase
set nohlsearch

"$B9T?tI=<((B
set number

"$BJD3g8L$,F~NO$5$l$?;~!"BP1~$9$k3g8L$r6/D4$9$k(B
set showmatch

"$BB>$GJT=8$5$l$?$iFI$_9~$_D>$9(B
set autoread

"$B?7$7$$9T$r:n$C$?;~$K9bEY$J<+F0%$%s%G%s%H$r9T$&(B
set smarttab

" grep$B8!:w$r@_Dj$9$k(B
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
 
 " $B8!:w7k2L$N%O%$%i%$%H$r(BEsc$BO"BG$G%/%j%"$9$k(B
 nnoremap <ESC><ESC> :nohlsearch<CR>

"$BJd40(B
set complete=.,w,b,u,k
"set completeopt=menu,preview,longest
set pumheight=20


