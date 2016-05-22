
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label858
label856:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label854
	jmp label857
label858:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label860
label857:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label854
	jmp label859
label860:
label859:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label854
label862:
label855:
label854:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label865
	movq $1, %rax
	jmp label866
label865:
	movq $0, %rax
label866:
	movq %rax, %rdi
	call assertion
	movq $234, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label867
	movq $1, %rax
	jmp label868
label867:
	movq $0, %rax
label868:
	movq %rax, %rdi
	call assertion
	movq $456, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label869
	movq $1, %rax
	jmp label870
label869:
	movq $0, %rax
label870:
	movq %rax, %rdi
	call assertion
label864:
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
