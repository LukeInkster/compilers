
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label682
label680:
	movq 24(%rbp), %rcx
	movq $0, %rdx
	cmpq %rcx, %rdx
	jnz label686
label684:
	jmp label683
	jmp label685
label686:
	movq $1, %rdx
	cmpq %rcx, %rdx
	jnz label688
label685:
	leaq str0(%rip), %rdi
	movq %rdi, 16(%rbp)
	jmp label678
	jmp label687
label688:
	movq $2, %rdx
	cmpq %rcx, %rdx
	jnz label690
label687:
	leaq str1(%rip), %rdi
	movq %rdi, 16(%rbp)
	jmp label678
label690:
label683:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label678
	jmp label681
label682:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label693
label681:
	leaq str3(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label678
	jmp label692
label693:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label695
label692:
	leaq str4(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label678
label695:
label679:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label678
label678:
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
	jnz label698
	movq $1, %rax
	jmp label699
label698:
	movq $0, %rax
label699:
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
	jnz label700
	movq $1, %rax
	jmp label701
label700:
	movq $0, %rax
label701:
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
	jnz label702
	movq $1, %rax
	jmp label703
label702:
	movq $0, %rax
label703:
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
	jnz label704
	movq $1, %rax
	jmp label705
label704:
	movq $0, %rax
label705:
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
	jnz label706
	movq $1, %rax
	jmp label707
label706:
	movq $0, %rax
label707:
	movq %rax, %rdi
	call assertion
label697:
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
