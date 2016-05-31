
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label984
label982:
	movq $123, %rcx
	movq %rcx, 16(%rbp)
	jmp label980
	jmp label983
label984:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label986
label983:
	movq $234, %rcx
	movq %rcx, 16(%rbp)
	jmp label980
	jmp label985
label986:
label985:
	movq $456, %rcx
	movq %rcx, 16(%rbp)
	jmp label980
label988:
label981:
label980:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $123, %rax
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
	jnz label991
	movq $1, %rax
	jmp label992
label991:
	movq $0, %rax
label992:
	movq %rax, %rdi
	call assertion
	movq $234, %rax
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
	jnz label993
	movq $1, %rax
	jmp label994
label993:
	movq $0, %rax
label994:
	movq %rax, %rdi
	call assertion
	movq $456, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $3, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label995
	movq $1, %rax
	jmp label996
label995:
	movq $0, %rax
label996:
	movq %rax, %rdi
	call assertion
label990:
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
