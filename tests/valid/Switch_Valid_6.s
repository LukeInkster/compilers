
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 24(%rbp), %rax
	movq $1, %rbx
	cmpq %rax, %rbx
	jnz label929
label927:
	movq $-1, %rbx
	movq %rbx, -8(%rbp)
	jmp label926
	jmp label928
label929:
	movq $2, %rbx
	cmpq %rax, %rbx
	jnz label931
label928:
	movq $-2, %rbx
	movq %rbx, -8(%rbp)
	jmp label926
	jmp label930
label931:
label930:
	movq $0, %rbx
	movq %rbx, -8(%rbp)
label933:
label926:
	movq -8(%rbp), %rax
	movq %rax, 16(%rbp)
	jmp label925
label925:
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
	jnz label936
	movq $1, %rax
	jmp label937
label936:
	movq $0, %rax
label937:
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
	jnz label938
	movq $1, %rax
	jmp label939
label938:
	movq $0, %rax
label939:
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
	jnz label940
	movq $1, %rax
	jmp label941
label940:
	movq $0, %rax
label941:
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
	jnz label942
	movq $1, %rax
	jmp label943
label942:
	movq $0, %rax
label943:
	movq %rax, %rdi
	call assertion
label935:
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
