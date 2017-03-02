


function! asmhelp#load()
    if !exists("g:asm_mini_docu")
        let g:asm_mini_docu = {
                    \ 'mov'	: 'Copies the value of the second operand into the first operand (destination register)',
                    \ 'movt'	: 'Writes a 16 bit immediate value (second operand) to the top halfword of its desitation register',
                    \ 'bfc'     : 'Bit Field Clear | BFC Rd, #<lsb>, #<width>  | Rd[(width+lsb–1):lsb] := 0, other bits of Rd unaffected',
		    \ 'bfi'	: 'Bit Field Insert | BFI Rd, Rn, #<lsb>, #<width> Rd[(width+lsb–1):lsb] := Rn[(width-1):0], other bits of Rd unaffected',
		    \ 'sbfx'	: 'Signed Bit Field Extract | SBFX Rd, Rn, #<lsb>, #<width> Rd[(width–1):0] = Rn[(width+lsb–1):lsb], Rd[31:width] = Replicate( Rn[width+lsb–1] )',
		    \ 'ubfx'	: 'Unsigned Bit Field Extract | UBFX Rd, Rn, #<lsb>, #<width> Rd[(width–1):0] = Rn[(width+lsb–1):lsb], Rd[31:width] = Replicate( 0 )',
		    \ 'cmp'	: 'Compare CMP{cond} Rn, <Operand2> | N Z C V Update CPSR flags on Rn – Operand2',
		    \ 'cmn'	: 'Compare negative CMN{cond} | Rn, <Operand2> N Z C V Update CPSR flags on Rn + Operand2',
		    \ 'tst'	: 'Test TST{cond} Rn, <Operand2> N Z C Update CPSR flags on Rn AND Operand2',
		    \ 'teq'	: 'Test equivalence TEQ{cond} Rn, <Operand2> N Z C Update CPSR flags on Rn EOR Operand2',
		    \ 'and'	: 'AND AND{cond}{S} Rd, Rn, <Operand2> N Z C Rd := Rn AND Operand2',
		    \ 'eor'	: 'EOR EOR{cond}{S} Rd, Rn, <Operand2> N Z C Rd := Rn EOR Operand2',
		    \ 'orr'	: 'ORR ORR{cond}{S} Rd, Rn, <Operand2> N Z C Rd := Rn OR Operand2',
		    \ 'bic'	: 'Bit Clear BIC{cond}{S} Rd, Rn, <Operand2> N Z C Rd := Rn AND NOT Operand2'
                    \ }
    endif
endfunction
