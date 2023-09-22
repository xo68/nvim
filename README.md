<h1 align="center"> NeoVim / nvim </h1>

## About

<img align="right" width="40%" src="examples/capture_main.jpg" alt="Screenshot">

The purpose of this repository is
- To store my configuration
- To make it available for re-use and learning purpose
- To keep track of my NVim journey and learnings


## Sample of key plugins 

 - Lazy (Plugins manager for NeoVim)
 - Mason (Plugins manager for Linter, LSP, DAP, etc.)
 - Telescope, TreeSitter, Harpoon
 - Comment, LuaSnip-cmp, Dressing, Autoclose
 - Lualine, Luatab
 - nvim-dap, nvim-dap-ui
 - nvim-lspconfig, nvim-cmp 

## My custom configuration

<i>In my configuration \<Leader\> is the space bar </i>

| Plugin            | Shortcut          | Mode          | Description                                                              |
|-------------------|-------------------|---------------|--------------------------------------------------------------------------|
|                   | `<leader>sv`      |  Normal       | Split - Vertical                                                         |
|                   | `<leader>sh`      |  Normal       | Split - Horizonal                                                        |
|                   | `<leader>se`      |  Normal       | Split - Equal size for all splits                                        |
|                   | `<leader>sx`      |  Normal       | Split - Close current split view                                         |
|                   | `<Option>h`       |  Normal       | Split resize vertical -10 (i.e. Option key from MacBook keyboard)        |
|                   | `<Option>l`       |  Normal       | Split resize vertical +10                                                |
|                   | `<Option>k`       |  Normal       | Split resize horizontal -10                                              |
|                   | `<Option>h`       |  Normal       | Split resize horizontal +10                                              |
|                   | `<leader>to`      |  Normal       | Tab Open - New tab                                                       |
|                   | `<leader>tx`      |  Normal       | Tab Close                                                                |
|                   | `<leader>tn`      |  Normal       | Tab Next                                                                 |
|                   | `<leader>tp`      |  Normal       | Tab Previous                                                             |
|                   | `<leader>tb`      |  Normal       | Tab Buffer - Open current buffer in a new tab                            |
|                   | `>` / `<`         |  Visual       | Indent Right / Left                                                      |
|                   | `<Ctrl>{j\|k}`    |  Visual       | Move selected text Up / down                                             |
|                   | `<leader>bl`      |  Normal       | Buffer - List                                                            |
|                   | `<leader>bn`      |  Normal       | Buffer - Next                                                            |
|                   | `<leader>bp`      |  Normal       | Buffer - Previous                                                        |
| Nvim-Tree         | `<leader>ee`      |  Normal       | Explorer - Toggle                                                        |
| Nvim-Tree         | `<leader>ef`      |  Normal       | Explorer - Toggle and current file is selected                           |
| Nvim-Tree         | `<leader>er`      |  Normal       | Explorer - Refresh                                                       |
| Telescope         | `<leader>ff`      |  Normal       | File Find                                                                |
| Telescope         | `<leader>fg`      |  Normal       | File Grep                                                                |
| Telescope         | `<leader>fb`      |  Normal       | File Buffers                                                             |
| Telescope         | `<leader>fs`      |  Normal       | File Search                                                              |
| Telescope         | `<leader>fo`      |  Normal       | File Old (Recently opened)                                               |
| Telescope         | `<leader>fh`      |  Normal       | Fuzzy Help Tags                                                          |
| Maximizer         | `<leader>m`       |  Normal       | Maximize current split view                                              |
| Nvim-LSP          | `gr`              |  Normal       | Go Reference                                                             |
| Nvim-LSP          | `gd`              |  Normal       | Go definition                                                            |
| Nvim-LSP          | `gD`              |  Normal       | Go References                                                            |
| Nvim-LSP          | `gi`              |  Normal       | Go Implementation                                                        |
| Nvim-LSP          | `gy`              |  Normal       | Go Tyoe definitions                                                      |
| Nvim-LSP          | `<leader>rn`      |  Normal       | Smart ReName a function accross the file                                 |
| Nvim-LSP          | `<leader>rs`      |  Normal       | Restart LSP                                                              |
| Nvim-LSP          | `K`               |  Normal       | Open documentation of what's under the cursor                            |
|                   | ``      |  Normal       |                                                                          |

Shortcut in Insert mode....

## NvimTree specific
<img align="right" width="30%" src="examples/capture_tree.jpg" alt="Screenshot">

Navigating in NvimTree (mainly default settings)
- ctrl-t     = Open file in new tab </br>
- ctrl-v     = Open in vertical split </br>
- ctrl-x     = Open in horizontal split </br>
- Enter or o = Open in a new buffer </br>
- Tab        = Open in a new buffer but stay in the Tree </br>
- a          = Create a new file / folder </br>
- d          = Delete a file or folder </br>

## CMP Specific (completion)
<img align="right" width="30%" src="examples/capture_cmp.jpg" alt="Screenshot">

Completion navigation (mainly default settings)
- Ctrl-k = previous suggestion</br>
- Ctrl-j = next suggestion</br>
- Ctrl-u = Scroll in the documentation (-4)</br>
- Ctrl-d = Scroll in the documentation (+4)</br>
- Ctrl-Space = show completion suggestions</br>
- Ctrl-e = close completion window</br>
- Enter = confirm</br>

# My cheat sheet

## Mode switching & basics

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `i`                        | Enter Insert mode                                                               |
| `:`                        | Enter Command mode                                                              |
| `R`                        | Enter Replace mode                                                              |
| `v`                        | Enter Visual mode (hilighting)                                                  |
| `V`                        | Enter line Visual mode (hilighting)                                             |
| `<ctrl>v`                  | Enter Visual block mode (hilighting)                                            |
| `esc`                      | Return to Normal mode                                                           |

## 'Command' mode 

Enter ig <b>Command</b> mode by typing ':' in <b>Normal</b> mode

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `:q`                       | 'Quit'                                                                          |
| `:q!`                      | 'Quit' - Force Quit (Discard unsaved changes)                                   |
| `:w`                       | 'Write' - Save current file                                                     |
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

## 'Normal' mode - Navigation

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
| `%`                        | Move to matching parenthesis, bracket or brace                                  |
| `f{c}` / `F{c}`            | Go forward / backward to character {c}                                          |
| `[COUNT]{` / `[COUNT]}`    | [COUNT] paragraphs backward / forward                                           |
| `ctrl-u` / `ctrl-d`        | Half-Page Up / Down                                                             |
| `ctrl-b` / `ctrl-f`        | Page Up / Down                                                                  |
| `/text` / `n` / `N`        | Search for some text (i.e. can contain regexp) / n - next find / N - Previous   |
| `*` / `#`                  | Search, next / previous for the whole word under the cursor                     | 

<i> The left, right, up and down arrow keys can also be used to navigate. </i>

## 'Normal' or 'Visual' mode - Text manipulation 

| Shortcut                   | Description                                                                     |
|----------------------------|---------------------------------------------------------------------------------|
| `~`                        | Toggle case of character beneath the cursor                                     |
| `gJ` / `J`                 | Join the current line and the line beneath it with no space / keep a space      |
| `gU` / `gu`                | Uppercase / Lowercase (e.g. 'gUiw' -> full word under cursor in UPPERCASE)      |
| `gUU` / `guu`              | Uppercase / Lowercase the entire line                                           |

## 'Normal' mode - Editing

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
| `xp`                       | Transpose current character with that to its right                              |

<p><i>
'i': Inside
- 'a': Around
- 'w': Word
- 's': Sentence
- 'l': Letter
- 'p': Paragraph
</i></p>

## Insert Mode

## Debugging

<h3>Coming...</h3>
