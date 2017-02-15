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
    let line_num = line('.') - 1
    let line = getline(line_num)
    if !empty(line)
        let lt1 = split(line, ' ')
        
        if len(lt1) >= 1
            let op_token = lt1[0]
            let op_docu_rt = get(s:mini_documentation_map, op_token)
            echo op_docu_rt
        endif
    endif
    normal! k
endfunction

"--------------------------------------------------
"function mapped to the <down> key
"display the mini documentation as an echo message
"--------------------------------------------------
function! s:AsmHelpMoveDown()
    let line_num = line('.') + 1
    let line = getline(line_num)
    if !empty(line)
        let lt1 = split(line, ' ')

        if len(lt1) >= 1
            let op_token = lt1[0]
            let op_docu_rt = get(s:mini_documentation_map, op_token)
            echo op_token
        endif
    endif
    normal! j
endfunction

command -bang -nargs=? QFix call QFixToggle(<bang>0)
function! QFixToggle(forced)
    if exists("g:qfix_width") && a:forced == 0
        cclose
        unlet g:qfix_win
    else
        copen 1
        let g:qfix_win = bufnr("$")
    endif
endfunction

function! s:AsmHelpInit()
    "read the text file that contains the documentation of 
    "all the asm commands
    "text file is written as follows
    "<asm mnemonic> : <one line explanation>
    
    let s:lines_list=readfile("mini_documentation.txt")
    
    for s:line in s:lines_list
        let s:line_tokens = split(s:line, ":")
        let op = s:line_tokens[0]
        let docu = s:line_tokens[1]
        let s:mini_documentation_map[op] = docu
        echo op
    endfor
endfunction

call s:AsmHelpInit()

nmap <leader>ah : call <SID>AsmHelp()<CR>
noremap <buffer> <F9> :exec 'source ' . bufname('%')<CR>
noremap <Up> : call <SID>AsmHelpMoveUp()<CR>
noremap <Down> : call <SID>AsmHelpMoveDown()<CR>

let &cpo = s:cpo_save
unlet s:cpo_save
 
