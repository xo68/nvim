
<h1 align="center"> NeoVim / nvim </h1>

<div align="center">

[![Lua](https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white)](http://www.lua.org)
[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io/)

</div>

## Objectives

<img align="right" width="40%" src="examples/capture_main.jpg" alt="Screenshot">

- Store my configuration
- Make it available for re-use and learning purpose
- Keep track of my NVim journey

## Sample of key plugins

- Lazy (Plugins manager for NeoVim)
- Mason (Plugins manager for Linter, LSP, DAP, etc.)
- Telescope, TreeSitter, Harpoon
- Comment, LuaSnip-cmp, Dressing, Autoclose
- Lualine, Luatab
- nvim-dap, nvim-dap-ui
- nvim-lspconfig, nvim-cmp 

## Table of contents
- [My custom configuration](#my-custom-configuration)
    - [NvimTree specific (Tree)](#nvimtree-specific)
    - [CMP specific (Completion)](#cmp-specific-completion)
    - [Telescope Specific (Fuzzy Finder)](#telescope-specific-fuzzy-finder)
- [My cheat sheet (Standard Vim / Nvim)](#my-cheat-sheet-standard-vim--nvim)
    - [Mode switching](#mode-switching)
    - ['Command' mode](#command-mode)
    - ['Normal' mode - Navigation](#normal-mode---navigation)
    - ['Normal' mode - Editing](#normal-mode---editing)
    - ['Normal' model 'g' shortcuts](#normal-mode-g-shortcuts)
    - ['Insert' mode](#insert-mode)

## My custom configuration

- \<Leader\> is mapped to space bar
- \<Option\> is the macbook  option key

> Configuration file: [lua/remap.lua](lua/remap.lua)

| Required Plugin   | Shortcut          | Mode          | Description                                                              |
|-------------------|-------------------|---------------|--------------------------------------------------------------------------|
| None              | `<leader>sv`      |  Normal       | Split - Vertical                                                         |
| None              | `<leader>sh`      |  Normal       | Split - Horizonal                                                        |
| None              | `<leader>se`      |  Normal       | Split - Equal size for all splits                                        |
| None              | `<leader>sx`      |  Normal       | Split - Close current split view                                         |
| None              | `<Option>h`       |  Normal       | Split - resize vertical -10                                              |
| None              | `<Option>l`       |  Normal       | Split - resize vertical +10                                              |
| None              | `<Option>k`       |  Normal       | Split - resize horizontal -10                                            |
| None              | `<Option>h`       |  Normal       | Split - resize horizontal +10                                            |
| None              | `<leader>to`      |  Normal       | Tab - Open a new tab                                                     |
| None              | `<leader>tx`      |  Normal       | Tab - Close                                                              |
| None              | `<leader>tn`      |  Normal       | Tab - Next                                                               |
| None              | `<leader>tp`      |  Normal       | Tab - Previous                                                           |
| None              | `<leader>tb`      |  Normal       | Tab - Open current Buffer in a new tab                                   |
| None              | `>` / `<`         |  Visual       | Indent Right / Left                                                      |
| None              | `<Ctrl>{j\|k}`    |  Visual       | Move selected text Up / down                                             |
| None              | `<leader>bl`      |  Normal       | Buffer - List                                                            |
| None              | `<leader>bn`      |  Normal       | Buffer - Next                                                            |
| None              | `<leader>bp`      |  Normal       | Buffer - Previous                                                        |
| Nvim-Tree         | `<leader>ee`      |  Normal       | Explorer - Toggle                                                        |
| Nvim-Tree         | `<leader>ef`      |  Normal       | Explorer - Toggle and current file is selected                           |
| Nvim-Tree         | `<leader>er`      |  Normal       | Explorer - Refresh                                                       |
| Telescope         | `<leader>ff`      |  Normal       | File - Find                                                              |
| Telescope         | `<leader>fg`      |  Normal       | File - Grep                                                              |
| Telescope         | `<leader>fb`      |  Normal       | File - Buffers                                                           |
| Telescope         | `<leader>fs`      |  Normal       | File - Search                                                            |
| Telescope         | `<leader>fo`      |  Normal       | File - Old (Recently opened)                                             |
| Telescope         | `<leader>fh`      |  Normal       | File - Help Tags                                                         |
| Telescope         | `<leader>fm`      |  Normal       | File - Marks                                                             |
| Maximizer         | `<leader>m`       |  Normal       | Maximize current spit view                                               |
| Nvim-LSP          | `gr`              |  Normal       | Go - Reference                                                           |
| Nvim-LSP          | `gd`              |  Normal       | Go - definition                                                          |
| Nvim-LSP          | `gD`              |  Normal       | Go - References                                                          |
| Nvim-LSP          | `gi`              |  Normal       | Go - Implementation                                                      |
| Nvim-LSP          | `gy`              |  Normal       | Go - Type definitions                                                    |
| Nvim-LSP          | `<leader>rn`      |  Normal       | Smart ReName a function accross the file                                 |
| Nvim-LSP          | `<leader>rs`      |  Normal       | Restart LSP                                                              |
| Nvim-LSP          | `K`               |  Normal       | Open documentation of what's under the cursor                            |
| Comments          | `gcc`             |  N & V        | Comment / Un-comment the current line                                    |
| Comments          | `gcip`            |  N & V        | Comment / Un-comment Inside Paragraph                                    |
| Comments          | `gb`              |  N & V        | Comment / Un-comment a Block (e.g. like /* */ in C)                      |
| Harpoon           | `<leader>hh`      |  Normal       | Harpoon - Open menu                                                      |
| Harpoon           | `<leader>hm`      |  Normal       | Harpoon - Mark current file                                              |
| Harpoon           | `<leader>hn`      |  Normal       | Harpoon - Go to the next Mark                                            |
| Harpoon           | `<leader>ho`      |  Normal       | Harpoon - Go to the previous Mark                                        |

### NvimTree specific

<img align="right" width="30%" src="examples/capture_tree.jpg" alt="Screenshot">

Navigating in NvimTree (mainly default settings) </br>
- ctrl-t     = Open file in new tab </br>
- ctrl-v     = Open in vertical split </br>
- ctrl-x     = Open in horizontal split </br>
- Enter or o = Open in a new buffer </br>
- Tab        = Open in a new buffer but stay in the Tree </br>
- a          = Create a new file / folder </br>
- d          = Delete a file or folder </br>

### CMP Specific (completion)
<img align="right" width="30%" src="examples/capture_cmp.jpg" alt="Screenshot">

Completion navigation (mainly default settings)
- Ctrl-k = previous suggestion</br>
- Ctrl-j = next suggestion</br>
- Ctrl-u = Scroll in the documentation (-4)</br>
- Ctrl-d = Scroll in the documentation (+4)</br>
- Ctrl-Space = show completion suggestions</br>
- Ctrl-e = close completion window</br>
- Enter = confirm</br>

### Telescope Specific (Fuzzy Finder) 
<img align="right" width="30%" src="examples/capture_treesiter.jpg" alt="Screenshot">

Navigation and interaction with Telescope (mainly default settings)
- Ctrl-h = Open in new Horizontal split</br>
- Ctrl-v = Open in new Vertical split</br>
- Ctrl-t = Open in a new Tab</br>
- Ctrl-k = Scroll up</br>
- Ctrl-l = Scroll down</br>

## My cheat sheet (Standard Vim / Nvim)

This is not yet another manual or cheat sheet.</br>
The goal is to maintain here the shortcuts that I'm frequently using.

### Mode switching

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `i`                        | Enter Insert mode                                                               |
| `:`                        | Enter Command mode                                                              |
| `R`                        | Enter Replace mode                                                              |
| `v`                        | Enter Visual mode (hilighting)                                                  |
| `V`                        | Enter line Visual mode (hilighting)                                             |
| `<ctrl>v`                  | Enter Visual block mode (hilighting)                                            |
| `esc`                      | Return to Normal mode                                                           |

### 'Command' mode 

Enter in <b>Command</b> mode by typing ':'

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `:q`                       | 'Quit' - will fail in case of unsaved changes                                   |
| `:q!`                      | 'Quit' - Force Quit (Discard unsaved changes)                                   |
| `:w`                       | 'Write' - Save current file                                                     |
| `:wa`                      | 'Write all' - Save all open files                                               |
| `:wq` / `:x`               | 'Write & Quit' - Save current file & Quit                                       |
| `:e filename`              | 'Edit' - Open filename in current buffer                                        |
| `:[RANGE]s/FOO/BAR/[FLAGS]`| 'Substitue' FOO with BAR for the current line                                   |
| `:sp [file]` / `:vs [file]`| Split horizontal / vertical, optionnaly add a file                              |
| `:[+\|-][LINE]`            | Go To Line [LINE]. + or - to be used for relative lines                         |

| SUBSTITUTE RANGE  | Description                                                |
|-------------------|------------------------------------------------------------|
| `%`               | Entire File                                                |
| `’<,’>'`          | Current selection, default range in visual mode            |
| `25`              | Line 25                                                    |
| `25,50`           | Line 25 - 50                                               |
| `$`               | Last line; can be combined with other lines as in ‘50,$’   |
| `.`               | Current line; can be combined with other lines as in ‘.,50’|

| SUBSTITUTE FLAGS      | Description                                                |
|-----------------------|------------------------------------------------------------|
| `g`                   | Global, for the entire file                                |
| `i`                   | Ignore case                                                |
| `c`                   | Confirm each subtitution                                   |

### 'Normal' mode - Navigation

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `h` / `j` / `k` / `l`      | Move left / down / up / right                                                   |
| `H` / `M` / `L`            | Top / Middle / Bottom line on the screen                                        |
| `zz` / `zt` / `zb`         | Center / Top / Bottom this line                                                 |
| `gg` / `G`                 | First line / last line of the file                                              |
| `e` / `b` / `w`            | End of the word / Beginning of the word / Beginning of the next word            |
| `:[+\|-][LINE]`            | Go To Line [LINE]. + or - to be used for relative lines                         |
| `[NUMBER]j` / `[NUMBER]k`  | Go Up / Down [NUMBER] lines (i.e. useful with relative line numbers)            |
| `0` / `^`                  | Beginning of the line / First white space of the line                           |
| `$`                        | End of the line                                                                 |
| `%`                        | Move to matching parenthesis, bracket or curly brace                            |
| `f{c}` / `F{c}`            | Go forward / backward to character {c}                                          |
| `t{c}` / `T{c}`            | Go towards next / previous occurence of character {c} & stop before             |
| `;` / `,`                  | Repeat previous f, F, t, or T movement forwards                                 |
| `[COUNT]{` / `[COUNT]}`    | [COUNT] paragraphs backward / forward                                           |
| `ctrl-u` / `ctrl-d`        | Half-Page Up / Down                                                             |
| `ctrl-b` / `ctrl-f`        | Page Up / Down                                                                  |
| `/text` / `n` / `N`        | Search - Search text (i.e. can contain regexp) / n - next / N - Previous        |
| `*` / `#`                  | Search - Next / previous for the whole word under the cursor                    |
| `m{c}`                     | Mark - Save current location in register {c}                                    |
| `'{c}`                     | Mark - Go to the mark saved in register {c}                                     |
| `[COUNT]gt` / `gT`         | Go to tab page [COUNT]                                                          |

<i> The left, right, up and down arrow keys can also be used to navigate. </i>

### 'Normal' mode - Editing

<p>Yank / Cut / Delete commands operate on the specified range,<br> 
    - If in <b>Visual</b> mode, that range is the highlighted text <br>
    - If in <b>Normal</b> mode, that range is specified by a series of modifiers to the commands</p>

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `i` / `I`                  | 'Insert' Get into Insert mode / At the first white space of the line            |
| `a` / `A`                  | 'Append' Get into Insert mode after the cursor / At the end of the line         |
| `r` / `R`                  | 'Replace' Get into Replace mode for 1 character / for the entire line           |
| `s` / `S`                  | 'Substitue' Character / Line and get into Insert mode                           |
| `x` / `X`                  | 'Delete' forward / backward from current character                              |
| `u` /  `Ctrl-R`            | Undo / Redo                                                                     |
| `o` / `O`                  | Get into Insert mode create a line below / create a line above                  |
| `C`                        | Change current line - Delete rest of the line and get into Insert mode          |
| `D`                        | Change current line - Delete rest of the line and stay in Normal mode           |
| `Y`                        | Yank current line - Copy rest of the line and stay in Normal mode               |
| `cc`                       | Change / Cut - Delete current line and get into Insert mode                     |
| `dd`                       | Delete - Delete entire line                                                     |
| `yy`                       | Yank - Copy the entire line get and stay in Normal mode                         |
| `P` / `p`                  | Paste before the cursor / after the cursor                                      |
| `X` / `x`                  | Delete character before the cursor / after the cursor                           |
| `cw`                       | Change / Cut Word - Delete end of the word and get into Insert mode             |
| `c4w`                      | Change / Cut 4 Words - Delete end of the words, next 4 and get into Insert mode |
| `c4l`                      | Change / Cut 4 Letters - Delete next 4 letters and get into Insert mode         |
| `ciw`                      | Change / Cut In Word - Delete current word and get into Insert mode             |
| `ci(`                      | Change / Cut Inside Parenthesis                                                 |
| `dw`                       | Delete Word - Delete end of the word and stay in Normal mode                    |
| `diw`                      | Delete In Word - Delete current word and stay in Normal mode                    |
| `dip`                      | Delete Inside Paragraph - Delete current Paragraph                              |
| `yy`                       | Yank - Copy the entire line get and stay in Normal mode                         |
| `yw`                       | Yank Word - Copy end of the word and stay in Normal mode                        |
| `yiw`                      | Yank In Word - Copy current word and stay in Normal mode                        |
| `xp`                       | Transpose current character                                                     |
| `.`                        | Repeat the last change that was made                                            |
| `[COUNT]<Ctrl-a\|x>`       | Increment or Decrement the number under the cursor,optionnaly use COUNT         |

<p><i>
'i': Inside
- 'a': Around
- 'w': Word
- 's': Sentence
- 'l': Letter
- 'p': Paragraph
</i></p>

### 'Normal' mode 'g' shortcuts

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `gj` / `gk`                | Move up/down in case of text spanning over multiple lines                       |
| `g$` / `g0`/ `g^`          | Same as existing navigation shortcuts but operating for spanning text           |
| `gqq`                      | Transform spanning text to seperate lines                                       |
| `gJ` / `J`                 | Join the current line and the line beneath it with no space / keep a space      |
| `gU` / `gu`                | Uppercase / Lowercase (e.g. 'gUiw' -> full word under cursor in UPPERCASE)      |
| `g~`                       | Switching capitalization                                                        |
| `gUU` / `guu`              | Uppercase / Lowercase the entire line                                           |
| `gf`                       | Open the file under the cursor in nvim                                          |
| `gv`                       | Jump back to previouly seclected text and go back into 'Visual' mode            |
| `g&`                       | Execute the previous substituion accross the entire file                        |

## Insert Mode

| Shortcut                   | Description                                                       |
|----------------------------|-------------------------------------------------------------------|
| `<Ctrl-o> {Command}`       | Execute a command in Insert mode                                  |

