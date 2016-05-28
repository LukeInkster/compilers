
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label723
label721:
	jmp label722
label723:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label725
label722:
	jmp label724
label725:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label727
label724:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label728
	jmp label720
	jmp label728
label728:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	subq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label720
	jmp label726
label727:
label726:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
	jmp label720
label730:
label720:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label719
label719:
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
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label733
	movq $1, %rax
	jmp label734
label733:
	movq $0, %rax
label734:
	movq %rax, %rdi
	call assertion
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
	jnz label735
	movq $1, %rax
	jmp label736
label735:
	movq $0, %rax
label736:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
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
	jnz label737
	movq $1, %rax
	jmp label738
label737:
	movq $0, %rax
label738:
	movq %rax, %rdi
	call assertion
	movq $4, %rax
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
	jnz label739
	movq $1, %rax
	jmp label740
label739:
	movq $0, %rax
label740:
	movq %rax, %rdi
	call assertion
label732:
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
