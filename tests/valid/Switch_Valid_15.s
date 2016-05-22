
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $114, %rbx
	cmpq %rax, %rbx
	jnz label639
label637:
	leaq str0(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label635
	jmp label638
label639:
	movq $98, %rbx
	cmpq %rax, %rbx
	jnz label641
label638:
	leaq str1(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label635
	jmp label640
label641:
	movq $103, %rbx
	cmpq %rax, %rbx
	jnz label643
label640:
	leaq str2(%rip), %rbx
	movq %rbx, 16(%rbp)
	jmp label635
label643:
label636:
	leaq str3(%rip), %rax
	movq %rax, 16(%rbp)
	jmp label635
label635:
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
	jnz label646
	movq $1, %rax
	jmp label647
label646:
	movq $0, %rax
label647:
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
	jnz label648
	movq $1, %rax
	jmp label649
label648:
	movq $0, %rax
label649:
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
	jnz label650
	movq $1, %rax
	jmp label651
label650:
	movq $0, %rax
label651:
	movq %rax, %rdi
	call assertion
label645:
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
