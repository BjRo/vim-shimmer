" (The MIT License)
"
" Copyright (c) 2013 Björn Rochel
"
" Permission is hereby granted, free of charge, to any person obtaining a copy of this
" software and associated documentation files (the 'Software'), to deal in the Software
" without restriction, including without limitation the rights to use, copy, modify, merge,
" publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
" to whom the Software is furnished to do so, subject to the following conditions:

" The above copyright notice and this permission notice shall be included in all
" copies or substantial portions of the Software.

" THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
" LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
" OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

" Prevent the script from loading multiple times
if exists("g:shimmer_loaded") || &cp
  finish
endif
let g:shimmer_loaded = 1

" Exported commands
command ShimmerTestRunFile call <SID>RunAllTestsInFile()
command ShimmerTestRunTest call <SID>RunTestUnderCursor()
command ShimmerTestRunLast call <SID>ReRunLastTest()

" Mappings
if !hasmapto(":ShimmerTestRunTest<CR>")
  "Replace default binding of rubytest.vim
  unmap <Leader>t
  map <unique> <Leader>t :ShimmerTestRunTest<CR>
endif

if !hasmapto(":ShimmerTestRunFile<CR>")
  "Replace default binding of rubytest.vim
  unmap <Leader>T
  map <unique> <Leader>T :ShimmerTestRunFile<CR>
endif

if !hasmapto(":ShimmerTestRunLast<CR>")
  map <unique> <Leader>lt :ShimmerTestRunLast<CR>
endif

function s:RunAllTestsInFile()
  return s:RunAction("RunAllTestsInFile")
endfunction

function s:RunTestUnderCursor()
  return s:RunAction("RunTestUnderCursor")
endfunction

function s:ReRunLastTest()
  return s:RunAction("ReRunLastTest")
endfunction

"Tries to find the action in the context of the current filetype
function s:RunAction(action)
  let l:fileType = &filetype
  let l:actions = get(s:actions, l:fileType, {})

  if empty(l:actions)
    let l:Action = function("s:NoActionMapped")
  else
    let l:Action = get(l:actions, a:action, function("s:NoActionMapped"))
  endif

  return l:Action()
endfunction

function s:ExRunAllTestsInFile()
  execute "ExTestRunFile"
endfunction

function s:ExRunTestUnderCursor()
  execute "ExTestRunTest"
endfunction

function s:ExReRunLastTest()
  execute "ExTestRunLast"
endfunction

function s:RubyRunAllTestsInFile()
  execute "normal \<Plug>RubyFileRun"
endfunction

function s:RubyRunTestUnderCursor()
  execute "normal \<Plug>RubyTestRun"
endfunction

function s:RubyReRunLastTest()
  execute "normal \<Plug>RubyLastRun"
endfunction

function s:NoActionMapped()
  echo "No action mapped"
endfunction

let s:actions = {}
let s:actions["elixir"] = {}
let s:actions["elixir"]["RunAllTestsInFile"]  = function("s:ExRunAllTestsInFile")
let s:actions["elixir"]["RunTestUnderCursor"] = function("s:ExRunTestUnderCursor")
let s:actions["elixir"]["ReRunLastTest"]      = function("s:ExReRunLastTest")
let s:actions["ruby"] = {}
let s:actions["ruby"]["RunAllTestsInFile"]  = function("s:RubyRunAllTestsInFile")
let s:actions["ruby"]["RunTestUnderCursor"] = function("s:RubyRunTestUnderCursor")
let s:actions["ruby"]["ReRunLastTest"]      = function("s:RubyReRunLastTest")
