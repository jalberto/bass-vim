# Commande

* <ldr>dbl  Del blank lines
* <ldr>rci  Indensecretst w ruby-code
* <ldr>ml   Add modeline

# Select

* <ldr>gg  Select all
* vi)      select inside ()
* vaw - Visually select Around Word
* da” - Delete Around double quotes
* di] - Delete Inside square brackets
* ci{ - Change Inside curly braces
* dap - Delete Around Paragraph

## TextObjs

* var  Select ruby block
* vir  Select inner ruby block
* cir  Change insie ruby block

* cit     Change inside tag
* yit/dit yank/deletes inside tag

# Toggles

* <ldr>n  Line number
* <ldr>nn Relative Line number
* <ldr>c  Cursor lines
* <ldr>ct Tag sidebar

# Movement/Navigation

* %         Go to pair
* gg/G      File Start/End
* gv        Last yanked
* gb        Last pasted
* w/b       Next/Prev word
* C-w + gf  Go to file

* S + h/l     Mv Buffers
* C + h/l     Mv Tabs
* A + <hjkl>  Move Panel
* -           Move to window (choosewin)

* C + ]      Find Tag
* C + r      Back from tag
* C + W}     Preview tag
* C + Enter  Tag in new tab
 * C + w c   close and back

* ]s  Proxima palabra mal escrita
* [s  Palabra anterior mal escrita
* z=  Lista de correciones

# COC

Apply Code Actions

* <leader>a     for the current selected range
* <leader>aw    for the current word
* <leader>aas   for the current sentence
* <leader>aap   for the current paragraph

* <leader>rn    rename

# Copy/Paste

* C-r0  Copy insert mode
* C-rC-p0  Copy insert mode autoident

## Marks
a-z for local, A-Z global

* mx  Toggle mark x
* dmx Remove mark

(Signature plugin)

* m,      Place next mark
* m.      Toggle next mark
* ]`      Next mark
* [`      Prev mark
* m/      Display marks
* m[0-9]  Toggle marker
* m?      Display markers
* ]-      Next marker (same type)
* [-      Prev marker

# Plugins

## Emmet (html/css)
 
* trigger `,,`
* 'div>p#foo$*3>a'
* ie: https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL

## Surrond / Sandwich

* saiw( makes foo to (foo)
* sdb or sd( makes (foo) to foo
* srb" or sr(" makes (foo) to "foo"

## Terminal

* <ldr>tf  Send file content to REPL
* <ldr>t   Send line or visual selection

* ¬        Toggle terminal
* <ldr>th  Hide terminal
* <ldr>tl  Clean terminal
* <ldr>tc  Close terminal

* :Trc  Rails console
* :Trn  Rails notes

## FZF

* History
* BCommits
* Marks

## Fugitive

* :Gdiff
** |  2  |  1  |  3  |
*** head, result, merge
** diffget //[2/3]
** diffput //1
* :Gwrite
  * mantains the actual buffer as result

* Extradite!

## GitShade
To on/off highlite of newest lines
(brighter color)

* GitShade

## Align
In visual mode:

* Enter|  Align on 1st |
* Enter2| Align on 2nd |
* Enter*| Align on every |

* ss  split a block/hash
* sj  join a block/hash

## Rails.vim
* Emodel  Edit model
  * S/V/T  horizontal/vertical/tab
* Econtroller foo!  create the file
* Rextract to partial/concern

* <ldr>rap  RAddParameter
* <ldr>rcpc RConvertPostConditional
* <ldr>rel  RExtractLet
* <ldr>rec  RExtractConstant
* <ldr>relv RExtractLocalVariable
* <ldr>rit  RInlineTemp
* <ldr>rrlv RRenameLocalVariable
* <ldr>rriv RRenameInstanceVariable
* <ldr>rem  RExtractMethod

* <ldr>z    I18n

* rs keys to symbols
* rt keys to strings
* rr keys to Ruby 1.9 format

* <ldr>r/R search doc ri
* <ldr>k/K search doc ri cussor

* <ldr>b   change block style

## MultiCursor
* visual: C-n c/s
* normall: C-n a/i/A/I

## Commenter

* gc{motion}
* gcc         current line
* gc/gC       (visual mode)
* <c-_><c-_>  (insert mode)
