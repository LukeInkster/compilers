
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label729
label727:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label725
	jmp label728
label729:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label731
label728:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label725
	jmp label730
label731:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label733
label730:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label725
label733:
label726:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label725
label725:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $114, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label736
	movq $1, %rax
	jmp label737
label736:
	movq $0, %rax
label737:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $103, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label738
	movq $1, %rax
	jmp label739
label738:
	movq $0, %rax
label739:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $98, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label740
	movq $1, %rax
	jmp label741
label740:
	movq $0, %rax
label741:
	movq %rax, %rdi
	call assertion
label735:
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
str0:
	.asciz "RED"
str1:
	.asciz "BLUE"
str2:
	.asciz "GREEN"
str3:
	.asciz ""
