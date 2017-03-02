" File: asmhelp.vim
" Author: Abhilash Babu
" Version: 0.0.2
" email: abhilashbabuj at gmail dot com
" Copyright: Copyright (c) 2017-2018 Abhilash Babu
" License: Free software.


if exists('loaded_asm_help')
finish
endif

let loaded_asm_help=1
let s:cpo_save = &cpo
set cpo&vim

let s:mini_documentation_map = {}

function! s:AsmHelp()
echom "trying to open the window on the right"

"Open a vertical split    
"vsplit __asm_help__
exe "rightbelow vertical new"

"Delete the contents of the buffer
normal! ggdG

"Set the filetype and buffer type    
setlocal filetype=text
setlocal buftype=nofile

call append(0, 'asm help')

endfunction

"---------------------------------------------------
"function mapped to the up key
"display the mini documentation as an echo message.
"---------------------------------------------------
function! s:AsmHelpMoveUp()
if exists("g:asm_mini_docu")
    let line_num = line('.') - 1
    let line = getline(line_num)
    if !empty(line)
        let lt1 = split(line, ' ')
        
        if len(lt1) >= 1
            let op_token = lt1[0]
            let op_docu_rt = get(g:asm_mini_docu, op_token)
            if op_docu_rt == "0"
                echohl ErrorMsg | echo "Documentation not available for this instruction!!!" | echohl None
            else
                echo op_docu_rt
            endif
        endif
    endif
endif
normal! k
endfunction

"--------------------------------------------------
"function mapped to the <down> key
"display the mini documentation as an echo message
"--------------------------------------------------
function! s:AsmHelpMoveDown()
if exists("g:asm_mini_docu")
    let line_num = line('.') + 1
    let line = getline(line_num)
    if !empty(line)
        let lt1 = split(line, ' ')

        if len(lt1) >= 1
            let op_token = lt1[0]
            let op_docu_rt = get(g:asm_mini_docu, op_token)
            if op_docu_rt == "0"
                echohl ErrorMsg | echo "Documentation not available for this instruction!!!" | echohl None
            else
                echo op_docu_rt
            endif
        endif
    endif
endif
normal! j
endfunction

command -bang -nargs=? ShowAsmHelp call QFixToggle(<bang>0)
function! QFixToggle(forced)
if exists("g:qfix_win") && a:forced == 0
    echom g:qfix_win
else
    copen 1
    let g:qfix_win = winnr("$")
    echom g:qfix_win
endif
endfunction

command! -bang -nargs=? EnableAsmHelp call asmhelp#load()

nnoremap <leader>mah : call <SID>AsmMiniHelp()<CR>
nmap <leader>ah : call <SID>AsmHelp()<CR>
noremap <silent> <buffer> <F9> :exec 'source ' . bufname('%')<CR>
noremap <silent> <Up> : call <SID>AsmHelpMoveUp()<CR>
noremap <silent> <Down> : call <SID>AsmHelpMoveDown()<CR>


let &cpo = s:cpo_save
unlet s:cpo_save
 
