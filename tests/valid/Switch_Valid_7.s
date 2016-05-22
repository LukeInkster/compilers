
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $78, %rbx
	cmpq %rax, %rbx
	jnz label705
	leaq str0(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label705:
	movq $66, %rbx
	cmpq %rax, %rbx
	jnz label706
	leaq str1(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label706:
	movq $82, %rbx
	cmpq %rax, %rbx
	jnz label707
	leaq str2(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label707:
	movq $81, %rbx
	cmpq %rax, %rbx
	jnz label708
	leaq str3(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label708:
	movq $75, %rbx
	cmpq %rax, %rbx
	jnz label709
	leaq str4(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label709:
	leaq str5(%rip), %rbx
	movq %rbx, -8(%rbp)
	jmp label704
label710:
label704:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label703
label703:
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
	movq $78, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label712
	movq $1, %rax
	jmp label713
label712:
	movq $0, %rax
label713:
	movq %rax, %rdi
	call assertion
	leaq str4(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $75, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label714
	movq $1, %rax
	jmp label715
label714:
	movq $0, %rax
label715:
	movq %rax, %rdi
	call assertion
	leaq str3(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $81, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label716
	movq $1, %rax
	jmp label717
label716:
	movq $0, %rax
label717:
	movq %rax, %rdi
	call assertion
	leaq str1(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $66, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label718
	movq $1, %rax
	jmp label719
label718:
	movq $0, %rax
label719:
	movq %rax, %rdi
	call assertion
	leaq str2(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $82, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label720
	movq $1, %rax
	jmp label721
label720:
	movq $0, %rax
label721:
	movq %rax, %rdi
	call assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $101, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label722
	movq $1, %rax
	jmp label723
label722:
	movq $0, %rax
label723:
	movq %rax, %rdi
	call assertion
	leaq str5(%rip), %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $49, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label724
	movq $1, %rax
	jmp label725
label724:
	movq $0, %rax
label725:
	movq %rax, %rdi
	call assertion
label711:
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
	.asciz "KNIGHT"
str1:
	.asciz "BISHOP"
str2:
	.asciz "ROOK"
str3:
	.asciz "QUEEN"
str4:
	.asciz "KING"
str5:
	.asciz "NOTHING"
