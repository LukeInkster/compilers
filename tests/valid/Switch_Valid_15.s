
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label530
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label528
label530:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label531
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label528
label531:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label532
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label528
label532:
label529:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label528
label528:
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
	jnz label534
	movq $1, %rax
	jmp label535
label534:
	movq $0, %rax
label535:
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
	jnz label536
	movq $1, %rax
	jmp label537
label536:
	movq $0, %rax
label537:
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
	jnz label538
	movq $1, %rax
	jmp label539
label538:
	movq $0, %rax
label539:
	movq %rax, %rdi
	call assertion
label533:
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
