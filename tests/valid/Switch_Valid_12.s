
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 32(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label647
label645:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label651
label649:
	leaq str0(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label643
	jmp label650
label651:
	movq $1, %rcx
	cmpq %rbx, %rcx
	jnz label653
label650:
	leaq str1(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label643
	jmp label652
label653:
	movq $2, %rcx
	cmpq %rbx, %rcx
	jnz label655
label652:
	leaq str2(%rip), %rcx
	movq %rcx, 16(%rbp)
	jmp label643
label655:
label648:
	jmp label646
label647:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label658
label646:
	leaq str3(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label643
	jmp label657
label658:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label660
label657:
	leaq str4(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label643
label660:
label644:
	leaq str5(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label643
label643:
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
	jnz label663
	movq $1, %rax
	jmp label664
label663:
	movq $0, %rax
label664:
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
	jnz label665
	movq $1, %rax
	jmp label666
label665:
	movq $0, %rax
label666:
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
	jnz label667
	movq $1, %rax
	jmp label668
label667:
	movq $0, %rax
label668:
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
	jnz label669
	movq $1, %rax
	jmp label670
label669:
	movq $0, %rax
label670:
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
	jnz label671
	movq $1, %rax
	jmp label672
label671:
	movq $0, %rax
label672:
	movq %rax, %rdi
	call assertion
label662:
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
