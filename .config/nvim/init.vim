" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" Insert modeでのBack space使用許可
set backspace=indent,eol,start
" コマンド履歴保存上限数を200にする
set history=200
" キーマッピング Up, Down キーを押さずとも操作できるようにする
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"----------------------------------------
" 検索
"----------------------------------------
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch

"----------------------------------------
" 表示設定
"----------------------------------------
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" ステータス行を常に表示
set laststatus=2
" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
"
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" 省略されずに表示
set display=lastline
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:~
" コメントの色を水色
hi Comment ctermfg=3
" インデント幅
set shiftwidth=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" タブ入力を複数の空白入力に置き換える
set expandtab
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" 対応する括弧を強調表示
set showmatch
" タイトルを表示
set title
" 行番号の表示
set number
" 不可視文字を表示する
set list
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" シンタックスハイライト
syntax on
" バッファスクロール
set mouse=a
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 構文毎に文字色を変化させる
syntax on
" カラースキーマの指定
colorscheme desert
" 暗い背景色に合わせた配色にする
set background=dark
" 行番号の色
highlight LineNr ctermfg=darkyellow
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" Control + e で :NERDTreeToggle を行う
nnoremap <silent><C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'

" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'

" Gitを便利に使う
Plug 'tpope/vim-fugitive'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" Rails向けのコマンドを提供する
Plug 'tpope/vim-rails'

" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'

" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'

" コメントON/OFFを手軽に実行
Plug 'tpope/vim-commentary'

" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'

"シンタックスハイライト for slim
Plug 'slim-template/vim-slim'

" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'

call plug#end()
""""""""""""""""""""""""""""""

" クリップボードを使用したコピー
set clipboard+=unnamed

