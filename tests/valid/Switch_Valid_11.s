
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label568
label566:
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label564
	jmp label567
label568:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label570
label567:
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label564
	jmp label569
label570:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label572
label569:
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label564
label572:
label565:
	movq $-1, %rax
	movq %rax, 16(%rbp)
	jmp label564
label564:
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
	leaq str0(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label575
	movq $1, %rax
	jmp label576
label575:
	movq $0, %rax
label576:
	movq %rax, %rdi
	call assertion
	movq $1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str1(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label577
	movq $1, %rax
	jmp label578
label577:
	movq $0, %rax
label578:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str2(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label579
	movq $1, %rax
	jmp label580
label579:
	movq $0, %rax
label580:
	movq %rax, %rdi
	call assertion
	movq $-1, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str3(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label581
	movq $1, %rax
	jmp label582
label581:
	movq $0, %rax
label582:
	movq %rax, %rdi
	call assertion
label574:
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
	.asciz "Red"
str1:
	.asciz "Blue"
str2:
	.asciz "Green"
str3:
	.asciz "Dave"
