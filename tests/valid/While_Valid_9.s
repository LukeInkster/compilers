
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
label925:
	movq -8(%rbp), %rax
	movq $10, %rbx
	cmpq %rbx, %rax
	jge label926
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	cmpq $0, %rax
	jz label927
	jmp label926
	jmp label927
label927:
	movq -8(%rbp), %rax
	movq $1, %rbx
	addq %rbx, %rax
	movq %rax, -8(%rbp)
	jmp label925
label926:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label924
label924:
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
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label929
	movq $1, %rax
	jmp label930
label929:
	movq $0, %rax
label930:
	movq %rax, %rdi
	call assertion
label928:
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
