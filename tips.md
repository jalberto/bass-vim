# F-Keys

* S-F1  Tips
* C-F1  Abbr
* F2    NERDTreeToggle
* S-F2  NeoComplCacheToggle
* F3    FufFile
* C-F3  FufFileWithCurrentBufferDir
* T-F3  FufRenewCache
* F4    Tlist
* S-F4  Reg. tags in current dir
* C-F4  Reg. gem tags in current dir proj
* F5    List hidden chars
* S-F5  Number list
* C-F5  Set cursorline cursorcolumn
* T-F5  Disable parenthesis hilite
* F6    Set hlsearch
* C-F6  File Enc utf-8
* S-F6  File Enc iso8859-15
* F7    Set spell
* S-F7  Spelllang es
* C-F7  Spelllang en
* F8    VCSStatus
* T-F8  VCSCommit
* S-F8  VCSUpdate
* F9    Set Paste
* F10   LoadSession

# <leader> shorts (space)

* gg    Select all
* dbl   Del blank lines
* rci   Indent w ruby-code
* ml    Add modeline
* be/bs/bv    Buffer Explorer
* r     Interactive replace (after search)

# Navigation

* %           Go to pair
* gg/G        File Start/End
* w/b         Next/Prev word
* C-w + gf    Go to file
* S + <-/->   Mv buffers
* C + <-/->   Mv tabs
* C + <hjkl>  Move
* A + <-/->   Prev/Next tag
* C + ]       Find Tag
* C + r       Back from tag
* C + W}      Preview tag
* C + Enter   Tag in new tab
 * C+w c      close and back
* vi)  select inside ()
* - move to window
* m move to expression

* ]s    Proxima palabra mal escrita
* [s    Palabra anterior mal escrita
* z=    Lista de correciones

* var   Select ruby block
* vir   Select inner ruby block
* cir Change insie ruby block

* cit Change insie tag
* yit/dit yank/deletes

* gv  Last yanked
* gb  Last pasted
* C-r0  Copy insert mode
* C-rC-p0  Copy insert mode autoident

# Surronding

* yss" -> "h w" -> cs"' -> 'h w' -> cs"<q> -> <q>h w</q>
* ds" (quitar delimitadores)
* ysiw> -> <h>
* yss> -> <h w>
* ysiw<b> -> <b>h</b>
* M-v S<p class=x>

# Fugitive
* :Gdiff
** |  2  |  1  |  3  |
*** head, result, merge
** diffget //[2/3]
** diffput //1
* :Gwrite
  * mantains the actual buffer as result

* Extradite!

# GitShade
To on/off highlite of newest lines
(brighter color)

* GitShade

# Align
In visual mode:

* Enter|  Align on 1st |
* Enter2| Align on 2nd |
* Enter*| Align on every |

* ss  split a block/hash
* sj  join a block/hash

# Rails.vim
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

# MultiCursor
* visual: C-n c/s
* normall: C-n a/i/A/I

# Commenter

* gc{motion}
* gcc         current line
* gc/gC       (visual mode)
* <c-_><c-_>  (insert mode)
