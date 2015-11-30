" ==============================================================================
" File:          vim-test-ruby.vim
" Author:        Jamal El Milahi
" Version:       0.0.1
" Description:   Run Ruby/Rails test with Spin
" ==============================================================================
"
" To run the whole file
" :RunTestFile
" To run a specific test
" :RunCurrentLineInTest

" -------------------------------------
" run Ruby tests
" --------------------------------------

function! s:is_a_test_file()
  return match(expand('%:t'), '_spec.rb$') > 0
endfunction

function! s:print_warning() abort
  echohl WarningMsg
  echo '!!! not a test file :(' | return
  echohl None
endfunction

function! s:run_test(param)
  if s:is_a_test_file()
    exec ':wa'
    exec ':!spin push ' . a:param
  else
    call s:print_warning() | return
  endif
endfunction

function! s:run_current_line_in_test()
  call s:run_test('%:' . line('.'))
endfunction
command! RunCurrentLineInTest call s:run_current_line_in_test()

function! s:run_test_file()
  call s:run_test('%')
endfunction
command! RunTestFile call s:run_test_file()
