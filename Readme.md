# Deprecated
This plugin is deprecated. [vim-test](https://github.com/janko-m/vim-test) offers much more (and is what I personally use nowadays).

# shimmer.vim

I created the `shimmer.vim` plugin out of a personal need. I'm using [vim](http://www.vim.org) for work in multiple languages (Ruby, Elixir, and others). For every language there's a Vim plugin to do all sorts of things, but I want to reuse the same keybindings across language borders. Running tests for instance is one of those things and it's the first thing I implemented.

## How it works
`shimmer.vim` just looks at the current filetype and dispatches to other vim plugins and functions dependend on that. If you're inside a `Ruby` file [rubytest.vim](https://github.com/janx/vim-rubytest) is used for running the tests. If you're inside a `Elixir` file [extest.vim](https://github.com/BjRo/vim-extest) will be used instead.

## Installation

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

```console
cd ~/.vim/bundle
git clone git://github.com/BjRo/vim-shimmer.git
```
## Key Bindings
The plugin exposes the following commands.

* `:ShimmerTestRunFile` runs all the tests in the file that is loaded into the current buffer
* `:ShimmerTestRunTest` runs the test case under the cursor
* `:ShimmerTestRunLast` runs the last test, from any buffer

If you don't bind them to keys in your `.vimrc` they will default to the following configuration:

```vim
map <leader>T :ShimmerTestRunFile<CR>
map <leader>t :ShimmerTestRunMethod<CR>
map <leader>lt :ShimmerTestRunLast<CR>
```

But of course, you can always override this.

## License
(The MIT License)

Copyright (c) 2013 Björn Rochel

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
