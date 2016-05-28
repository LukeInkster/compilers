
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
label904:
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jl label905
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rbx, %rax
	jge label907
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label903
	jmp label906
label907:
	movq 24(%rbp), %rax
	movq %rax, -8(%rbp)
label906:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label903
	jmp label904
label905:
	movq $0, %rax
	movq %rax, 16(%rbp)
	jmp label903
label903:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label909
	movq $1, %rax
	jmp label910
label909:
	movq $0, %rax
label910:
	movq %rax, %rdi
	call assertion
	movq $10, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $10, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label911
	movq $1, %rax
	jmp label912
label911:
	movq $0, %rax
label912:
	movq %rax, %rdi
	call assertion
	movq $11, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $11, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label913
	movq $1, %rax
	jmp label914
label913:
	movq $0, %rax
label914:
	movq %rax, %rdi
	call assertion
	movq $1212, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label915
	movq $1, %rax
	jmp label916
label915:
	movq $0, %rax
label916:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1212, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label917
	movq $1, %rax
	jmp label918
label917:
	movq $0, %rax
label918:
	movq %rax, %rdi
	call assertion
label908:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl main
main:
	pushq %rbp
	call wl_main
	popq %rbp
	movq $0, %rax
	ret

	.data
