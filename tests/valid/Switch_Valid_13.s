
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label677
label675:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label681
label679:
	jmp label678
	jmp label680
label681:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label683
label680:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label673
	jmp label682
label683:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label685
label682:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label673
label685:
label678:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label673
	jmp label676
label677:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label688
label676:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label673
	jmp label687
label688:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label690
label687:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label673
label690:
label674:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label673
label673:
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
	jnz label693
	movq $1, %rax
	jmp label694
label693:
	movq $0, %rax
label694:
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
	jnz label695
	movq $1, %rax
	jmp label696
label695:
	movq $0, %rax
label696:
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
	jnz label697
	movq $1, %rax
	jmp label698
label697:
	movq $0, %rax
label698:
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
	jnz label699
	movq $1, %rax
	jmp label700
label699:
	movq $0, %rax
label700:
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
	jnz label701
	movq $1, %rax
	jmp label702
label701:
	movq $0, %rax
label702:
	movq %rax, %rdi
	call assertion
label692:
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
