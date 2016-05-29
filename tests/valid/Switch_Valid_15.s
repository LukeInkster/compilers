
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label724
label722:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label720
	jmp label723
label724:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label726
label723:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label720
	jmp label725
label726:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label728
label725:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label720
label728:
label721:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label720
label720:
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
	jnz label731
	movq $1, %rax
	jmp label732
label731:
	movq $0, %rax
label732:
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
	jnz label733
	movq $1, %rax
	jmp label734
label733:
	movq $0, %rax
label734:
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
	jnz label735
	movq $1, %rax
	jmp label736
label735:
	movq $0, %rax
label736:
	movq %rax, %rdi
	call assertion
label730:
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
