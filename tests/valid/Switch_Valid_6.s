
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label934
label932:
	movq $-1, %rcx
	movq %rcx, -8(%rbp)
	jmp label931
	jmp label933
label934:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label936
label933:
	movq $-2, %rcx
	movq %rcx, -8(%rbp)
	jmp label931
	jmp label935
label936:
label935:
	movq $0, %rcx
	movq %rcx, -8(%rbp)
label938:
label931:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label930
label930:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	movq $-1, %rax
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
	jnz label941
	movq $1, %rax
	jmp label942
label941:
	movq $0, %rax
label942:
	movq %rax, %rdi
	call assertion
	movq $-2, %rax
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
	jnz label943
	movq $1, %rax
	jmp label944
label943:
	movq $0, %rax
label944:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
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
	jnz label945
	movq $1, %rax
	jmp label946
label945:
	movq $0, %rax
label946:
	movq %rax, %rdi
	call assertion
	movq $0, %rax
	subq $16, %rsp
	movq %rax, 0(%rsp)
	subq $16, %rsp
	movq $-1, %rbx
	movq %rbx, 8(%rsp)
	call wl_f
	addq $16, %rsp
	movq 0(%rsp), %rax
	addq $16, %rsp
	movq -32(%rsp), %rbx
	cmpq %rax, %rbx
	jnz label947
	movq $1, %rax
	jmp label948
label947:
	movq $0, %rax
label948:
	movq %rax, %rdi
	call assertion
label940:
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
