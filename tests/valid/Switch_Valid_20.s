
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $0, %rbx
	cmpq %rax, %rbx
	jnz label797
label795:
	jmp label796
label797:
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label799
label796:
	jmp label798
label799:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label801
label798:
	movq 24(%rbp), %rbx
	movq $0, %rcx
	cmpq %rbx, %rcx
	jnz label802
	jmp label794
	jmp label802
label802:
	jmp label800
label801:
label800:
	movq 24(%rbp), %rbx
	movq $1, %rcx
	addq %rcx, %rbx
	movq %rbx, 24(%rbp)
label804:
label794:
	movq 24(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label793
label793:
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
	movq $0, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label807
	movq $1, %rax
	jmp label808
label807:
	movq $0, %rax
label808:
	movq %rax, %rdi
	call assertion
	movq $2, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label809
	movq $1, %rax
	jmp label810
label809:
	movq $0, %rax
label810:
	movq %rax, %rdi
	call assertion
	movq $3, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $2, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label811
	movq $1, %rax
	jmp label812
label811:
	movq $0, %rax
label812:
	movq %rax, %rdi
	call assertion
label806:
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
