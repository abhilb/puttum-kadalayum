" File: asmhelp.vim
" Author: Abhilash Babu
" Version: 0.1.0
" email: abhilashbabuj at gmail dot com
" Copyright: Copyright (c) 2017-2018 Abhilash Babu
" License: Free software.


if exists('loaded_asm_help')
finish
endif

let loaded_asm_help=1
let s:cpo_save = &cpo
set cpo&vim

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
                echohl asmhelpmsg |  echo op_docu_rt | echohl None
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
                echohl asmhelpmsg | echo op_docu_rt | echohl None
            endif
        endif
    endif
endif
normal! j
endfunction

" ==============================================================
" The below function is from tagbar.vim
" https://github.com/tagbar/blob/master/autoload/tagbar.vim
" ==============================================================
function! s:goto_win(winnr, ...) abort
    let cmd = type(a:winnr) == type(0) ? a:winnr . 'wincmd w'
                                    \: 'wincmd ' . a:winnr
    let noauto = a:0 ? a:1 : 0

    if noauto
        noautocmd execute cmd
    else
        execute cmd
    endif

endfunction

function! ToggleAsmHelp()
    let helpwinnr = bufwinnr('__asm_help_win__')
    if helpwinnr != -1
        call s:CloseAsmHelp()
        return
    endif
    call s:OpenAsmHelp()
endfunction


function! s:mark_window() abort
    let w:help_win_mark = 1
endfunction

function! s:goto_markedwin()
    for window in range(1, winnr('$'))
        call s:goto_win(window)
        if exists('w:help_win_mark')
            unlet w:help_win_mark
            break
        endif
    endfor
endfunction

function! s:CloseAsmHelp()
    let helpwinnr = bufwinnr('__asm_help_win__')
    if helpwinnr == -1
        return 
    endif

    if winnr() == helpwinnr
        close
    else
        " @todo
        " mark the help window
        " go to the marked window
        " close the marked window..        
    endif
endfunction

function! s:OpenAsmHelp()
    let helpwinnr = bufwinnr('__asm_help_win__')
    if helpwinnr != -1
        if winnr() != helpwinnr
            call s:goto_win(helpwinnr)
        endif
        echom "help window already open"
        return
    endif

    exe 'silent keepalt botright vertical split __asm_help_win__'
endfunction

function! s:ToggleAsmMiniHelp()
    if exists("g:asm_mini_docu")
        unlet g:asm_mini_docu
    else
        call asmhelp#load()
    endif
endfunction

command! -bang -nargs=? AsmMiniHelp call s:ToggleAsmMiniHelp()
command! -bang -nargs=? AsmHelp call ToggleAsmHelp()

noremap <silent> <Up> : call <SID>AsmHelpMoveUp()<CR>
noremap <silent> <Down> : call <SID>AsmHelpMoveDown()<CR>

highlight todomsg ctermbg=red guibg=red ctermfg=yellow guifg=yellow term=bold

highlight asmhelpmsg ctermbg=green guibg=green ctermfg=blue guifg= blue term=bold

match todomsg /@todo/


let &cpo = s:cpo_save
unlet s:cpo_save
 
