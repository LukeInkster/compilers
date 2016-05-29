
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label979
label977:
	movq $123, %rbx
	movq %rbx, 16(%rbp)
	jmp label975
	jmp label978
label979:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label981
label978:
	movq $234, %rbx
	movq %rbx, 16(%rbp)
	jmp label975
	jmp label980
label981:
label980:
	movq $456, %rbx
	movq %rbx, 16(%rbp)
	jmp label975
label983:
label976:
label975:
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
	jnz label986
	movq $1, %rax
	jmp label987
label986:
	movq $0, %rax
label987:
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
	jnz label988
	movq $1, %rax
	jmp label989
label988:
	movq $0, %rax
label989:
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
	jnz label990
	movq $1, %rax
	jmp label991
label990:
	movq $0, %rax
label991:
	movq %rax, %rdi
	call assertion
label985:
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
