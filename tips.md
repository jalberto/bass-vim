# Commands

* <ldr>dbl  Del blank lines
* <ldr>rci  Indent w ruby-code
* <ldr>ml   Add modeline

# Select

* <ldr>gg  Select all
* vi)      select inside ()

## TextObjs 

* var  Select ruby block
* vir  Select inner ruby block
* cir  Change insie ruby block

* cit     Change inside tag
* yit/dit yank/deletes inside tag

# Toggles

* <ldr>n  Line number
* <ldr>nn Relative Line number

# Movement/Navigation

* %         Go to pair
* gg/G      File Start/End
* gv        Last yanked
* gb        Last pasted
* w/b       Next/Prev word
* C-w + gf  Go to file

* S + <-/->   Mv buffers
* C + <-/->   Mv tabs
* C + <hjkl>  Move
* -           Move to window (choosewin)

* C + ]      Find Tag
* C + r      Back from tag
* C + W}     Preview tag
* C + Enter  Tag in new tab
 * C + w c   close and back

* ]s  Proxima palabra mal escrita
* [s  Palabra anterior mal escrita
* z=  Lista de correciones

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
## Surronding

* yss" -> "h w" -> cs"' -> 'h w' -> cs"<q> -> <q>h w</q>
* ds" (quitar delimitadores)
* ysiw> -> <h>
* yss> -> <h w>
* ysiw<b> -> <b>h</b>
* M-v S<p class=x>

## Terminal

* <ldr>tf  Send file content to REPL
* <ldr>t   Send line or visual selection

* ¬        Toggle terminal
* <ldr>th  Hide terminal
* <ldr>tl  Clean terminal
* <ldr>tc  Close terminal

* :Trc  Rails console
* :Trn  Rails notes

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
