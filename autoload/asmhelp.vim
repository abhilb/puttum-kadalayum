

echom "Loading the docu"

function! asmhelp#test()
    echom "Test function!"
endfunction

"function! puttum-kadalayum#load()
"    if !exists("g:asm_mini_docu")
"        let g:asm_mini_docu = {
"            'mov' : 'Copies the value of the second operand into the first operand (destination register)',
"            'movt' : 'Writes a 16 bit immediate value (second operand) to the top halfword of its desitation register'
"        }
"    endif
"endfunction

echom "Finished loading the docu"
