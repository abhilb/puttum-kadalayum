


function! asmhelp#load()
    if !exists("g:asm_mini_docu")
        let g:asm_mini_docu = {
                    \ 'adc'	: 'Add with carry',
                    \ 'add'     : 'Add',
                    \ 'b'       : 'Branch',
                    \ 'bic'     : 'Bit clear',
                    \ 'bl'      : 'Branch with link'
                    \ 'bx'      : 'Branch and exchange'
                    \ 'cdp'     ; 'Coprocessor data processing'
                    \ 'cmn'     : 'Compare negative'
                    \ 'cmp'     : 'Compare'
                    \ 'eor'     : 'Exclusive OR'
                    \ 'ldc'     : 'Load coprocessor from memory'
                    \ 'ldm'     : 'Load multiple registers'
                    \ 'ldr'     : 'Load register from memory'
                    \ 'mcr'     : 'Move CPU register to coprocessor register'
                    \ 'mla'     : 'Multiply accumlate'
                    \ 'mov'     : 'Move register or constant'
                    \ 'mrc'     : 'Move from coprocessor register to cpu register'
                    \ 'mrs'     : 'Move PSR status/flags to register'
                    \ 'msr'     : 'Move register to PSR status/flags'
                    \ 'mul'     : 'Multiply'
                    \ 'mvn'     : 'Move negative number'
                    \ 'orr'     : 'OR'
                    \ 'rsb'     : 'Reverse subtract'
                    \ 'rsc'     : 'Reverse subtract with carry'
                    \ 'sbc'     : 'Subtract with carry'
                    \ 'stc'     : 'Store coprocessor register to memory'
                    \ 'stm'     : 'Store multiple'
                    \ 'str'     : 'Store register to memory'
                    \ 'sub'     : 'Subtract'
                    \ 'swi'     : 'Software interrup'
                    \ 'swp'     : 'Swap register with memory'
                    \ 'teq'     : 'Test bitwise equality'
                    \ 'tst'     : 'Test bits'
                    \ }
    endif
endfunction
