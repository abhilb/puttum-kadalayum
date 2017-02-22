

echom "Loading the docu"

function puttum-kadalayum#load()
    echom "Inside the function"
    if !exists("g:asm_mini_docu")
        echom "Creating the docu dictionary"
        let g:asm_mini_docu = {
            'mov' : 'Copies the value of the second operand into the first operand (destination register)',
            'movt' : 'Writes a 16 bit immediate value (second operand) to the top halfword of its desitation register'
        }
    endif
endfunction

echom "Finished loading the docu"
