
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	leaq str0(%rip), %rbx
	cmpq %rax, %rbx
	jnz label591
	movq $0, %rbx
	movq %rbx, 16(%rbp)
	jmp label589
label591:
	leaq str1(%rip), %rbx
	cmpq %rax, %rbx
	jnz label592
	movq $1, %rbx
	movq %rbx, 16(%rbp)
	jmp label589
label592:
	leaq str2(%rip), %rbx
	cmpq %rax, %rbx
	jnz label593
	movq $2, %rbx
	movq %rbx, 16(%rbp)
	jmp label589
label593:
label590:
	movq $3, %rax
	movq %rax, 16(%rbp)
	jmp label589
label589:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $3, %rax
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
	jnz label595
	movq $1, %rax
	jmp label596
label595:
	movq $0, %rax
label596:
	movq %rax, %rdi
	call assertion
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
	jnz label597
	movq $1, %rax
	jmp label598
label597:
	movq $0, %rax
label598:
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
	jnz label599
	movq $1, %rax
	jmp label600
label599:
	movq $0, %rax
label600:
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
	jnz label601
	movq $1, %rax
	jmp label602
label601:
	movq $0, %rax
label602:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	leaq str4(%rip), %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label603
	movq $1, %rax
	jmp label604
label603:
	movq $0, %rax
label604:
	movq %rax, %rdi
	call assertion
label594:
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
	.asciz "ZERO"
str1:
	.asciz "ONE"
str2:
	.asciz "TWO"
str3:
	.asciz "SOMETHING"
str4:
	.asciz "THREE"
