
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label652
label650:
	movq 24(%rbp), %rcx
	movq $0, %rdx
	cmpq %rcx, %rdx
	jnz label656
label654:
	leaq str0(%rip), %rdi
	movq %rdi, 16(%rbp)
	jmp label648
	jmp label655
label656:
	movq $1, %rdx
	cmpq %rcx, %rdx
	jnz label658
label655:
	leaq str1(%rip), %rdi
	movq %rdi, 16(%rbp)
	jmp label648
	jmp label657
label658:
	movq $2, %rdx
	cmpq %rcx, %rdx
	jnz label660
label657:
	leaq str2(%rip), %rdi
	movq %rdi, 16(%rbp)
	jmp label648
label660:
label653:
	jmp label651
label652:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label663
label651:
	leaq str3(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label648
	jmp label662
label663:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label665
label662:
	leaq str4(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label648
label665:
label649:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label648
label648:
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
	leaq str0(%rip), %rax
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
	jnz label668
	movq $1, %rax
	jmp label669
label668:
	movq $0, %rax
label669:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
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
	jnz label670
	movq $1, %rax
	jmp label671
label670:
	movq $0, %rax
label671:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
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
	jnz label672
	movq $1, %rax
	jmp label673
label672:
	movq $0, %rax
label673:
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
	jnz label674
	movq $1, %rax
	jmp label675
label674:
	movq $0, %rax
label675:
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
	jnz label676
	movq $1, %rax
	jmp label677
label676:
	movq $0, %rax
label677:
	movq %rax, %rdi
	call assertion
label667:
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
	.asciz "RED RED"
str1:
	.asciz "RED BLUE"
str2:
	.asciz "RED GREEN"
str3:
	.asciz "BLUE ???"
str4:
	.asciz "GREEN ???"
str5:
	.asciz ""
