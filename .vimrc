let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

runtime autoload/plug.vim

call plug#begin('~/.vim/plugged')

" LSP support
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Prettier integration
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

" Use prettierd
let g:prettier#exec_cmd_path = 'prettierd'
let g:prettier#autoformat = 0
autocmd FileType javascript,typescript,html,css nnoremap <buffer> <Leader>f :Prettier<CR>

" LSP servers
au User lsp_setup call lsp#register_server({
    \ 'name': 'tsserver',
    \ 'cmd': ['typescript-language-server', '--stdio'],
    \ 'whitelist': ['typescript', 'javascript'],
    \ })

au User lsp_setup call lsp#register_server({
    \ 'name': 'html',
    \ 'cmd': ['vscode-html-language-server', '--stdio'],
    \ 'whitelist': ['html'],
    \ })

au User lsp_setup call lsp#register_server({
    \ 'name': 'css',
    \ 'cmd': ['vscode-css-language-server', '--stdio'],
    \ 'whitelist': ['css'],
    \ })
