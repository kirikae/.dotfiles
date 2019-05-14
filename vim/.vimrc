"┌────────────────────────────────────────────────────────┐
"│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
"│▒▒┌─────┐░▒┌─────┐░▒▒▒▒┌────────┐░▒▒▒▒┌──────────────┐░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒┌──┐▓▒┌──┐▓▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒│▓▒▒▒▒│░▒│▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒│▓▒▒▒▒└──┘▓▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒│▓▒▒▒▒▒▒▒▒▒▒▒▒▒│░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒└┐▒▒▒▒▒▒▒▒▒▒▒▒┌┘░▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒▒└┐▒▒▒▒▒▒▒▒▒▒┌┘░▒▒▒▒▒│▓▒▒▒▒▒▒▒│░▒▒▒▒│▓▒│░▒│▓▒│░▒│▓▒│░▒│
"│▒▒▒▒└──────────┘░▒▒▒▒▒▒└────────┘░▒▒▒▒└──┘░▒└──┘░▒└──┘░▒│
"│▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒│
"└────────────────────────────────────────────────────────┘

" VIM-PLUG {{{
" Automatic Download {{{
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !mkdir -p "$HOME/.vim/autoload"
	silent !curl -fLo "$HOME/.vim/autoload/plug.vim" 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}
call plug#begin('~/.vim/plugged')
" Defaults {{{
Plug 'tpope/vim-sensible'
call plug#load('vim-sensible')
" }}}
" Colours {{{
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'arcticicestudio/nord-vim'
" }}}
" Highlighting / Syntax {{{
Plug 'Valloric/MatchTagAlways'
Plug 'guns/xterm-color-table.vim'
Plug 'junegunn/limelight.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'valloric/vim-operator-highlight'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'pallets/jinja'
" }}}
" UI {{{
Plug 'itchyny/lightline.vim'
Plug 'szw/vim-maximizer'
Plug 'pgdouyon/vim-evanesco'
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
Plug 'terryma/vim-expand-region'
"Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
Plug 'junegunn/goyo.vim'
" }}}
" Editing {{{
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'ogier/guessindent'
Plug 'tpope/vim-abolish'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'chaoren/vim-wordmotion'
Plug 'dietsche/vim-lastplace'
" }}}
" Navigation {{{
Plug 'wincent/ferret'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'simnalamburt/vim-mundo'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" }}}
" Project Structure {{{
Plug 'tpope/vim-obsession'
" Source Control {{{
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'whiteinge/diffconflicts'
Plug 'chrisbra/vim-diff-enhanced'
" }}}
" System Tools {{{
Plug 'tpope/vim-eunuch'
Plug 'Shougo/vimproc', {'do': 'make'}
" }}}
" Code Evaluation {{{
Plug 'nicwest/vim-http'
Plug 'metakirby5/codi.vim'
Plug 'thinca/vim-quickrun'
" }}}
" Previews {{{
"Plug 'JamshedVesuna/vim-markdown-preview' "Commented, too many dependencies.
"I want to avoid requiring something outside of 'base' repos and also not use
"something like nodeJS or something else...
" }}}
" Exporting {{{
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
" }}}
" Snippets {{{
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}
" Diagnostics {{{
"Plug 'w0rp/ale'
" }}}
" FileType {{{
" }}}
" Ansible {{{
Plug 'pearofducks/ansible-vim'
" }}}
" YAML {{{
Plug 'stephpy/vim-yaml'
" }}}
" Ruby {{{
Plug 'vim-ruby/vim-ruby'
" }}}
" Markdown {{{
Plug 'plasticboy/vim-markdown'
" }}}
" }}}
" Speech {{{
Plug 'rhysd/vim-grammarous'
Plug 'phongvcao/vim-stardict'
" }}}
" Writting {{{
Plug 'junegunn/vim-journal'
Plug 'fmoralesc/vim-pad', {'branch': 'devel'}
" }}}
call plug#end()
" }}}
" Lightline - lighter status/tabline {{{
let g:deepspace_italics																	= 1
let g:lightline = { 'colorscheme': 'deepspace', }
" }}}
" pearofducks/ansible specific settings {{{
let g:ansible_unindent_after_newline = 1	"Reset indentation after two newlines
let g:ansible_extra_keywords_highlight = 1
let g:ansible_yamlKeyName = 'yamlKey'
" }}}
" whatyouhide/vim-lengthmatters {{{
let g:lengthmatters_on_by_default = 0
" }}}
" junegunn/goyo specific settings {{{
let g:goyo_width = '90%'
let g:goyo_height = '90%'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}
" vim-markdown-preview Settings {{{
"let vim_markdown_preview_github=1            " Enable if you want to use grip for previews
"let vim_markdown_preview_hotkey='<C-m>'      " Change the keybinding from '<C-p>'
"let vim_markdown_preview_browser='Firefox'   " Change from Google Chrome
"let vim_markdown_preview_use_xdg_open=1      " Fedora doesn't have `see`, use xdg-open instead
" }}}
" Settings {{{
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme nord											" Colour Scheme in use
set t_Co=256                                " Enable 256 colours
set termguicolors														" Enable true colour support
set background=dark													" dark background
set hidden																	" hide buffer without notice
set mouse=a																	" enable mouse
set autoread																" auto read external file changes
set hlsearch																" highlight last searched term
set vb t_vb=																" no visual bell
set noshowcmd																" disable blinking cmd feedback in bottom-right corner
set guicursor=															" disable cursor shape
set noswapfile															" disable swap files
set pumheight=32														" limit popup menu height
set updatetime=300													"shorter updatetime value
set foldmethod=marker												" fold on marks
set spelllang=en_au													" default spelling language
set spellfile=$HOME/.vim/spell/en.utf-8.add	" personalised spell file
set number																	" left line numbers
set relativenumber													" show relative line to cursor
set expandtab shiftwidth=2									" space for tabs by default
set tabstop=2 softtabstop=2									" double-space for a tab
set diffopt+=internal,algorithm:patience
syntax on
" Spelling (On) {{{
autocmd BufNewFile,BufRead *.txt :set spell
autocmd BufNewFile,BufRead *.tex :set spell
autocmd BufNewFile,BufRead *.md :set spell
 " }}}
" }}}
"  Shortcuts and more... {{{
cmap w!! w !sudo tee % > /dev/null
map q :q<CR>
map <Space> za
nnoremap <C-T> :tabnew<CR>
nnoremap <C-L> :NERDTreeToggle<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <F8> :setl noai nocin nosi inde=<CR>
nnoremap <F9> :Goyo<CR>
" }}}

