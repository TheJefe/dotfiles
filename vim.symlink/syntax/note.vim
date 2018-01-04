syn match codeFoldStart "/\*"
syn match codeFoldEnd "\*/"

syn match comment1 "\*\*.*$"
syn match comment2 "##.*$"
syn match comment3 "\~\~.*$"

hi comment1 term=bold cterm=bold gui=bold ctermbg=green ctermfg=black guifg=black guibg=green
hi comment2 term=bold cterm=bold gui=bold ctermbg=red guibg=red
hi comment3 term=bold cterm=bold gui=bold ctermbg=19 guibg=blue
hi codeFoldStart term=bold cterm=bold gui=bold ctermbg=green ctermfg=black guifg=black guibg=green
hi codeFoldEnd term=bold cterm=bold gui=bold ctermbg=green ctermfg=black guifg=black guibg=green

" these next two lines allows for '-' to be repeated on newlines
set comments=sl:-,mb:-,elx:;
setlocal formatoptions+=r

" allows blocks of ruby syntax's in a file
syntax include @RUBY syntax/ruby.vim
syntax region rubySnip matchgroup=Snip start="@begin=ruby@" end="@end=ruby@" contains=@RUBY
hi link Snip SpecialComment

setlocal foldmethod=marker
setlocal foldmarker=/*,*/
setlocal foldlevel=0
