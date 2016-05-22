
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label740
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label738
label740:
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label741
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label738
label741:
label739:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label738
label738:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $0, %rax
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
	jnz label743
	movq $1, %rax
	jmp label744
label743:
	movq $0, %rax
label744:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label745
	movq $1, %rax
	jmp label746
label745:
	movq $0, %rax
label746:
	movq %rax, %rdi
	call assertion
label742:
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
