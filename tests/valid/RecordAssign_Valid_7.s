
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	movq 16(%rbp), %rax
	movq $3, %rbx
	movq %rbx, 8(%rax)
label946:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
label947:
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
