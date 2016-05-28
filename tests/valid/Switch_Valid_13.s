
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label620
label618:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label624
label622:
	jmp label621
	jmp label623
label624:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label626
label623:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label616
	jmp label625
label626:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label628
label625:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label616
label628:
label621:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label616
	jmp label619
label620:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label631
label619:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label616
	jmp label630
label631:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label633
label630:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label616
label633:
label617:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label616
label616:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	movq $0, %rax
	movq %rax, -8(%rbp)
	movq $1, %rax
	movq %rax, -16(%rbp)
	movq $2, %rax
	movq %rax, -24(%rbp)
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label636
	movq $1, %rax
	jmp label637
label636:
	movq $0, %rax
label637:
	movq %rax, %rdi
	call assertion
	leaq str0(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -16(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label638
	movq $1, %rax
	jmp label639
label638:
	movq $0, %rax
label639:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -24(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -8(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label640
	movq $1, %rax
	jmp label641
label640:
	movq $0, %rax
label641:
	movq %rax, %rdi
	call assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -16(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label642
	movq $1, %rax
	jmp label643
label642:
	movq $0, %rax
label643:
	movq %rax, %rdi
	call assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $32, %rsp
	movq -8(%rbp), %rbx
	movq %rbx, 8(%rsp)
	movq -24(%rbp), %rbx
	movq %rbx, 16(%rsp)
	call wl_f
	addq $32, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -48(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label644
	movq $1, %rax
	jmp label645
label644:
	movq $0, %rax
label645:
	movq %rax, %rdi
	call assertion
label635:
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
	.asciz "RED BLUE"
str1:
	.asciz "RED GREEN"
str2:
	.asciz "RED RED"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
