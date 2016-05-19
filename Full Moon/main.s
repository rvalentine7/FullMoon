	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L5
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L1
	ldr	r3, .L5+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L4
.L1:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L4:
	ldr	ip, .L5+8
	mov	r3, r4
	mov	r0, #3
	ldr	r1, .L5+12
	mov	r2, #100663296
	ldr	r5, .L5+16
	str	r4, [ip, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L5+20
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	b	.L1
.L6:
	.align	2
.L5:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	menuTiles
	.word	DMANow
	.word	menuMap
	.size	instructions, .-instructions
	.global	__aeabi_dcmpeq
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_dadd
	.align	2
	.global	animateWolf
	.type	animateWolf, %function
animateWolf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L30
	ldr	r3, [r4, #44]
	cmp	r3, #1
	strne	r3, [r4, #48]
	ldr	r2, .L30+4
	ldr	r3, [r4, #40]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	mov	r0, #1
	subs	r3, r3, r2, asl #2
	ldr	r1, .L30
	str	r0, [r4, #44]
	bne	.L9
	ldr	r2, [r1, #52]
	cmp	r2, #2
	addne	r2, r2, #1
	str	r3, [r1, #40]
	streq	r3, [r1, #52]
	strne	r2, [r1, #52]
.L9:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L11
	mov	r2, #0
	mov	r3, #0
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	ldr	ip, .L30+8
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r3, .L30
	movne	r2, #0
	strne	r2, [r3, #44]
.L11:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L13
	mov	r2, #0
	mov	r3, #0
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	ldr	ip, .L30+8
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldrne	r3, .L30
	movne	r2, #0
	strne	r2, [r3, #44]
.L13:
	ldr	r3, .L30+12
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L15
	ldr	r2, .L30+16
	ldr	r2, [r2, #0]
	tst	r2, #1
	moveq	r2, #2
	streq	r2, [r4, #44]
.L15:
	tst	r3, #2
	beq	.L27
	ldr	r3, .L30+16
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L27
	ldr	r3, .L30+20
	ldr	r3, [r3, #0]
	ldr	r5, .L30+24
	cmp	r3, #0
	mov	r3, #1
	str	r3, [r5, #0]
	mov	r3, #3
	ldr	r7, .L30
	str	r3, [r4, #44]
	beq	.L28
	ldmia	r7, {r2-r3}
	ldr	r6, .L30+28
	ldr	r0, [r7, #32]
	stmia	r6, {r2-r3}
	ldr	r3, .L30+32
	mov	lr, pc
	bx	r3
	ldr	ip, .L30+36
	mov	r2, r0
	mov	r3, r1
	add	r1, r7, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	str	r0, [r6, #8]
	str	r1, [r6, #12]
.L20:
	mov	r3, #1
	add	r3, r3, #1
	cmp	r3, #20
	mov	r2, #3
	str	r3, [r5, #0]
	beq	.L29
.L21:
	cmp	r2, #1
	ldreq	r3, [r4, #48]
	ldrne	r3, [r4, #40]
	streq	r3, [r4, #44]
	addne	r3, r3, #1
	moveq	r3, #0
	streq	r3, [r4, #52]
	strne	r3, [r4, #40]
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L27:
	ldr	r5, .L30+24
	ldr	r3, [r5, #0]
	cmp	r3, #0
	ldr	r2, [r4, #44]
	ble	.L21
	add	r3, r3, #1
	cmp	r3, #20
	str	r3, [r5, #0]
	bne	.L21
.L29:
	ldr	r3, .L30+28
	mov	r0, #0
	mov	r1, #0
	stmia	r3, {r0-r1}
	mov	r1, #1073741824
	add	r1, r1, #2359296
	mov	r0, #0
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	ldr	r3, .L30+24
	mov	r1, #0
	str	r1, [r3, #0]
	b	.L21
.L28:
	ldmia	r7, {r2-r3}
	ldr	r6, .L30+28
	ldr	r0, [r7, #32]
	stmia	r6, {r2-r3}
	ldr	r3, .L30+32
	mov	lr, pc
	bx	r3
	ldr	ip, .L30+40
	mov	r2, r0
	mov	r3, r1
	add	r1, r7, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	str	r0, [r6, #8]
	str	r1, [r6, #12]
	b	.L20
.L31:
	.align	2
.L30:
	.word	wolf
	.word	1717986919
	.word	__aeabi_dcmpeq
	.word	oldButtons
	.word	buttons
	.word	direction
	.word	.LANCHOR0
	.word	slashAttack
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	__aeabi_dsub
	.size	animateWolf, .-animateWolf
	.align	2
	.global	animateKnight
	.type	animateKnight, %function
animateKnight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L38
	mov	r1, r0, asl #1
	add	r3, r1, r0
	add	r3, r2, r3, asl #5
	stmfd	sp!, {r4, r5, r6}
	ldr	ip, [r3, #44]
	cmp	ip, #0
	strne	ip, [r3, #48]
	add	ip, r1, r0
	add	ip, r2, ip, asl #5
	ldr	r3, [ip, #40]
	ldr	r4, .L38+4
	smull	r5, r4, r3, r4
	mov	r5, r3, asr #31
	rsb	r4, r5, r4, asr #3
	add	r4, r4, r4, asl #2
	add	r5, ip, #40
	mov	r6, #0
	subs	r3, r3, r4, asl #2
	str	r6, [r5, #4]
	bne	.L34
	add	r4, ip, #48
	ldr	r5, [r4, #4]
	cmp	r5, #2
	addne	r5, r5, #1
	str	r3, [ip, #40]
	streq	r3, [r4, #4]
	strne	r5, [r4, #4]
.L34:
	add	r3, r1, r0
	add	r3, r2, r3, asl #5
	ldr	ip, [r3, #88]
	add	r0, r1, r0
	cmp	ip, #0
	add	r2, r2, r0, asl #5
	movne	ip, #1
	moveq	ip, #2
	strne	ip, [r3, #44]
	streq	ip, [r3, #44]
	ldr	r3, [r2, #40]
	add	r3, r3, #1
	str	r3, [r2, #40]
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L39:
	.align	2
.L38:
	.word	Knight
	.word	1717986919
	.size	animateKnight, .-animateKnight
	.align	2
	.global	knight
	.type	knight, %function
knight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r7, r0, asl #1
	ldr	r6, .L95
	add	r5, r7, r0
	add	r5, r6, r5, asl #5
	ldr	sl, .L95+4
	sub	sp, sp, #12
	ldr	r8, .L95+8
	mov	r4, r0
	ldr	r0, [r5, #16]
	mov	lr, pc
	bx	r8
	ldr	r9, .L95+12
	add	r3, sl, #8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r9
	add	fp, r5, #16
	stmia	r5, {r0-r1}
	ldr	r0, [fp, #4]
	mov	lr, pc
	bx	r8
	add	r3, sl, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r9
	ldr	r3, .L95+16
	ldr	r3, [r3, #0]
	cmp	r3, #2
	str	r0, [r5, #8]
	str	r1, [r5, #12]
	beq	.L89
	ldr	r3, [r5, #80]
	cmp	r3, #0
	ble	.L90
.L80:
	add	r3, r3, #1
	add	r7, r7, r4
	add	r6, r6, r7, asl #5
	cmp	r3, #5
	str	r3, [r6, #80]
	moveq	r3, #0
	streq	r3, [r6, #80]
.L79:
	mov	r0, r4
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	animateKnight
.L89:
	ldr	r3, [r5, #80]
	cmp	r3, #0
	bgt	.L80
	ldr	r2, [r5, #64]
	cmp	r2, #0
	bne	.L79
	ldr	r1, [r5, #32]
	ldr	r8, .L95+20
	ldr	r2, [fp, #4]
	ldr	r0, [r8, #20]
	sub	ip, r1, r1, asl #2
	add	ip, ip, r2
	add	r3, r3, #1
	cmp	ip, r0
	str	r3, [r5, #80]
	add	r3, r5, #32
	bge	.L44
	cmp	r2, r0
	ble	.L44
	ldr	sl, [r3, #4]
	ldr	ip, [r5, #16]
	ldr	r3, [r8, #16]
	rsb	r9, sl, ip
	cmp	r9, r3
	bge	.L46
	add	r9, r3, #1
	cmp	ip, r9
	bgt	.L46
	add	sl, sl, ip
	cmp	r3, sl
	bge	.L46
	mov	r3, #1
	str	r3, [r5, #60]
	str	r3, [r5, #88]
.L49:
	ldr	r3, .L95
	add	r0, r7, r4
	mov	r6, r3
	mov	r1, r3
	mov	r2, #0
	add	r0, r3, r0, asl #5
	mov	r8, #1
	mov	r5, #2
.L47:
	cmp	r4, r2
	add	r2, r2, #1
	beq	.L52
	ldr	r9, [r0, #20]
	ldr	ip, [r0, #32]
	ldr	sl, [r1, #20]
	add	ip, r9, ip
	cmp	ip, sl
	add	ip, r0, #32
	ble	.L52
	cmp	r9, sl
	bge	.L52
	ldr	sl, [r1, #56]
	cmp	sl, #0
	beq	.L52
	ldr	sl, [r0, #56]
	cmp	sl, #0
	add	sl, r0, #56
	str	sl, [sp, #4]
	beq	.L52
	ldr	fp, [r1, #16]
	ldr	sl, [r0, #16]
	add	r9, fp, #2
	cmp	r9, sl
	blt	.L52
	ldr	ip, [ip, #4]
	add	ip, sl, ip
	cmp	fp, ip
	ldrlt	ip, [sp, #4]
	strlt	r8, [ip, #4]
	strlt	r5, [r1, #60]
.L52:
	cmp	r2, #5
	add	r1, r1, #96
	bne	.L47
	add	r5, r7, r4
	mov	r2, #0
	add	r5, r6, r5, asl #5
	mov	sl, #2
	mov	r8, #1
.L54:
	cmp	r4, r2
	add	r2, r2, #1
	beq	.L53
	ldr	r1, [r3, #20]
	ldr	ip, [r3, #32]
	ldr	r0, [r5, #20]
	add	ip, r1, ip
	cmp	r0, ip
	bge	.L53
	cmp	r0, r1
	ble	.L53
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L53
	ldr	r1, [r5, #56]
	cmp	r1, #0
	add	ip, r5, #56
	beq	.L53
	ldr	r1, [r3, #16]
	ldr	r0, [r5, #16]
	add	r9, r1, #2
	cmp	r9, r0
	blt	.L53
	ldr	r9, [r5, #36]
	add	r0, r0, r9
	cmp	r1, r0
	strlt	sl, [ip, #4]
	strlt	r8, [r3, #60]
.L53:
	cmp	r2, #5
	add	r3, r3, #96
	bne	.L54
	add	r2, r7, r4
	add	r2, r6, r2, asl #5
	ldr	r3, [r2, #60]
	cmp	r3, #1
	beq	.L91
	cmp	r3, #2
	bne	.L59
	ldr	r1, .L95+24
	ldr	r5, [r2, #16]
	ldr	r0, [r1, #0]
	mla	r9, r5, r0, r0
	add	r8, r2, #16
	ldr	ip, [r2, #32]
	ldr	sl, [r8, #4]
	add	ip, sl, ip
	ldr	r3, .L95+28
	add	r9, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	add	r2, r2, #32
	beq	.L77
	ldr	r2, [r2, #4]
	add	r9, r5, r2
	sub	r9, r9, #1
	mla	r9, r0, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	beq	.L77
	add	r2, r2, r2, lsr #31
	add	r2, r5, r2, asr #1
	mla	r2, r0, r2, ip
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L77
	add	sl, sl, #1
	str	sl, [r8, #4]
.L58:
	add	ip, r7, r4
	add	ip, r6, ip, asl #5
	ldr	r2, [ip, #60]
	cmp	r2, #1
	bne	.L78
	ldr	r5, [ip, #36]
	ldr	r2, [ip, #16]
	ldr	r0, [r1, #0]
	ldr	ip, [ip, #20]
	add	r2, r5, r2
.L57:
	mla	r2, r0, r2, r0
	add	r2, r2, ip
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L59
.L86:
	add	r3, r7, r4
	add	r3, r6, r3, asl #5
	mov	r2, #2
	str	r2, [r3, #60]
.L59:
	add	r3, r7, r4
	add	r3, r6, r3, asl #5
	ldr	r3, [r3, #80]
	cmp	r3, #0
	ble	.L79
	b	.L80
.L90:
	ldr	r2, [r5, #64]
	cmp	r2, #0
	bne	.L79
	ldr	r1, [r5, #32]
	ldr	r8, .L95+20
	ldr	r2, [fp, #4]
	ldr	r0, [r8, #20]
	sub	ip, r1, r1, asl #2
	add	ip, ip, r2
	add	r3, r3, #1
	cmp	ip, r0
	str	r3, [r5, #80]
	add	r3, r5, #32
	bge	.L62
	cmp	r2, r0
	ble	.L62
	ldr	sl, [r3, #4]
	ldr	ip, [r5, #16]
	ldr	r3, [r8, #16]
	rsb	r9, sl, ip
	cmp	r9, r3
	bge	.L64
	add	r9, r3, #1
	cmp	ip, r9
	bgt	.L64
	add	sl, sl, ip
	cmp	r3, sl
	bge	.L64
	mov	r3, #1
	str	r3, [r5, #60]
	str	r3, [r5, #88]
	b	.L67
.L62:
	ldr	ip, [r5, #16]
.L64:
	add	r3, r1, r1, asl #1
	add	r3, r3, r2
	cmp	r0, r3
	bge	.L66
	cmp	r2, r0
	bge	.L66
	add	r5, r7, r4
	add	r5, r6, r5, asl #5
	ldr	r0, [r5, #36]
	ldr	r3, [r8, #16]
	rsb	r8, r0, ip
	cmp	r8, r3
	bge	.L66
	add	r8, r3, #1
	cmp	r8, ip
	blt	.L66
	add	r0, ip, r0
	cmp	r3, r0
	bge	.L66
	mov	r3, #2
	str	r3, [r5, #60]
	mov	r3, #1
	str	r3, [r5, #88]
	b	.L67
.L66:
	ldr	r3, .L95+24
	ldr	r0, [r3, #0]
	mla	r5, ip, r0, r0
	ldr	r3, .L95+32
	add	r8, r5, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	bne	.L68
	add	sl, r7, r4
	add	sl, r6, sl, asl #5
	ldr	r8, [sl, #36]
	sub	r9, r8, #1
	add	r9, r9, ip
	mla	r9, r0, r9, r2
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	bne	.L68
	add	r8, r8, r8, lsr #31
	add	r8, ip, r8, asr #1
	mla	r8, r0, r8, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	moveq	r3, #2
	streq	r3, [sl, #60]
	streq	r8, [sl, #88]
	beq	.L67
.L68:
	add	r2, r1, r2
	add	r5, r5, r2
	mov	r5, r5, asl #1
	ldrh	r3, [r3, r5]
	cmp	r3, #0
	ldr	r3, .L95+32
	beq	.L92
.L69:
	add	r3, r7, r4
	add	r6, r6, r3, asl #5
	mov	r3, #0
	str	r3, [r6, #88]
.L67:
	ldr	r3, .L95
	add	r0, r7, r4
	mov	r6, r3
	mov	r1, r3
	mov	r2, #0
	add	r0, r3, r0, asl #5
	mov	r8, #1
	mov	r5, #2
.L65:
	cmp	r4, r2
	add	r2, r2, #1
	beq	.L70
	ldr	r9, [r0, #20]
	ldr	ip, [r0, #32]
	ldr	sl, [r1, #20]
	add	ip, r9, ip
	cmp	ip, sl
	add	ip, r0, #32
	ble	.L70
	cmp	r9, sl
	bge	.L70
	ldr	sl, [r1, #56]
	cmp	sl, #0
	bne	.L93
.L70:
	cmp	r2, #5
	add	r1, r1, #96
	bne	.L65
	add	r5, r7, r4
	mov	r2, #0
	add	r5, r6, r5, asl #5
	mov	sl, #2
	mov	r8, #1
.L72:
	cmp	r4, r2
	add	r2, r2, #1
	beq	.L71
	ldr	r1, [r3, #20]
	ldr	ip, [r3, #32]
	ldr	r0, [r5, #20]
	add	ip, r1, ip
	cmp	r0, ip
	bge	.L71
	cmp	r0, r1
	ble	.L71
	ldr	r1, [r3, #56]
	cmp	r1, #0
	beq	.L71
	ldr	r1, [r5, #56]
	cmp	r1, #0
	add	ip, r5, #56
	beq	.L71
	ldr	r1, [r3, #16]
	ldr	r0, [r5, #16]
	add	r9, r1, #2
	cmp	r9, r0
	blt	.L71
	ldr	r9, [r5, #36]
	add	r0, r0, r9
	cmp	r1, r0
	strlt	sl, [ip, #4]
	strlt	r8, [r3, #60]
.L71:
	cmp	r2, #5
	add	r3, r3, #96
	bne	.L72
	add	r2, r7, r4
	add	r2, r6, r2, asl #5
	ldr	r3, [r2, #60]
	cmp	r3, #1
	beq	.L94
	cmp	r3, #2
	bne	.L59
	ldr	r1, .L95+24
	ldr	r5, [r2, #16]
	ldr	r0, [r1, #0]
	mla	r9, r5, r0, r0
	add	r8, r2, #16
	ldr	ip, [r2, #32]
	ldr	sl, [r8, #4]
	add	ip, sl, ip
	ldr	r3, .L95+32
	add	r9, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	add	r2, r2, #32
	beq	.L77
	ldr	r2, [r2, #4]
	add	r9, r5, r2
	sub	r9, r9, #1
	mla	r9, r0, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	beq	.L77
	add	r2, r2, r2, lsr #31
	add	r2, r5, r2, asr #1
	mla	r2, r0, r2, ip
	mov	r2, r2, asl #1
	ldrh	r2, [r3, r2]
	cmp	r2, #0
	beq	.L77
	add	sl, sl, #1
	str	sl, [r8, #4]
.L76:
	add	ip, r7, r4
	add	ip, r6, ip, asl #5
	ldr	r2, [ip, #60]
	cmp	r2, #1
	bne	.L78
	ldr	r5, [ip, #36]
	ldr	r2, [ip, #16]
	ldr	r0, [r1, #0]
	ldr	ip, [ip, #20]
	add	r2, r5, r2
.L75:
	mla	r0, r2, r0, r0
	add	ip, r0, ip
	mov	ip, ip, asl #1
	ldrh	r3, [r3, ip]
	cmp	r3, #0
	beq	.L59
	b	.L86
.L93:
	ldr	sl, [r0, #56]
	cmp	sl, #0
	add	sl, r0, #56
	str	sl, [sp, #4]
	beq	.L70
	ldr	fp, [r1, #16]
	ldr	sl, [r0, #16]
	add	r9, fp, #2
	cmp	r9, sl
	blt	.L70
	ldr	ip, [ip, #4]
	add	ip, sl, ip
	cmp	fp, ip
	ldrlt	ip, [sp, #4]
	strlt	r8, [ip, #4]
	strlt	r5, [r1, #60]
	b	.L70
.L92:
	add	r5, r7, r4
	add	r5, r6, r5, asl #5
	ldr	r1, [r5, #36]
	sub	r8, r1, #1
	add	r8, r8, ip
	mla	r8, r0, r8, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	bne	.L69
	add	r1, r1, r1, lsr #31
	add	ip, ip, r1, asr #1
	mla	r2, r0, ip, r2
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	moveq	r2, #1
	streq	r2, [r5, #60]
	streq	r3, [r5, #88]
	beq	.L67
	b	.L69
.L44:
	ldr	ip, [r5, #16]
.L46:
	add	r3, r1, r1, asl #1
	add	r3, r3, r2
	cmp	r0, r3
	bge	.L48
	cmp	r2, r0
	bge	.L48
	add	r0, r7, r4
	add	r0, r6, r0, asl #5
	ldr	r5, [r0, #36]
	ldr	r3, [r8, #16]
	rsb	r8, r5, ip
	cmp	r8, r3
	bge	.L48
	add	r8, r3, #1
	cmp	r8, ip
	blt	.L48
	add	r5, ip, r5
	cmp	r3, r5
	bge	.L48
	mov	r3, #2
	str	r3, [r0, #60]
	mov	r3, #1
	str	r3, [r0, #88]
	b	.L49
.L48:
	ldr	r3, .L95+24
	ldr	r0, [r3, #0]
	mla	r5, ip, r0, r0
	ldr	r3, .L95+28
	add	r8, r5, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	bne	.L50
	add	sl, r7, r4
	add	sl, r6, sl, asl #5
	ldr	r8, [sl, #36]
	sub	r9, r8, #1
	add	r9, r9, ip
	mla	r9, r0, r9, r2
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	bne	.L50
	add	r8, r8, r8, lsr #31
	add	r8, ip, r8, asr #1
	mla	r8, r0, r8, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	moveq	r3, #2
	streq	r3, [sl, #60]
	streq	r8, [sl, #88]
	beq	.L49
.L50:
	add	r2, r1, r2
	add	r5, r5, r2
	mov	r5, r5, asl #1
	ldrh	r3, [r3, r5]
	cmp	r3, #0
	ldr	r3, .L95+28
	bne	.L51
	add	r5, r7, r4
	add	r5, r6, r5, asl #5
	ldr	r1, [r5, #36]
	sub	r8, r1, #1
	add	r8, r8, ip
	mla	r8, r0, r8, r2
	mov	r8, r8, asl #1
	ldrh	r8, [r3, r8]
	cmp	r8, #0
	bne	.L51
	add	r1, r1, r1, lsr #31
	add	ip, ip, r1, asr #1
	mla	r2, r0, ip, r2
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	moveq	r2, #1
	streq	r2, [r5, #60]
	streq	r3, [r5, #88]
	beq	.L49
.L51:
	add	r3, r7, r4
	add	r6, r6, r3, asl #5
	mov	r3, #0
	str	r3, [r6, #88]
	b	.L49
.L78:
	cmp	r2, #2
	bne	.L59
.L77:
	add	r2, r7, r4
	add	r2, r6, r2, asl #5
	ldr	ip, [r2, #16]
	ldr	r0, [r2, #36]
	ldr	r1, [r1, #0]
	add	r0, ip, r0
	mla	r1, r0, r1, r1
	ldr	ip, [r2, #32]
	ldr	r0, [r2, #20]
	add	r0, ip, r0
	add	r1, r0, r1
	mov	r1, r1, asl #1
	ldrh	r3, [r3, r1]
	cmp	r3, #0
	movne	r3, #1
	strne	r3, [r2, #60]
	b	.L59
.L94:
	ldr	r1, .L95+24
	ldr	r5, [r2, #16]
	ldr	r0, [r1, #0]
	mla	sl, r5, r0, r0
	add	r8, r2, #16
	ldr	ip, [r8, #4]
	ldr	r3, .L95+32
	add	sl, sl, ip
	mov	sl, sl, asl #1
	ldrh	sl, [r3, sl]
	cmp	sl, #0
	ldreq	r2, [r2, #36]
	addeq	r2, r5, r2
	beq	.L75
.L74:
	ldr	sl, [r2, #36]
	add	r2, sl, r5
	sub	r9, r2, #1
	mla	r9, r0, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	beq	.L75
	add	sl, sl, sl, lsr #31
	add	r5, r5, sl, asr #1
	mla	r5, r0, r5, ip
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	subne	ip, ip, #1
	strne	ip, [r8, #4]
	bne	.L76
	b	.L75
.L91:
	ldr	r1, .L95+24
	ldr	r5, [r2, #16]
	ldr	r0, [r1, #0]
	mla	sl, r5, r0, r0
	add	r8, r2, #16
	ldr	ip, [r8, #4]
	ldr	r3, .L95+28
	add	sl, sl, ip
	mov	sl, sl, asl #1
	ldrh	sl, [r3, sl]
	cmp	sl, #0
	ldreq	r2, [r2, #36]
	addeq	r2, r5, r2
	beq	.L57
.L56:
	ldr	sl, [r2, #36]
	add	r2, sl, r5
	sub	r9, r2, #1
	mla	r9, r0, r9, ip
	mov	r9, r9, asl #1
	ldrh	r9, [r3, r9]
	cmp	r9, #0
	beq	.L57
	add	sl, sl, sl, lsr #31
	add	r5, r5, sl, asr #1
	mla	r5, r0, r5, ip
	mov	r5, r5, asl #1
	ldrh	r5, [r3, r5]
	cmp	r5, #0
	subne	ip, ip, #1
	strne	ip, [r8, #4]
	bne	.L58
	b	.L57
.L96:
	.align	2
.L95:
	.word	Knight
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_dsub
	.word	state
	.word	wolf
	.word	.LANCHOR1
	.word	collisionMap1Bitmap
	.word	collisionMap2Bitmap
	.size	knight, .-knight
	.align	2
	.global	doorPlacement
	.type	doorPlacement, %function
doorPlacement:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L103
	ldr	r5, .L103+4
	ldr	r7, .L103+8
	ldr	r0, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r6, .L103+12
	add	r3, r5, #8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	stmia	r4, {r0-r1}
	ldr	r0, [r4, #20]
	mov	lr, pc
	bx	r7
	add	r3, r5, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, #24]
	cmp	r3, #0
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	bne	.L98
	ldr	r3, [r4, #40]
	ldr	r2, .L103+16
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #2
	beq	.L102
.L99:
	mov	r3, #1
	str	r3, [r5, #24]
.L97:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L98:
	add	r3, r3, #1
	cmp	r3, #17
	str	r3, [r5, #24]
	moveq	r3, #0
	streq	r3, [r5, #24]
	b	.L97
.L102:
	ldr	r2, [r4, #52]
	cmp	r2, #3
	addne	r2, r2, #1
	str	r3, [r4, #40]
	streq	r3, [r4, #52]
	strne	r2, [r4, #52]
	b	.L99
.L104:
	.align	2
.L103:
	.word	door
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_dsub
	.word	1717986919
	.size	doorPlacement, .-doorPlacement
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L108
	mov	r3, #0
.L106:
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L106
	bx	lr
.L109:
	.align	2
.L108:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl, fp}
	ldr	r5, .L115
	mov	r3, #0
	str	r3, [r5, #0]
	ldr	r5, .L115+4
	ldr	r1, .L115+8
	mov	r6, #2
	mov	fp, #1073741824
	mov	sl, #0
	add	fp, fp, #5767168
	str	r6, [r5, #0]
	ldr	r5, .L115+12
	ldr	r2, .L115+16
	str	sl, [r1, #8]
	str	fp, [r1, #12]
	mov	r4, #1
	ldr	r0, .L115+20
	mov	fp, #1073741824
	mov	r7, #0
	mov	r8, #0
	mov	ip, #16
	mov	sl, #0
	add	fp, fp, #6291456
	str	r4, [r5, #0]
	mov	r5, #14
	str	r7, [r1, #16]
	str	r8, [r1, #20]
	str	r7, [r2, #8]
	str	r8, [r2, #12]
	str	r7, [r2, #56]
	str	r8, [r2, #60]
	str	r5, [r2, #32]
	stmia	r2, {sl-fp}
	str	ip, [r2, #36]
	str	r3, [r2, #40]
	str	r3, [r2, #52]
	str	r4, [r2, #44]
	str	r3, [r1, #28]
	str	r3, [r1, #32]
	str	r3, [r1, #36]
	mov	r2, r0
	mov	r1, #200
	mov	r7, #224
	mov	r5, #5
.L111:
	str	r1, [r2, #20]
	add	r1, r1, #60
	cmp	r1, #440
	str	ip, [r2, #32]
	str	ip, [r2, #36]
	str	r7, [r2, #16]
	str	r3, [r2, #40]
	str	r3, [r2, #52]
	str	r4, [r2, #44]
	str	r6, [r2, #56]
	str	r3, [r2, #64]
	str	r4, [r2, #60]
	str	r3, [r2, #80]
	str	r5, [r2, #76]
	str	r3, [r2, #84]
	str	r3, [r2, #88]
	add	r2, r2, #96
	bne	.L111
	ldr	r1, .L115+24
	mov	sl, #0
	mov	fp, #0
	stmia	r1, {sl-fp}
	mov	fp, #1073741824
	mov	sl, #0
	add	fp, fp, #2359296
	str	sl, [r1, #8]
	str	fp, [r1, #12]
	mov	sl, #192
	ldr	r2, .L115+28
	str	sl, [r0, #400]
	mov	sl, #180
	str	ip, [r0, #416]
	str	ip, [r0, #420]
	str	sl, [r0, #404]
	str	r3, [r0, #424]
	str	r3, [r0, #436]
	str	r4, [r0, #428]
	str	r6, [r0, #440]
	str	r3, [r0, #448]
	str	r4, [r0, #444]
	str	r3, [r0, #464]
	str	r5, [r0, #460]
	str	r3, [r0, #468]
	str	r3, [r0, #472]
	mov	r0, #208
	ldr	r7, .L115+32
	mov	r8, #32
	str	r0, [r2, #16]
	mov	r0, #460
	str	r8, [r2, #32]
	str	r8, [r2, #36]
	str	r0, [r2, #20]
	str	r3, [r2, #52]
	mov	r2, #97
	str	r2, [r7, #16]
	str	r4, [r7, #20]
	str	r3, [r7, #52]
	str	ip, [r1, #32]
	str	ip, [r1, #36]
	ldr	r2, .L115+36
.L112:
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L112
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl, fp}
	bx	lr
.L116:
	.align	2
.L115:
	.word	cheat
	.word	prevGameState
	.word	.LANCHOR0
	.word	direction
	.word	wolf
	.word	Knight
	.word	slashAttack
	.word	door
	.word	health
	.word	shadowOAM
	.size	initialize, .-initialize
	.align	2
	.global	initialize2
	.type	initialize2, %function
initialize2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L120
	ldr	r0, .L120+4
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	mov	r5, #0
	mov	r6, #0
	str	r5, [r0, #16]
	str	r6, [r0, #20]
	str	r5, [r3, #8]
	str	r6, [r3, #12]
	str	r5, [r3, #56]
	str	r6, [r3, #60]
	ldr	r5, .L120+8
	mov	r6, #3
	mov	r8, #1073741824
	str	r6, [r5, #0]
	mov	r7, #0
	add	r8, r8, #5767168
	ldr	r5, .L120+12
	str	r7, [r0, #8]
	str	r8, [r0, #12]
	mov	r4, #1
	ldr	r1, .L120+16
	mov	r8, #1073741824
	mov	r2, #0
	mov	r7, #0
	mov	ip, #16
	add	r8, r8, #6291456
	str	r4, [r5, #0]
	mov	r5, #14
	stmia	r3, {r7-r8}
	str	r5, [r3, #32]
	str	ip, [r3, #36]
	str	r2, [r3, #40]
	str	r2, [r3, #52]
	str	r4, [r3, #44]
	str	r2, [r0, #28]
	str	r2, [r0, #32]
	mov	r3, r1
	mov	r0, #200
	mov	r7, #224
	mov	r6, #2
	mov	r5, #5
.L118:
	str	r0, [r3, #20]
	add	r0, r0, #60
	cmp	r0, #380
	str	ip, [r3, #32]
	str	ip, [r3, #36]
	str	r7, [r3, #16]
	str	r2, [r3, #40]
	str	r2, [r3, #52]
	str	r4, [r3, #44]
	str	r6, [r3, #56]
	str	r2, [r3, #64]
	str	r4, [r3, #60]
	str	r2, [r3, #80]
	str	r5, [r3, #76]
	str	r2, [r3, #84]
	str	r2, [r3, #88]
	add	r3, r3, #96
	bne	.L118
	str	r0, [r1, #308]
	mov	r0, #168
	ldr	r3, .L120+20
	str	r0, [r1, #400]
	mov	r9, #192
	mov	r0, #180
	str	r2, [r1, #328]
	str	r2, [r1, #340]
	str	r2, [r1, #352]
	str	r2, [r1, #368]
	str	r2, [r1, #372]
	str	r2, [r1, #376]
	str	r2, [r1, #424]
	str	r2, [r1, #436]
	str	r2, [r1, #448]
	str	r2, [r1, #464]
	str	r2, [r1, #468]
	str	r2, [r1, #472]
	str	ip, [r1, #320]
	str	ip, [r1, #324]
	str	r9, [r1, #304]
	str	r4, [r1, #332]
	str	r6, [r1, #344]
	str	r4, [r1, #348]
	str	r5, [r1, #364]
	str	ip, [r1, #416]
	str	ip, [r1, #420]
	str	r0, [r1, #404]
	str	r4, [r1, #428]
	str	r6, [r1, #440]
	str	r4, [r1, #444]
	str	r5, [r1, #460]
	mov	r1, #208
	str	r1, [r3, #16]
	ldr	r8, .L120+24
	mov	sl, #32
	mov	r1, #460
	ldr	r7, .L120+28
	str	r2, [r3, #52]
	str	sl, [r3, #32]
	str	sl, [r3, #36]
	str	r1, [r3, #20]
	mov	r3, #97
	str	r3, [r8, #16]
	mov	r2, #0
	mov	r3, #0
	stmia	r7, {r2-r3}
	mov	r3, #1073741824
	mov	r2, #0
	add	r3, r3, #2359296
	str	r2, [r7, #8]
	str	r3, [r7, #12]
	str	r4, [r8, #20]
	str	ip, [r7, #32]
	str	ip, [r7, #36]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl}
	bx	lr
.L121:
	.align	2
.L120:
	.word	wolf
	.word	.LANCHOR0
	.word	prevGameState
	.word	direction
	.word	Knight
	.word	door
	.word	health
	.word	slashAttack
	.size	initialize2, .-initialize2
	.global	__aeabi_dcmpgt
	.global	__aeabi_d2iz
	.global	__aeabi_dcmplt
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L189
	ldr	r5, [r4, #44]
	cmp	r5, #2
	beq	.L176
.L123:
	ldr	r6, .L189+4
	ldr	r3, [r6, #0]
	cmp	r3, #2
	beq	.L177
.L136:
	cmp	r5, #3
	beq	.L178
	cmp	r5, #2
	moveq	r5, #1
	streq	r5, [r4, #44]
	streq	r5, [r4, #48]
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	ldrne	r5, [r4, #48]
	mov	lr, pc
	bx	r7
	ldr	r3, .L189+12
	ldr	r3, [r3, #0]
	ldr	r8, .L189+16
	and	r0, r0, #255
	cmp	r3, #0
	strh	r0, [r8, #0]	@ movhi
	ldr	r3, .L189
	beq	.L179
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	ldr	sl, .L189+20
	orr	r3, r3, #16384
	strh	r3, [r8, #2]	@ movhi
	ldr	r3, [sl, #32]
	cmp	r3, #0
	bne	.L160
.L184:
	ldr	r2, [r4, #52]
	ldr	r3, [sl, #36]
	add	r5, r5, r2, asl #5
	mov	r3, r3, asl #12
	orr	r5, r3, r5, asl #1
	strh	r5, [r8, #4]	@ movhi
	ldr	r4, [sl, #0]
.L135:
	cmp	r4, #0
	ldreq	r3, [sl, #36]
	moveq	r3, r3, asl #12
	orreq	r3, r3, #5120
	orreq	r3, r3, #8
	streqh	r3, [r8, #20]	@ movhi
.L161:
	ldr	r4, .L189+24
	mov	r9, #5120
	ldr	r5, .L189+16
	add	sl, r4, #480
	add	r9, r9, #8
.L169:
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #64]
	and	r0, r0, #255
	cmp	r3, #0
	strh	r0, [r5, #32]	@ movhi
	bne	.L162
	ldr	r3, [r4, #88]
	cmp	r3, #1
	beq	.L180
	ldr	r2, [r4, #52]
	mov	r3, r2, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, #138
	orr	r3, r3, #4096
	strh	r3, [r5, #36]	@ movhi
.L164:
	ldr	r3, [r4, #60]
	cmp	r3, #1
	beq	.L181
.L165:
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r5, #34]	@ movhi
	ldr	r3, [r4, #56]
	cmp	r3, #0
	ble	.L182
.L167:
	add	r4, r4, #96
	cmp	r4, sl
	add	r5, r5, #8
	bne	.L169
	ldr	r4, .L189+28
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	ldr	r3, [r6, #0]
	and	r0, r0, #255
	cmp	r3, #2
	ldr	r1, .L189+16
	strh	r0, [r8, #24]	@ movhi
	beq	.L183
	ldr	r3, [r4, #52]
	ldr	r2, .L189+32
	smull	r0, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	rsb	r3, r2, r3
	add	r3, r3, #5
	mov	r3, r3, asl #7
	orr	r3, r3, #24576
	strh	r3, [r1, #28]	@ movhi
.L171:
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	ldr	r4, .L189+36
	mov	r3, r0, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	ldmia	r4, {r0-r1}
	strh	r3, [r8, #26]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #52]
	mov	r3, r3, asl #6
	and	r2, r0, #255
	add	r3, r3, #772
	orr	r3, r3, #12288
	orr	r2, r2, #16384
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #12]	@ movhi
	strh	r2, [r8, #8]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	strh	r3, [r8, #10]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L179:
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	ldr	sl, .L189+20
	orr	r3, r3, #20480
	strh	r3, [r8, #2]	@ movhi
	ldr	r3, [sl, #32]
	cmp	r3, #0
	beq	.L184
.L160:
	ldr	r3, [r4, #52]
	add	r3, r5, r3, asl #5
	mov	r3, r3, asl #1
	orr	r3, r3, #8192
	strh	r3, [r8, #4]	@ movhi
	ldr	r4, [sl, #0]
	b	.L135
.L162:
	ldr	r2, [r4, #52]
	mov	r3, r2, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, #10
	orr	r3, r3, #8192
	strh	r3, [r5, #36]	@ movhi
	ldr	r3, [r4, #60]
	cmp	r3, #1
	bne	.L165
.L181:
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	strh	r3, [r5, #34]	@ movhi
	ldr	r3, [r4, #56]
	cmp	r3, #0
	bgt	.L167
.L182:
	ldr	r3, [r4, #84]
	cmp	r3, #4
	bgt	.L168
	add	r3, r3, #1
	cmp	r3, #5
	str	r3, [r4, #84]
	bne	.L167
.L168:
	strh	r9, [r5, #36]	@ movhi
	b	.L167
.L180:
	ldr	r2, [r4, #52]
	mov	r3, r2, lsr #31
	add	r2, r2, r3
	and	r2, r2, #1
	rsb	r3, r3, r2
	mov	r3, r3, asl #6
	add	r3, r3, #10
	orr	r3, r3, #4096
	strh	r3, [r5, #36]	@ movhi
	b	.L164
.L176:
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L189+40
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L123
	ldr	r3, .L189+12
	ldr	r5, [r3, #0]
	cmp	r5, #1
	beq	.L185
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	ldr	r8, .L189+16
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #-16777216
	ldr	r2, [sl, #32]
	orr	r3, r3, #16711680
	orr	r3, r3, #36864
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	beq	.L174
	mov	r3, #8192
	ldr	r6, [sl, #36]
	add	r3, r3, #4
	mov	r6, r6, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r6, r6, lsr #16
.L127:
	ldr	r4, [sl, #0]
	cmp	r4, #0
	ble	.L129
	ldr	r4, .L189+44
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	cmp	r5, #0
	and	r0, r0, #255
	ldr	r5, .L189+16
	ldr	r3, .L189+8
	strh	r0, [r8, #16]	@ movhi
	bne	.L130
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	strh	r3, [r5, #18]	@ movhi
.L131:
	orr	r6, r6, #8
	strh	r6, [r8, #20]	@ movhi
	ldr	r6, .L189+4
	b	.L161
.L177:
	cmp	r5, #2
	beq	.L186
.L137:
	ldr	r3, .L189+48
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #36]
	ldr	r3, [r3, #0]
	add	r2, r1, r2
	mla	r3, r2, r3, r3
	ldr	r1, [r4, #20]
	ldr	r2, .L189+52
	add	r0, r3, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L136
	ldr	r0, .L189
	ldr	r0, [r0, #32]
	add	r1, r1, r0
	add	r3, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L136
.L138:
	ldr	r3, .L189+12
	ldr	r9, [r3, #0]
	cmp	r9, #1
	beq	.L187
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	ldr	r8, .L189+16
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #-16777216
	ldr	r2, [sl, #32]
	orr	r3, r3, #16711680
	orr	r3, r3, #36864
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	bne	.L142
.L175:
	ldr	r3, .L189+32
	smull	r0, r3, r5, r3
	ldr	r2, [sl, #36]
	sub	r3, r3, r5, asr #31
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r5
	mov	r2, r2, asl #28
	mov	r5, r2, lsr #16
	add	r3, r3, #64
	orr	r3, r5, r3, asl #1
	strh	r3, [r8, #4]	@ movhi
.L141:
	ldr	r4, [sl, #0]
	cmp	r4, #0
	ble	.L143
	ldr	r4, .L189+44
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	cmp	r9, #0
	and	r2, r0, #255
	ldr	sl, .L189+16
	ldr	r3, .L189+8
	strh	r2, [r8, #16]	@ movhi
	bne	.L144
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	strh	r3, [sl, #18]	@ movhi
.L145:
	orr	r5, r5, #8
	strh	r5, [r8, #20]	@ movhi
	b	.L161
.L178:
	ldr	r3, .L189+12
	ldr	r3, [r3, #0]
	cmp	r3, #1
	beq	.L188
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	ldr	r8, .L189+16
	and	r3, r0, #255
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	ldr	r2, [sl, #32]
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	bne	.L153
	ldr	r5, [sl, #36]
	mov	r5, r5, asl #28
	mov	r5, r5, lsr #16
	orr	r3, r5, #6
	strh	r3, [r8, #4]	@ movhi
.L154:
	ldr	r4, [sl, #0]
	cmp	r4, #0
	ble	.L155
	ldr	r4, .L189+44
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #16]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	orr	r5, r5, #8
	strh	r3, [r8, #18]	@ movhi
	strh	r5, [r8, #20]	@ movhi
	b	.L161
.L186:
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L189+56
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L138
	b	.L137
.L188:
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	ldr	r8, .L189+16
	and	r3, r0, #255
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	ldr	r2, [sl, #32]
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	bne	.L150
	ldr	r5, [sl, #36]
	mov	r5, r5, asl #28
	mov	r5, r5, lsr #16
	orr	r3, r5, #6
	strh	r3, [r8, #4]	@ movhi
.L151:
	ldr	r4, [sl, #0]
	cmp	r4, #0
	ble	.L152
	ldr	r4, .L189+44
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #16]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	orr	r5, r5, #8
	strh	r3, [r8, #18]	@ movhi
	strh	r5, [r8, #20]	@ movhi
	b	.L161
.L183:
	ldr	r3, [r4, #52]
	ldr	r2, .L189+32
	smull	r0, r2, r3, r2
	sub	r2, r2, r3, asr #31
	add	r2, r2, r2, asl #1
	rsb	r3, r2, r3
	add	r3, r3, #5
	mov	r3, r3, asl #7
	orr	r3, r3, #16384
	strh	r3, [r1, #28]	@ movhi
	b	.L171
.L153:
	ldr	r5, [sl, #36]
	mov	r3, #8192
	add	r3, r3, #6
	mov	r5, r5, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r5, r5, lsr #16
	b	.L154
.L174:
	ldr	r6, [sl, #36]
	mov	r6, r6, asl #28
	mov	r6, r6, lsr #16
	orr	r3, r6, #4
	strh	r3, [r8, #4]	@ movhi
	b	.L127
.L130:
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r5, #18]	@ movhi
	b	.L131
.L142:
	ldr	r3, .L189+32
	smull	r2, r3, r5, r3
	sub	r3, r3, r5, asr #31
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r5
	add	r3, r3, #64
	ldr	r5, [sl, #36]
	mov	r3, r3, asl #1
	orr	r3, r3, #8192
	mov	r5, r5, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r5, r5, lsr #16
	b	.L141
.L150:
	ldr	r5, [sl, #36]
	mov	r3, #8192
	add	r3, r3, #6
	mov	r5, r5, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r5, r5, lsr #16
	b	.L151
.L155:
	ldr	r9, .L189+44
	ldmia	r9, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	add	r1, r9, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #16]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r2, r0, asl #23
	mov	r2, r2, lsr #23
	orr	r3, r5, #5120
	orr	r2, r2, #20480
	orr	r3, r3, #8
	strh	r2, [r8, #18]	@ movhi
	strh	r3, [r8, #20]	@ movhi
	b	.L135
.L185:
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	ldr	r8, .L189+16
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	ldr	r2, [sl, #32]
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	beq	.L174
	ldr	r6, [sl, #36]
	mov	r3, #8192
	add	r3, r3, #4
	mov	r6, r6, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r6, r6, lsr #16
	b	.L127
.L129:
	ldr	r9, .L189+44
	ldmia	r9, {r0-r1}
	mov	lr, pc
	bx	r7
	cmp	r5, #0
	and	r2, r0, #255
	ldr	r5, .L189+16
	ldr	r3, .L189+8
	strh	r2, [r8, #16]	@ movhi
	bne	.L133
	add	r1, r9, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	strh	r3, [r5, #18]	@ movhi
.L134:
	orr	r3, r6, #5120
	orr	r3, r3, #8
	strh	r3, [r8, #20]	@ movhi
	ldr	r6, .L189+4
	b	.L135
.L144:
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [sl, #18]	@ movhi
	b	.L145
.L187:
	ldr	r7, .L189+8
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	ldr	r8, .L189+16
	mvn	r3, r3, asl #17
	mvn	r3, r3, lsr #17
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	r7
	ldr	sl, .L189+20
	mov	r3, r0, asl #23
	ldr	r2, [sl, #32]
	mvn	r3, r3, lsr #6
	mvn	r3, r3, lsr #17
	cmp	r2, #0
	strh	r3, [r8, #2]	@ movhi
	beq	.L175
	ldr	r3, .L189+32
	smull	r2, r3, r5, r3
	sub	r3, r3, r5, asr #31
	add	r3, r3, r3, asl #1
	rsb	r3, r3, r5
	add	r3, r3, #64
	ldr	r5, [sl, #36]
	mov	r3, r3, asl #1
	orr	r3, r3, #8192
	mov	r5, r5, asl #28
	strh	r3, [r8, #4]	@ movhi
	mov	r5, r5, lsr #16
	b	.L141
.L143:
	ldr	fp, .L189+44
	ldmia	fp, {r0-r1}
	mov	lr, pc
	bx	r7
	cmp	r9, #0
	and	r2, r0, #255
	ldr	r9, .L189+16
	ldr	r3, .L189+8
	strh	r2, [r8, #16]	@ movhi
	bne	.L146
	add	r1, fp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #20480
	strh	r3, [r9, #18]	@ movhi
.L147:
	orr	r3, r5, #5120
	orr	r3, r3, #8
	strh	r3, [r8, #20]	@ movhi
	b	.L135
.L133:
	add	r1, r9, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r5, #18]	@ movhi
	b	.L134
.L152:
	ldr	r9, .L189+44
	ldmia	r9, {r0-r1}
	mov	lr, pc
	bx	r7
	and	r3, r0, #255
	add	r1, r9, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #16]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r2, r0, asl #23
	mov	r2, r2, lsr #23
	orr	r3, r5, #5120
	orr	r2, r2, #16384
	orr	r3, r3, #8
	strh	r2, [r8, #18]	@ movhi
	strh	r3, [r8, #20]	@ movhi
	b	.L135
.L146:
	add	r1, fp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r3
	mov	r3, r0, asl #23
	mov	r3, r3, lsr #23
	orr	r3, r3, #16384
	strh	r3, [r9, #18]	@ movhi
	b	.L147
.L190:
	.align	2
.L189:
	.word	wolf
	.word	state
	.word	__aeabi_d2iz
	.word	direction
	.word	shadowOAM
	.word	.LANCHOR0
	.word	Knight
	.word	door
	.word	1431655766
	.word	health
	.word	__aeabi_dcmpgt
	.word	slashAttack
	.word	.LANCHOR1
	.word	collisionMap1Bitmap
	.word	__aeabi_dcmplt
	.size	updateOAM, .-updateOAM
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mvn	r2, #1264
	mov	r3, #67108864
	sub	r2, r2, #1
	mov	r1, #128	@ movhi
	strh	r1, [r3, #132]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	mov	r2, #0	@ movhi
	strh	r2, [r3, #128]	@ movhi
	bx	lr
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L193
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r4, #0
	add	ip, ip, #12
	str	r4, [ip, #8]
	ldr	ip, .L193+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r6, r2
	mov	r5, r1
	add	r2, r7, #160
	mov	r3, #910163968
	add	r7, r7, #256
	mov	r0, #1
	mov	r1, sl
	str	r4, [ip, #0]
	ldr	ip, .L193+8
	mov	lr, pc
	bx	ip
	ldr	r8, .L193+12
	mov	r1, r6
	mov	r0, #16777216
	strh	r4, [r7, #2]	@ movhi
	mov	lr, pc
	bx	r8
	rsb	r2, r0, #0
	mov	r2, r2, asl #16
	ldr	r9, .L193+16
	mov	r2, r2, lsr #16
	strh	r2, [r7, #0]	@ movhi
	rsb	r0, r5, r5, asl #4
	mov	r2, #128	@ movhi
	mov	r3, #1
	mov	r1, r6
	str	sl, [r9, #0]
	mov	r0, r0, asl #2
	strh	r2, [r7, #2]	@ movhi
	str	r6, [r9, #8]
	str	r3, [r9, #12]
	str	r3, [r9, #16]
	str	r5, [r9, #4]
	mov	lr, pc
	bx	r8
	mov	r1, r6
	sub	r6, r0, #1
	mov	r0, r5
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r6, r6, r0
	str	r6, [r9, #20]
	str	r4, [r9, #24]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	dma
	.word	vbCountA
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.size	playSoundA, .-playSoundA
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #512
	stmfd	sp!, {r4, lr}
	ldrh	r2, [r3, #2]
	tst	r2, #1
	mov	r2, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	beq	.L196
	ldr	r1, .L204
	ldr	r3, [r1, #12]
	cmp	r3, #0
	ldrne	r2, .L204+4
	ldrne	r0, [r2, #0]
	ldr	r4, .L204+8
	addne	r0, r0, #1
	strne	r0, [r2, #0]
	ldr	r2, [r4, #12]
	cmp	r2, #0
	ldrne	r0, .L204+12
	ldrne	ip, [r0, #0]
	addne	ip, ip, #1
	strne	ip, [r0, #0]
	cmp	r3, #0
	beq	.L199
	ldr	r3, .L204+4
	ldr	r1, [r1, #20]
	ldr	r3, [r3, #0]
	cmp	r1, r3
	ldr	r3, .L204
	bge	.L199
	ldr	r1, [r3, #16]
	cmp	r1, #0
	bne	.L202
	ldr	r0, .L204+16
	ldr	ip, [r0, #0]
	mov	r0, #67108864
	add	r0, r0, #256
	add	ip, ip, #12
	strh	r1, [r0, #2]	@ movhi
	str	r1, [ip, #8]
	str	r1, [r3, #12]
.L199:
	cmp	r2, #0
	bne	.L203
.L201:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L196:
	mov	r3, #67108864
	add	r3, r3, #512
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L203:
	ldr	r3, .L204+12
	ldr	r2, [r4, #20]
	ldr	r3, [r3, #0]
	cmp	r2, r3
	bge	.L201
	ldr	r3, .L204+16
	mov	r2, #67108864
	ldr	r1, [r3, #0]
	add	r2, r2, #256
	mov	r3, #0
	strh	r3, [r2, #6]	@ movhi
	ldr	r2, .L204+8
	add	r1, r1, #24
	str	r3, [r1, #8]
	str	r3, [r2, #12]
	b	.L201
.L202:
	ldmia	r3, {r0, r1, r2}	@ phole ldm
	bl	playSoundA
	ldr	r2, [r4, #12]
	b	.L199
.L205:
	.align	2
.L204:
	.word	soundA
	.word	vbCountA
	.word	soundB
	.word	vbCountB
	.word	dma
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	menu
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L211
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L207
	ldr	r2, .L211+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L209
.L207:
	tst	r3, #4
	beq	.L206
	ldr	r3, .L211+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #4
	beq	.L210
.L206:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L210:
	ldr	ip, .L211+8
	mov	lr, #1
	mov	r3, r4
	mov	r0, #3
	ldr	r1, .L211+12
	mov	r2, #100663296
	ldr	r5, .L211+16
	str	lr, [ip, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L211+20
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	b	.L206
.L209:
	mov	r6, #67108864
	mov	lr, #4864	@ movhi
	strh	lr, [r6, #0]	@ movhi
	mov	ip, #23296
	ldr	lr, .L211+8
	add	ip, ip, #128
	mov	r3, #11136
	mov	r7, #2
	str	r7, [lr, #0]
	ldr	r5, .L211+16
	strh	ip, [r6, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L211+24
	mov	r2, #100663296
	add	r3, r3, #32
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L211+28
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r5
	mov	ip, #23808
	add	ip, ip, #136
	mov	r2, #100663296
	strh	ip, [r6, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L211+32
	add	r2, r2, #32768
	mov	r3, #1152
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #2048
	mov	r0, #3
	ldr	r1, .L211+36
	add	r2, r2, #59392
	mov	lr, pc
	bx	r5
	mov	r1, #368640
	mov	r2, #11008
	ldr	r0, .L211+40
	add	r1, r1, #576
	add	r2, r2, #17
	bl	playSoundA
	ldr	r3, [r4, #0]
	b	.L207
.L212:
	.align	2
.L211:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	background1Tiles
	.word	background1Map
	.word	background2Tiles
	.word	background2Map
	.word	backgroundMusic
	.size	menu, .-menu
	.global	__aeabi_d2uiz
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r4, .L223
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L214
	ldr	r5, .L223+4
	ldr	r3, [r5, #0]
	tst	r3, #4
	beq	.L220
.L219:
	ldr	r3, [r4, #0]
.L214:
	tst	r3, #8
	beq	.L213
	ldr	r3, .L223+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L221
.L213:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L220:
	ldr	r6, .L223+8
	ldr	r7, [r6, #0]
	cmp	r7, #2
	beq	.L222
.L216:
	ldr	r5, [r6, #0]
	cmp	r5, #3
	bne	.L219
	ldr	r8, .L223+12
	mov	r6, #67108864
	mov	r3, #4864	@ movhi
	add	r1, r8, #16
	ldmia	r1, {r0-r1}
	ldr	r7, .L223+16
	strh	r3, [r6, #0]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r8, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r6, #20]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r0, r0, asl #16
	mov	lr, r0, lsr #16
	strh	lr, [r6, #22]	@ movhi
	mov	ip, #23296
	ldr	lr, .L223+20
	add	ip, ip, #128
	mov	r3, #11136
	str	r5, [lr, #0]
	ldr	r7, .L223+24
	strh	ip, [r6, #8]	@ movhi
	ldr	r1, .L223+28
	mov	r2, #100663296
	add	r3, r3, #32
	mov	r0, r5
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L223+32
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r7
	mov	ip, #23808
	add	ip, ip, #136
	mov	r2, #100663296
	ldr	r1, .L223+36
	add	r2, r2, #32768
	mov	r3, #1152
	mov	r0, r5
	strh	ip, [r6, #10]	@ movhi
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	add	r2, r2, #59392
	mov	r3, #2048
	mov	r0, r5
	ldr	r1, .L223+40
	mov	lr, pc
	bx	r7
	add	r3, r6, #256
	ldrh	r2, [r3, #2]
	orr	r2, r2, #128
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	orr	r2, r2, #128
	strh	r2, [r3, #6]	@ movhi
	b	.L219
.L221:
	ldr	ip, .L223+20
	mov	r0, #3
	str	r4, [ip, #0]
	ldr	r1, .L223+44
	mov	r2, #100663296
	mov	r3, r4
	ldr	r5, .L223+24
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, r4
	mov	r0, #3
	ldr	r1, .L223+48
	add	r2, r2, #55296
	mov	lr, pc
	bx	r5
	mov	r1, #905216
	add	r1, r1, #2112
	mov	r2, #44032
	add	r1, r1, #9
	add	r2, r2, #68
	ldr	r0, .L223+52
	bl	playSoundA
	ldr	r3, .L223+12
	mov	r1, #0
	mov	r2, #0
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L213
.L222:
	ldr	r9, .L223+12
	mov	r8, #67108864
	mov	r3, #4864	@ movhi
	add	r1, r9, #16
	ldmia	r1, {r0-r1}
	ldr	sl, .L223+16
	strh	r3, [r8, #0]	@ movhi
	mov	lr, pc
	bx	sl
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r9, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r8, #20]	@ movhi
	mov	lr, pc
	bx	sl
	mov	r0, r0, asl #16
	mov	ip, r0, lsr #16
	strh	ip, [r8, #22]	@ movhi
	mov	lr, #23296
	ldr	ip, .L223+20
	add	lr, lr, #128
	mov	r3, #11136
	ldr	sl, .L223+24
	str	r7, [ip, #0]
	mov	r0, #3
	strh	lr, [r8, #8]	@ movhi
	ldr	r1, .L223+56
	mov	r2, #100663296
	add	r3, r3, #32
	mov	lr, pc
	bx	sl
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L223+60
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	sl
	mov	ip, #23808
	add	ip, ip, #136
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L223+36
	add	r2, r2, #32768
	mov	r3, #1152
	strh	ip, [r8, #10]	@ movhi
	mov	lr, pc
	bx	sl
	mov	r2, #100663296
	ldr	r1, .L223+40
	add	r2, r2, #59392
	mov	r3, #2048
	mov	r0, #3
	mov	lr, pc
	bx	sl
	add	r2, r8, #256
	ldrh	r3, [r2, #2]
	orr	r3, r3, #128
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [r4, #0]
	ldrh	r1, [r2, #6]
	tst	r3, #4
	orr	r1, r1, #128
	strh	r1, [r2, #6]	@ movhi
	beq	.L214
	ldr	r3, [r5, #0]
	tst	r3, #4
	beq	.L216
	b	.L219
.L224:
	.align	2
.L223:
	.word	oldButtons
	.word	buttons
	.word	prevGameState
	.word	.LANCHOR0
	.word	__aeabi_d2uiz
	.word	state
	.word	DMANow
	.word	level2BackgroundTiles
	.word	level2BackgroundMap
	.word	background2Tiles
	.word	background2Map
	.word	menuTiles
	.word	menuMap
	.word	menuMusic
	.word	background1Tiles
	.word	background1Map
	.size	pause, .-pause
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L228
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L225
	ldr	r3, .L228+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L227
.L225:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L227:
	ldr	ip, .L228+8
	mov	r0, #3
	ldr	r1, .L228+12
	mov	r2, #100663296
	mov	r3, r4
	ldr	r5, .L228+16
	str	r4, [ip, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L228+20
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L228+24
	ldr	r3, [r3, #0]
	add	r0, r3, #12
	add	r3, r3, #24
	str	r4, [r0, #8]
	str	r4, [r3, #8]
	ldr	r3, .L228+28
	mov	r1, #905216
	str	r4, [r3, #12]
	ldr	r3, .L228+32
	add	r1, r1, #2112
	mov	r2, #44032
	add	r1, r1, #9
	add	r2, r2, #68
	str	r4, [r3, #12]
	ldr	r0, .L228+36
	bl	playSoundA
	ldr	r3, .L228+40
	mov	r1, #0
	mov	r2, #0
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L225
.L229:
	.align	2
.L228:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	menuTiles
	.word	DMANow
	.word	menuMap
	.word	dma
	.word	soundA
	.word	soundB
	.word	menuMusic
	.word	.LANCHOR0
	.size	lose, .-lose
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L233
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L230
	ldr	r3, .L233+4
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L232
.L230:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L232:
	ldr	ip, .L233+8
	mov	r0, #3
	ldr	r1, .L233+12
	mov	r2, #100663296
	mov	r3, r4
	ldr	r5, .L233+16
	str	r4, [ip, #0]
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L233+20
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	ldr	r3, .L233+24
	ldr	r3, [r3, #0]
	add	r0, r3, #12
	add	r3, r3, #24
	str	r4, [r0, #8]
	str	r4, [r3, #8]
	ldr	r3, .L233+28
	mov	r1, #905216
	str	r4, [r3, #12]
	ldr	r3, .L233+32
	add	r1, r1, #2112
	mov	r2, #44032
	add	r1, r1, #9
	add	r2, r2, #68
	str	r4, [r3, #12]
	ldr	r0, .L233+36
	bl	playSoundA
	ldr	r3, .L233+40
	mov	r1, #0
	mov	r2, #0
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	b	.L230
.L234:
	.align	2
.L233:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	menuTiles
	.word	DMANow
	.word	menuMap
	.word	dma
	.word	soundA
	.word	soundB
	.word	menuMusic
	.word	.LANCHOR0
	.size	win, .-win
	.align	2
	.global	werewolfDeath
	.type	werewolfDeath, %function
werewolfDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L236
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, [r3, #0]
	ldr	r6, .L236+4
	mov	r4, #0
	mov	ip, #67108864
	add	r2, r3, #12
	add	r3, r3, #24
	str	r4, [r2, #8]
	str	r4, [r3, #8]
	strh	r4, [ip, #16]	@ movhi
	str	r4, [r6, #12]
	ldr	r6, .L236+8
	strh	r4, [ip, #18]	@ movhi
	str	r4, [r6, #12]
	mov	r6, #256	@ movhi
	strh	r6, [ip, #0]	@ movhi
	mov	lr, #23296
	ldr	r6, .L236+12
	add	lr, lr, #128
	mov	r7, #6
	mov	r3, r4
	ldr	r5, .L236+16
	str	r7, [r6, #0]
	mov	r0, #3
	strh	lr, [ip, #8]	@ movhi
	ldr	r1, .L236+20
	mov	r2, #100663296
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L236+24
	add	r2, r2, #55296
	mov	r3, r4
	mov	lr, pc
	bx	r5
	mov	r1, #421888
	mov	r2, #11008
	ldr	r0, .L236+28
	add	r1, r1, #1760
	add	r2, r2, #17
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	playSoundA
.L237:
	.align	2
.L236:
	.word	dma
	.word	soundA
	.word	soundB
	.word	state
	.word	DMANow
	.word	loseTiles
	.word	loseMap
	.word	loseMusic
	.size	werewolfDeath, .-werewolfDeath
	.align	2
	.global	healthbar
	.type	healthbar, %function
healthbar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	fp, .L284
	ldr	r4, .L284+4
	ldr	r5, .L284+8
	ldr	r0, [fp, #16]
	mov	lr, pc
	bx	r5
	add	r3, r4, #8
	ldmia	r3, {r2-r3}
	ldr	ip, .L284+12
	mov	lr, pc
	bx	ip
	stmia	fp, {r0-r1}
	ldr	r0, [fp, #20]
	mov	lr, pc
	bx	r5
	ldr	r6, .L284+16
	ldr	r5, .L284+20
	str	r0, [fp, #8]
	str	r1, [fp, #12]
	add	r9, r5, #480
	mov	sl, r6
.L268:
	ldr	r3, [r6, #20]
	ldr	r2, [r5, #20]
	cmp	r3, r2
	bge	.L239
	ldr	r1, [sl, #32]
	add	r1, r3, r1
	sub	r1, r1, #1
	cmp	r2, r1
	bge	.L239
	ldr	r0, [sl, #16]
	ldr	ip, [r5, #16]
	add	r1, r0, #2
	cmp	r1, ip
	blt	.L270
	add	r1, r0, #1
	cmp	ip, r1
	ble	.L243
.L270:
	ldr	r1, [r4, #48]
.L241:
	ldr	r8, [r5, #32]
	add	r7, r3, #3
	add	r8, r2, r8
	cmp	r7, r8
	bge	.L250
	cmp	r3, r2
	ble	.L250
	add	r7, r0, #2
	cmp	r7, ip
	blt	.L250
	add	r7, r0, #1
	cmp	r7, ip
	bge	.L272
.L250:
	ldr	r7, [r6, #36]
	sub	r7, r7, #3
	add	r7, r7, r0
	cmp	ip, r7
	bge	.L271
	cmp	ip, r0
	ble	.L271
	add	r7, r0, #1
	cmp	ip, r7
	bgt	.L271
	ldr	r7, [r5, #36]
	add	ip, ip, r7
	cmp	r0, ip
	blt	.L258
.L271:
	ldr	r1, [r4, #48]
.L249:
	cmp	r1, #0
	ble	.L267
	add	r1, r1, #1
	cmp	r1, #75
	ldreq	r2, .L284+4
	moveq	r3, #0
	str	r1, [r4, #48]
	streq	r3, [r2, #48]
.L267:
	add	r5, r5, #96
	cmp	r5, r9
	bne	.L268
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L239:
	ldr	r0, [sl, #16]
	ldr	ip, [r5, #16]
	b	.L270
.L243:
	ldr	r1, [r5, #36]
	add	r1, ip, r1
	cmp	r0, r1
	bge	.L270
	ldr	r1, [r4, #48]
	cmp	r1, #0
	bne	.L241
	ldr	r7, [r5, #56]
	cmp	r7, #0
	ble	.L241
	ldr	r3, [fp, #52]
	cmp	r3, #0
	beq	.L273
	cmp	r3, #1
	beq	.L274
	cmp	r3, #2
	beq	.L275
	cmp	r3, #3
	beq	.L276
.L246:
	ldr	r1, .L284+24
	ldr	r3, [r1, #4]
	mov	r2, #1
	str	r2, [r4, #32]
	str	r3, [r4, #52]
	ldr	r1, [r4, #48]
	b	.L249
.L272:
	ldr	r7, [r5, #36]
	add	r7, ip, r7
	cmp	r7, r0
	ble	.L250
	cmp	r1, #0
	bne	.L250
	ldr	r7, [r5, #56]
	cmp	r7, #0
	ble	.L250
	ldr	r3, [fp, #52]
	cmp	r3, #0
	beq	.L277
	cmp	r3, #1
	beq	.L278
	cmp	r3, #2
	beq	.L279
	cmp	r3, #3
	beq	.L280
.L252:
	ldr	r1, .L284+24
	ldr	r3, [r1, #8]
	mov	r2, #1
	str	r2, [r4, #32]
	str	r3, [r4, #52]
	ldr	r1, [r4, #48]
	b	.L249
.L258:
	cmp	r3, r2
	blt	.L281
	ble	.L271
	cmp	r3, r8
	bge	.L271
.L260:
	cmp	r1, #0
	bne	.L249
	ldr	r3, [r5, #56]
	cmp	r3, #0
	ble	.L267
	ldr	r3, [fp, #52]
	cmp	r3, #0
	bne	.L263
	ldr	r3, .L284
	mov	r1, #1
	str	r1, [r3, #52]
	str	r1, [r4, #48]
.L264:
	ldr	r2, .L284+24
	ldr	r3, [r2, #12]
	mov	r1, #1
	str	r1, [r4, #32]
	str	r3, [r4, #52]
	b	.L271
.L281:
	ldr	r0, [sl, #32]
	add	r3, r3, r0
	cmp	r2, r3
	blt	.L260
	b	.L271
.L273:
	ldr	r1, .L284
	ldr	r3, .L284+4
	mov	r2, #1
	str	r2, [r1, #52]
	str	r2, [r3, #48]
	b	.L246
.L277:
	ldr	r3, .L284
	mov	r1, #1
	str	r1, [r3, #52]
	str	r1, [r4, #48]
	b	.L252
.L263:
	cmp	r3, #1
	beq	.L282
	cmp	r3, #2
	beq	.L283
	cmp	r3, #3
	bne	.L264
	bl	werewolfDeath
	b	.L264
.L278:
	ldr	r2, .L284
	mov	r1, #2
	str	r1, [r2, #52]
	str	r3, [r4, #48]
	b	.L252
.L274:
	ldr	r1, .L284
	mov	r2, #2
	str	r2, [r1, #52]
	ldr	r1, .L284+4
	str	r3, [r1, #48]
	b	.L246
.L282:
	ldr	r2, .L284
	mov	r1, #2
	str	r1, [r2, #52]
	str	r3, [r4, #48]
	b	.L264
.L275:
	mov	r2, #3
	mov	r3, #1
	str	r2, [fp, #52]
	str	r3, [r4, #48]
	b	.L246
.L279:
	mov	r2, #3
	mov	r3, #1
	str	r2, [fp, #52]
	str	r3, [r4, #48]
	b	.L252
.L283:
	ldr	r2, .L284
	add	r3, r3, #1
	mov	r1, #1
	str	r3, [r2, #52]
	str	r1, [r4, #48]
	b	.L264
.L280:
	bl	werewolfDeath
	b	.L252
.L276:
	bl	werewolfDeath
	b	.L246
.L285:
	.align	2
.L284:
	.word	health
	.word	.LANCHOR0
	.word	__aeabi_i2d
	.word	__aeabi_dsub
	.word	wolf
	.word	Knight
	.word	.LANCHOR1
	.size	healthbar, .-healthbar
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L287
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	ip, [r3, #0]
	mov	r4, #0
	add	ip, ip, #24
	str	r4, [ip, #8]
	ldr	ip, .L287+4
	mov	sl, r0
	mov	r7, #67108864
	mov	r6, r2
	mov	r5, r1
	add	r2, r7, #164
	mov	r3, #910163968
	add	r7, r7, #256
	mov	r0, #2
	mov	r1, sl
	str	r4, [ip, #0]
	ldr	ip, .L287+8
	mov	lr, pc
	bx	ip
	ldr	r8, .L287+12
	mov	r1, r6
	mov	r0, #16777216
	strh	r4, [r7, #6]	@ movhi
	mov	lr, pc
	bx	r8
	rsb	r3, r0, #0
	mov	r3, r3, asl #16
	ldr	r9, .L287+16
	mov	r3, r3, lsr #16
	strh	r3, [r7, #4]	@ movhi
	rsb	r0, r5, r5, asl #4
	mov	r3, #128	@ movhi
	mov	r1, r6
	str	sl, [r9, #0]
	mov	r0, r0, asl #2
	strh	r3, [r7, #6]	@ movhi
	mov	r3, #1
	str	r6, [r9, #8]
	str	r3, [r9, #12]
	str	r5, [r9, #4]
	str	r4, [r9, #16]
	mov	lr, pc
	bx	r8
	mov	r1, r6
	sub	r6, r0, #1
	mov	r0, r5
	mov	lr, pc
	bx	r8
	sub	r0, r0, r0, asl #2
	add	r6, r6, r0
	str	r6, [r9, #20]
	str	r4, [r9, #24]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L288:
	.align	2
.L287:
	.word	dma
	.word	vbCountB
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.size	playSoundB, .-playSoundB
	.align	2
	.global	werewolfAttack
	.type	werewolfAttack, %function
werewolfAttack:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L308
	ldr	r6, .L308+4
	ldr	r8, .L308+8
	ldr	r9, .L308+12
	ldr	sl, .L308+16
	ldr	fp, .L308+20
	add	r5, r4, #480
	mov	r7, #0
.L301:
	ldr	r3, [r6, #0]
	tst	r3, #2
	beq	.L305
	ldr	r3, [r8, #0]
	tst	r3, #2
	beq	.L292
.L305:
	ldr	r3, [r4, #68]
.L291:
	cmp	r3, #0
	ble	.L298
.L303:
	add	r3, r3, #1
	cmp	r3, #50
	movne	r2, r3
	moveq	r2, r7
	str	r2, [r4, #68]
.L298:
	ldr	r3, [r4, #76]
	cmp	r3, #1
	beq	.L306
	cmp	r3, #0
	bne	.L300
	ldr	r2, [r4, #72]
	ldr	r1, [r4, #20]
	add	r2, r2, #1
	cmp	r2, #5
	sub	r1, r1, #3
	str	r2, [r4, #72]
	str	r1, [r4, #20]
	streq	r2, [r4, #76]
	streq	r3, [r4, #64]
	streq	r3, [r4, #72]
.L300:
	add	r4, r4, #96
	cmp	r4, r5
	bne	.L301
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L292:
	mov	r1, #2880
	mov	r2, #11008
	ldr	r0, .L308+24
	add	r1, r1, #8
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r9, #0]
	cmp	r3, #1
	beq	.L307
	cmp	r3, #0
	bne	.L305
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L291
	ldr	r3, [sl, #20]
	ldr	r0, [r4, #32]
	ldr	r1, [r4, #20]
	ldr	ip, [fp, #32]
	add	r2, r3, #3
	add	r1, r0, r1
	rsb	r2, ip, r2
	cmp	r2, r1
	bge	.L298
	ldr	r2, [sl, #32]
	add	r3, r3, r2
	cmp	r1, r3
	bge	.L298
	ldr	r3, [sl, #16]
	ldr	r1, [sl, #36]
	ldr	r2, [r4, #16]
	add	r1, r3, r1
	cmp	r1, r2
	ble	.L298
	add	r1, r3, #1
	cmp	r2, r1
	bgt	.L298
	ldr	r1, [r4, #36]
	add	r2, r2, r1
	cmp	r3, r2
	bge	.L298
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #56]
	bne	.L297
	mov	r2, #0
	mov	r3, #0
	stmia	r4, {r2-r3}
	mov	r3, #1073741824
	mov	r2, #0
	add	r3, r3, #6553600
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L297:
	mov	r3, #1
	str	r3, [r4, #64]
	str	r7, [r4, #76]
	str	r3, [r4, #68]
	str	r3, [r4, #72]
	b	.L303
.L306:
	ldr	r3, [r4, #72]
	ldr	r2, [r4, #20]
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #3
	str	r3, [r4, #72]
	str	r2, [r4, #20]
	streq	r7, [r4, #64]
	streq	r3, [r4, #76]
	streq	r7, [r4, #72]
	b	.L300
.L307:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	bne	.L291
	ldr	r2, [sl, #20]
	ldr	r1, [sl, #32]
	ldr	r0, [fp, #32]
	add	r1, r2, r1
	ldr	r3, [r4, #20]
	sub	r1, r1, #3
	add	r1, r1, r0
	cmp	r1, r3
	ble	.L298
	cmp	r2, r3
	bge	.L298
	ldr	r3, [sl, #16]
	ldr	r1, [sl, #36]
	ldr	r2, [r4, #16]
	add	r1, r3, r1
	cmp	r1, r2
	ble	.L298
	add	r1, r3, #1
	cmp	r2, r1
	bgt	.L298
	ldr	r1, [r4, #36]
	add	r2, r2, r1
	cmp	r3, r2
	bge	.L298
	ldr	r3, [r4, #56]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #56]
	bne	.L295
	mov	r2, #0
	mov	r3, #0
	stmia	r4, {r2-r3}
	mov	r3, #1073741824
	mov	r2, #0
	add	r3, r3, #6553600
	str	r2, [r4, #8]
	str	r3, [r4, #12]
.L295:
	mov	r3, #1
	str	r3, [r4, #64]
	str	r3, [r4, #76]
	str	r3, [r4, #68]
	str	r3, [r4, #72]
	b	.L303
.L309:
	.align	2
.L308:
	.word	Knight
	.word	oldButtons
	.word	buttons
	.word	direction
	.word	wolf
	.word	slashAttack
	.word	slash
	.size	werewolfAttack, .-werewolfAttack
	.global	__aeabi_dcmple
	.global	__aeabi_dcmpge
	.align	2
	.global	werewolf
	.type	werewolf, %function
werewolf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L575+36
	ldr	r7, .L575+40
	sub	sp, sp, #60
	ldr	r8, .L575+52
	add	r3, r7, #8
	ldmia	r3, {r2-r3}
	ldmia	r4, {r0-r1}
	mov	lr, pc
	bx	r8
	ldr	r9, .L575+44
	mov	lr, pc
	bx	r9
	add	ip, r7, #16
	ldmia	ip, {fp-ip}
	add	sl, r4, #8
	ldmia	sl, {r9-sl}
	mov	r5, r0
	mov	r3, ip
	mov	r2, fp
	str	fp, [sp, #32]
	str	ip, [sp, #36]
	mov	r0, r9
	mov	r1, sl
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r8
	ldr	ip, .L575+44
	mov	lr, pc
	bx	ip
	ldr	r3, .L575+8
	ldr	r3, [r3, #0]
	cmp	r3, #2
	mov	r2, r0
	str	r0, [r4, #20]
	beq	.L560
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L399
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bne	.L399
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L399
	ldr	r1, .L575+56
	ldr	r6, [r1, #0]
	add	r0, r5, #1
	sub	ip, r2, #1
	mla	r3, r6, r0, ip
	ldr	r8, .L575+28
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	str	r1, [sp, #44]
	ldreq	r1, [r4, #36]
	beq	.L401
	ldr	r1, [r4, #36]
	sub	r3, r1, #1
	add	r3, r3, r5
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L401
	add	r3, r1, r1, lsr #31
	add	r3, r5, r3, asr #1
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L401
	add	r3, r5, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L401
	sub	r3, r1, #4
	add	r3, r3, r5
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L401
	mov	r3, #0
	ldr	r5, .L575+64
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #1
	movne	r3, #0
	tst	r3, #255
	bne	.L402
	mov	r2, #0
	mov	r0, r9
	mov	r1, sl
	mov	r3, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r2, .L575+68
	strne	r2, [sp, #0]
	bne	.L404
	ldr	r3, .L575+68
	str	r3, [sp, #0]
	mov	r3, #1069547520
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L575+68
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L404:
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	adr	r3, .L575
	ldmia	r3, {r2-r3}
	ldr	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #20]
	add	r0, r5, #1
.L401:
	cmp	r1, #0
	ble	.L423
	ldr	ip, [r4, #16]
	mov	r3, #0
	b	.L410
.L487:
	mov	r5, ip
.L410:
	add	r0, r3, r5
	mla	r0, r6, r0, r2
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	addeq	r5, r5, #1
	add	r3, r3, #1
	moveq	ip, r5
	cmp	r3, r1
	bne	.L487
.L530:
	str	ip, [r4, #16]
	add	r0, r5, #1
.L423:
	mul	r0, r6, r0
	ldr	r3, .L575+12
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r2, [r4, #20]
	add	r3, r0, r2
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldr	r5, [r4, #16]
	bne	.L561
.L426:
	add	r2, r2, #1
	ldr	r9, [r4, #36]
	str	r2, [r4, #20]
	add	r9, r5, r9
.L427:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L428
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ldr	r3, .L575+40
	bne	.L428
	ldr	ip, [r3, #28]
	cmp	ip, #0
	bne	.L428
	ldr	fp, [r4, #32]
	add	ip, r2, fp
	add	lr, ip, #1
	add	r0, lr, r0
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L575+28
	beq	.L429
	sub	r0, r9, #1
	mla	r0, r6, r0, lr
	mov	r0, r0, asl #1
	ldrh	r0, [sl, r0]
	cmp	r0, #0
	beq	.L429
	add	r1, r1, r1, lsr #31
	add	r1, r5, r1, asr #1
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L429
	add	r1, r5, #4
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L429
	sub	r1, r9, #4
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L429
	add	sl, r3, #16
	ldmia	sl, {r9-sl}
	mov	r3, #1073741824
	ldr	r5, .L575+64
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #7405568
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L519
	ldr	r0, .L575+36
	ldr	r3, .L575+48
	add	sl, r0, #8
	ldmia	sl, {r9-sl}
	rsb	r0, fp, #240
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L432
	mov	r3, #1069547520
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L575+52
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L432:
	adr	r3, .L575
	ldmia	r3, {r2-r3}
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	ldr	fp, .L575+52
	mov	lr, pc
	bx	fp
	ldr	lr, [sp, #44]
	ldr	r2, [r4, #20]
	ldr	ip, [r4, #32]
	ldr	r9, [r4, #16]
	ldr	r3, [r4, #36]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	add	ip, r2, ip
	add	r9, r9, r3
.L429:
	ldr	r0, [sp, #44]
	ldr	r5, [r4, #16]
	ldr	r1, [r0, #0]
	ldr	r0, .L575+12
	mov	lr, #1
	mla	r3, r9, r6, r6
	str	lr, [r0, #0]
	mov	r6, r1
	mla	r0, r5, r1, r1
	b	.L436
.L399:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	beq	.L412
	ldr	r0, .L575+56
	str	r0, [sp, #44]
	ldr	r3, [sp, #44]
	ldr	r1, [r4, #36]
	ldr	r6, [r3, #0]
	ldr	r8, .L575+28
	add	r0, r5, #1
.L411:
	mul	r0, r6, r0
	add	r3, r0, r2
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L426
.L561:
	add	r9, r5, r1
	mla	r3, r6, r9, r2
	ldr	ip, .L575+28
	mov	r3, r3, asl #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	ldreq	r9, [r4, #36]
	addeq	r2, r2, #1
	streq	r2, [r4, #20]
	addeq	r9, r5, r9
	b	.L427
.L412:
	ldr	fp, [r7, #32]
	cmp	fp, #0
	bne	.L562
	ldr	r3, .L575+40
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L414
	ldr	r9, .L575+56
	ldr	r1, [r4, #36]
	str	r9, [sp, #44]
	add	r0, r5, #1
	ldr	r6, [r9, #0]
	ldr	r8, .L575+28
	b	.L411
.L576:
	.align	3
.L575:
	.word	1202590843
	.word	1067743969
	.word	state
	.word	direction
	.word	oldButtons
	.word	buttons
	.word	__aeabi_dcmplt
	.word	collisionMap2Bitmap
	.word	__aeabi_dcmpgt
	.word	wolf
	.word	.LANCHOR0
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	.LANCHOR1
	.word	collisionMap1Bitmap
	.word	__aeabi_dcmpeq
	.word	__aeabi_dsub
.L428:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L525
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ldr	lr, .L575+40
	beq	.L438
.L525:
	mla	r3, r9, r6, r6
	ldr	ip, [r4, #32]
	add	ip, r2, ip
.L436:
	add	r0, r0, ip
	mov	r0, r0, asl #1
	ldrh	r1, [r8, r0]
	cmp	r1, #0
	beq	.L448
	mla	ip, r9, r6, ip
	ldr	r1, .L575+28
	mov	ip, ip, asl #1
	ldrh	r1, [r1, ip]
	cmp	r1, #0
	beq	.L448
.L449:
	ldr	r2, .L575+16
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L450
	ldr	r3, .L575+20
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L451
.L526:
	ldr	r2, [r4, #36]
	mla	r3, r9, r6, r6
	add	r9, r5, r2
.L450:
	ldr	sl, [r4, #20]
	add	ip, r3, sl
	mov	r2, ip, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	str	ip, [sp, #48]
	beq	.L453
	ldr	lr, .L575+36
	ldr	lr, [lr, #32]
	add	r0, lr, sl
	add	r3, r3, r0
	ldr	r1, .L575+28
	str	r3, [sp, #52]
	mov	r3, r3, asl #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	str	lr, [sp, #4]
	str	r0, [sp, #32]
	bne	.L563
.L453:
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	ldr	ip, .L575+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r5, .L575+36
	bne	.L455
	ldr	r1, [r5, #32]
	ldr	sl, [r5, #20]
	ldr	r2, [sp, #44]
	add	r3, sl, r1
	str	r1, [sp, #4]
	ldr	r5, [r5, #16]
	ldr	r6, [r2, #0]
	str	r3, [sp, #32]
.L454:
	sub	r5, r5, #1
	mul	r6, r5, r6
	add	sl, r6, sl
	mov	r3, sl, asl #1
	ldrh	r9, [r8, r3]
	cmp	r9, #0
	ldr	r3, .L575+28
	bne	.L457
	ldr	r0, [sp, #32]
	add	r6, r6, r0
	mov	r6, r6, asl #1
	ldrh	r5, [r3, r6]
.L458:
	add	fp, r4, #56
	ldmia	fp, {sl-fp}
	mov	r2, #0
	mov	r0, sl
	mov	r1, fp
	mov	r3, #0
	ldr	ip, .L575+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L460
	ldr	r3, .L575+68
	str	r3, [sp, #0]
	mov	r0, sl
	mov	r2, sl
	mov	r3, fp
	mov	r1, fp
	ldr	sl, [sp, #0]
	mov	lr, pc
	bx	sl
	ldr	r3, .L575+36
	str	r0, [r3, #56]
	str	r1, [r3, #60]
.L460:
	cmp	r5, #0
	bne	.L462
	mov	r3, #1069547520
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	ldr	fp, .L575+68
	mov	r2, #0
	add	r3, r3, #3145728
	mov	lr, pc
	bx	fp
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L462:
	cmp	r9, #0
	bne	.L459
	mov	r3, #1069547520
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	r2, #0
	add	r3, r3, #3145728
	ldr	ip, .L575+52
	mov	lr, pc
	bx	ip
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L459:
	bl	werewolfAttack
	ldr	r3, [r7, #32]
	cmp	r3, #1
	ldr	r5, .L575+40
	beq	.L564
.L376:
	add	sp, sp, #60
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	animateWolf
.L448:
	ldr	r9, [r4, #36]
	sub	r2, r2, #1
	str	r2, [r4, #20]
	add	r9, r5, r9
	b	.L449
.L457:
	ldr	r1, [sp, #32]
	add	r6, r6, r1
	mov	r2, r6, asl #1
	ldrh	r5, [r3, r2]
	cmp	r5, #0
	beq	.L458
	ldr	r2, [sp, #4]
	add	ip, r2, r2, lsr #31
	add	ip, sl, ip, asr #1
	mov	ip, ip, asl #1
	ldrh	r2, [r3, ip]
	cmp	r2, #0
	beq	.L458
	add	sl, r3, sl, asl #1
	ldrh	r2, [sl, #8]
	cmp	r2, #0
	beq	.L458
	add	r6, r3, r6, asl #1
	ldrh	r3, [r6, #-8]
	cmp	r3, #0
	bne	.L459
	b	.L458
.L455:
	mla	r6, r9, r6, sl
	mov	r6, r6, asl #1
	ldrh	r3, [r8, r6]
	mov	r9, #0
	cmp	r3, #0
	mov	sl, #0
	mov	r3, #0
	str	r9, [r5, #56]
	str	sl, [r5, #60]
	str	r3, [r7, #28]
	beq	.L456
	ldmia	r5, {r0-r1}
	ldr	sl, .L575+44
	mov	lr, pc
	bx	sl
	ldr	r3, .L575+48
	mov	lr, pc
	bx	r3
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3145728
	ldr	fp, .L575+52
	mov	lr, pc
	bx	fp
	ldr	ip, [r5, #32]
	ldr	sl, [r5, #20]
	ldr	lr, [sp, #44]
	stmia	r5, {r0-r1}
	add	r0, sl, ip
	str	ip, [sp, #4]
	ldr	r5, [r5, #16]
	ldr	r6, [lr, #0]
	str	r0, [sp, #32]
	b	.L454
.L560:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L312
	ldr	r3, [r7, #32]
	cmp	r3, #0
	bne	.L312
	ldr	r3, [r7, #28]
	cmp	r3, #0
	bne	.L312
	ldr	lr, .L575+56
	ldr	r6, [lr, #0]
	add	r0, r5, #1
	sub	ip, r2, #1
	mla	r3, r6, r0, ip
	ldr	r8, .L575+60
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	str	lr, [sp, #44]
	ldreq	r1, [r4, #36]
	beq	.L314
	ldr	r1, [r4, #36]
	sub	r3, r1, #1
	add	r3, r3, r5
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L314
	add	r3, r1, r1, lsr #31
	add	r3, r5, r3, asr #1
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L314
	add	r3, r5, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L314
	sub	r3, r1, #4
	add	r3, r3, r5
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L314
	mov	r3, #0
	ldr	r5, .L575+64
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #1
	movne	r3, #0
	tst	r3, #255
	bne	.L315
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	r3, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r0, .L575+68
	strne	r0, [sp, #0]
	bne	.L317
	ldr	r1, .L575+68
	mov	r3, #1069547520
	str	r1, [sp, #0]
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L575+68
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L317:
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	adr	r3, .L577
	ldmia	r3, {r2-r3}
	ldr	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #20]
	add	r0, r5, #1
.L314:
	cmp	r1, #0
	ble	.L336
	ldr	ip, [r4, #16]
	mov	r3, #0
	b	.L323
.L485:
	mov	r5, ip
.L323:
	add	r0, r3, r5
	mla	r0, r6, r0, r2
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	addeq	r5, r5, #1
	add	r3, r3, #1
	moveq	ip, r5
	cmp	r3, r1
	bne	.L485
.L529:
	str	ip, [r4, #16]
	add	r0, r5, #1
.L336:
	ldr	r3, .L577+8
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r5, [r4, #16]
	ldr	r2, [r4, #20]
	b	.L324
.L578:
	.align	3
.L577:
	.word	1202590843
	.word	1067743969
	.word	direction
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	wolf
	.word	collisionMap1Bitmap
	.word	__aeabi_dsub
.L312:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	beq	.L325
	ldr	r0, .L577+12
	str	r0, [sp, #44]
	ldr	r3, [sp, #44]
	ldr	r1, [r4, #36]
	ldr	r6, [r3, #0]
	ldr	r8, .L577+32
	add	r0, r5, #1
.L324:
	mul	r0, r6, r0
	add	r3, r0, r2
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L339
	add	r3, r5, r1
	str	r3, [sp, #4]
	mla	r3, r6, r3, r2
	ldr	ip, .L577+32
	mov	r3, r3, asl #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	bne	.L340
.L339:
	ldr	r9, [r4, #36]
	add	r2, r2, #1
	add	r9, r5, r9
	str	r2, [r4, #20]
	str	r9, [sp, #4]
.L340:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L341
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ldr	r3, .L577+16
	bne	.L341
	ldr	ip, [r3, #28]
	cmp	ip, #0
	beq	.L565
.L341:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	beq	.L350
	ldr	sl, [sp, #4]
	mla	r3, sl, r6, r6
	ldr	ip, [r4, #32]
	add	ip, r2, ip
.L349:
	add	r0, r0, ip
	mov	r0, r0, asl #1
	ldrh	r1, [r8, r0]
	cmp	r1, #0
	beq	.L361
	ldr	r0, [sp, #4]
	mla	ip, r0, r6, ip
	ldr	r1, .L577+32
	mov	ip, ip, asl #1
	ldrh	r1, [r1, ip]
	cmp	r1, #0
	bne	.L362
.L361:
	ldr	r9, [r4, #36]
	sub	r2, r2, #1
	add	r9, r5, r9
	str	r2, [r4, #20]
	str	r9, [sp, #4]
.L362:
	ldr	r2, .L577+20
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L363
	ldr	r3, .L577+24
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L364
	ldr	r1, [sp, #4]
	mla	r3, r1, r6, r6
	ldr	r2, [r4, #36]
	add	r2, r5, r2
	str	r2, [sp, #4]
.L363:
	ldr	fp, [r4, #20]
	add	ip, r3, fp
	mov	r2, ip, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	str	ip, [sp, #48]
	beq	.L366
	ldr	lr, .L577+28
	ldr	ip, [lr, #32]
	add	r0, ip, fp
	add	r3, r3, r0
	ldr	r1, .L577+32
	str	r3, [sp, #52]
	mov	r3, r3, asl #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	str	r0, [sp, #32]
	beq	.L366
	ldr	r2, .L577+36
	str	r2, [sp, #0]
	add	r1, lr, #56
	ldmia	r1, {r0-r1}
	adr	r3, .L579
	ldmia	r3, {r2-r3}
	str	ip, [sp, #12]
	ldr	r9, [sp, #0]
	mov	lr, pc
	bx	r9
	ldr	sl, .L579+52
	mov	r2, r0
	mov	r3, r1
	str	r2, [sl, #56]
	str	r3, [sl, #60]
	str	r0, [sp, #24]
	str	r1, [sp, #28]
	ldmia	sl, {r0-r1}
	mov	lr, pc
	bx	r9
	ldr	ip, [sp, #12]
	ldr	r2, [sp, #48]
	add	r3, ip, ip, lsr #31
	add	r3, r2, r3, asr #1
	ldr	r9, .L579+16
	mov	r3, r3, asl #1
	ldrh	r3, [r9, r3]
	cmp	r3, #0
	stmia	sl, {r0-r1}
	bne	.L566
.L366:
	mov	r9, #0
	mov	sl, #0
	add	r1, r4, #56
	ldmia	r1, {r0-r1}
	mov	r2, r9
	mov	r3, sl
	ldr	ip, .L579+20
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	ldr	r5, .L579+52
	bne	.L368
	ldr	fp, [r5, #20]
	ldr	ip, [r5, #32]
	ldr	r0, [sp, #44]
	add	r1, ip, fp
	ldr	r5, [r5, #16]
	ldr	r6, [r0, #0]
	str	r1, [sp, #32]
.L367:
	sub	r5, r5, #1
	mul	r6, r5, r6
	add	sl, r6, fp
	mov	r3, sl, asl #1
	ldrh	r9, [r8, r3]
	cmp	r9, #0
	ldr	r3, .L579+16
	bne	.L370
	ldr	r0, [sp, #32]
	add	r6, r6, r0
	mov	r6, r6, asl #1
	ldrh	r5, [r3, r6]
.L371:
	add	fp, r4, #56
	ldmia	fp, {sl-fp}
	mov	r2, #0
	mov	r0, sl
	mov	r1, fp
	mov	r3, #0
	ldr	ip, .L579+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L373
	ldr	r2, .L579+48
	str	r2, [sp, #0]
	mov	r0, sl
	mov	r2, sl
	mov	r3, fp
	mov	r1, fp
	ldr	sl, [sp, #0]
	mov	lr, pc
	bx	sl
	ldr	r3, .L579+52
	str	r0, [r3, #56]
	str	r1, [r3, #60]
.L373:
	cmp	r5, #0
	bne	.L375
	mov	r3, #1069547520
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	ldr	fp, .L579+48
	mov	r2, #0
	add	r3, r3, #3145728
	mov	lr, pc
	bx	fp
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L375:
	cmp	r9, #0
	bne	.L372
	mov	r3, #1069547520
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	mov	r2, #0
	add	r3, r3, #3145728
	ldr	ip, .L579+40
	mov	lr, pc
	bx	ip
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L372:
	bl	werewolfAttack
	ldr	r3, [r7, #32]
	cmp	r3, #1
	ldr	r5, .L579+28
	bne	.L376
	ldr	lr, [sp, #44]
	ldr	r3, [r5, #52]
	ldr	r2, [lr, #4]
	cmp	r3, r2
	ldr	r6, .L579+32
	beq	.L567
	ldr	r2, [r6, #12]
	cmp	r3, r2
	beq	.L532
	mov	r1, #2272
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L579+36
	add	r1, r1, #5
	bl	playSoundB
	ldr	r9, [r4, #16]
	ldr	r6, [r6, #0]
	mla	sl, r9, r6, r6
	ldr	lr, [r4, #32]
	ldr	fp, [r4, #20]
	add	r5, lr, fp
	add	r3, r5, #4
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	str	lr, [sp, #32]
	ldr	r2, .L579+16
	bne	.L568
.L392:
	add	r3, r5, #3
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	ldr	r2, .L579+16
	beq	.L394
	ldr	r1, [r4, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L394
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L394
	ldr	r2, .L579+52
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	add	r3, r3, #524288
	mov	r2, #0
	ldr	ip, .L579+40
	mov	lr, pc
	bx	ip
	ldr	lr, .L579+52
	str	r0, [lr, #8]
	str	r1, [lr, #12]
.L393:
	add	r3, sl, r5
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldr	r3, .L579+16
	beq	.L395
	ldr	r2, [r4, #36]
	add	r1, r9, r2
	sub	r1, r1, #1
	mla	r1, r6, r1, r5
	mov	r1, r1, asl #1
	ldrh	r1, [r3, r1]
	cmp	r1, #0
	beq	.L395
	add	r2, r2, r2, lsr #31
	add	r2, r9, r2, asr #1
	mla	r2, r6, r2, r5
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L396
.L395:
	ldr	r0, [sp, #32]
	sub	r5, fp, #20
	str	r5, [r4, #20]
	add	r5, r5, r0
.L396:
	add	r5, r5, #1
	add	sl, r5, sl
	mov	sl, sl, asl #1
	ldrh	r3, [r8, sl]
	cmp	r3, #0
	ldr	r3, .L579+16
	bne	.L483
	ldr	r2, [r4, #36]
	add	r1, r9, r2
	sub	r1, r1, #1
	mla	r1, r6, r1, r5
	mov	r1, r1, asl #1
	ldrh	r1, [r3, r1]
	cmp	r1, #0
	bne	.L483
	add	r2, r2, r2, lsr #31
	add	r2, r9, r2, asr #1
	mla	r2, r6, r2, r5
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	beq	.L549
.L483:
	adr	r3, .L579+8
	ldmia	r3, {r2-r3}
	str	r2, [r4, #56]
	str	r3, [r4, #60]
.L484:
	ldmia	r4, {r0-r1}
	ldr	ip, .L579+48
.L534:
	mov	lr, pc
	bx	ip
	ldr	r3, [r7, #56]
	add	r3, r3, #1
	cmp	r3, #5
	ldr	r2, .L579+28
	str	r3, [r7, #56]
	moveq	r3, #0
	stmia	r4, {r0-r1}
	streq	r3, [r2, #32]
	streq	r3, [r2, #52]
	streq	r3, [r2, #56]
	b	.L376
.L580:
	.align	3
.L579:
	.word	-1717986918
	.word	1067030937
	.word	858993459
	.word	1070805811
	.word	collisionMap1Bitmap
	.word	__aeabi_dcmplt
	.word	__aeabi_dcmpgt
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	injuredGrunt
	.word	__aeabi_dadd
	.word	collisionMap2Bitmap
	.word	__aeabi_dsub
	.word	wolf
.L564:
	ldr	lr, [sp, #44]
	ldr	r3, [r5, #52]
	ldr	r2, [lr, #4]
	cmp	r3, r2
	ldr	r6, .L579+32
	beq	.L569
	ldr	r2, [r6, #12]
	cmp	r3, r2
	beq	.L532
	mov	r1, #2272
	mov	r2, #11008
	add	r2, r2, #17
	ldr	r0, .L579+36
	add	r1, r1, #5
	bl	playSoundB
	ldr	r9, [r4, #16]
	ldr	r6, [r6, #0]
	mla	sl, r9, r6, r6
	ldr	lr, [r4, #32]
	ldr	fp, [r4, #20]
	add	r5, lr, fp
	add	r3, r5, #4
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	str	lr, [sp, #32]
	ldr	r2, .L579+44
	beq	.L478
	ldr	r0, .L579+52
	ldr	r1, [r0, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L478
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L478
	ldr	r2, .L579+52
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	add	r3, r3, #1048576
	mov	r2, #0
	ldr	ip, .L579+40
	mov	lr, pc
	bx	ip
	ldr	lr, .L579+52
	str	r0, [lr, #8]
	str	r1, [lr, #12]
.L479:
	add	r3, sl, r5
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldr	r3, .L579+44
	beq	.L481
	ldr	r2, [r4, #36]
	add	r1, r9, r2
	sub	r1, r1, #1
	mla	r1, r6, r1, r5
	mov	r1, r1, asl #1
	ldrh	r1, [r3, r1]
	cmp	r1, #0
	bne	.L570
.L481:
	ldr	r0, [sp, #32]
	sub	r5, fp, #20
	str	r5, [r4, #20]
	add	r5, r5, r0
.L482:
	add	r5, r5, #1
	add	sl, r5, sl
	mov	sl, sl, asl #1
	ldrh	r3, [r8, sl]
	cmp	r3, #0
	ldr	r3, .L579+44
	bne	.L483
	ldr	r2, [r4, #36]
	add	r1, r9, r2
	sub	r1, r1, #1
	mla	r1, r6, r1, r5
	mov	r1, r1, asl #1
	ldrh	r1, [r3, r1]
	cmp	r1, #0
	bne	.L483
	add	r2, r2, r2, lsr #31
	add	r9, r9, r2, asr #1
	mla	r5, r6, r9, r5
	mov	r5, r5, asl #1
	ldrh	r3, [r3, r5]
	cmp	r3, #0
	bne	.L483
.L549:
	mov	r3, #1069547520
	ldr	r1, .L579+52
	mov	r2, #0
	add	r3, r3, #3670016
	str	r2, [r1, #56]
	str	r3, [r1, #60]
	b	.L484
.L563:
	ldr	r2, .L579+48
	ldr	r3, .L579+52
	str	r2, [sp, #0]
	add	r1, r3, #56
	ldmia	r1, {r0-r1}
	ldr	fp, [sp, #0]
	adr	r3, .L581
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	fp
	ldr	ip, .L581+20
	mov	r2, r0
	mov	r3, r1
	str	r2, [ip, #56]
	str	r3, [ip, #60]
	str	r0, [sp, #16]
	str	r1, [sp, #20]
	ldmia	ip, {r0-r1}
	mov	lr, pc
	bx	fp
	ldr	r2, [sp, #4]
	ldr	fp, [sp, #48]
	add	r3, r2, r2, lsr #31
	add	r3, fp, r3, asr #1
	ldr	ip, .L581+44
	mov	r3, r3, asl #1
	ldrh	r3, [ip, r3]
	ldr	lr, .L581+20
	cmp	r3, #0
	stmia	lr, {r0-r1}
	beq	.L453
	add	r3, ip, fp, asl #1
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	beq	.L453
	ldr	r0, [sp, #52]
	add	r3, ip, r0, asl #1
	ldrh	r3, [r3, #-8]
	cmp	r3, #0
	bne	.L454
	b	.L453
.L451:
	ldr	sl, [r7, #28]
	cmp	sl, #2
	beq	.L526
	ldr	r2, .L581+52
	mov	r3, #1069547520
	str	r2, [sp, #0]
	add	r3, r3, #3670016
	mov	r2, #0
	str	r2, [r4, #56]
	str	r3, [r4, #60]
	ldmia	r4, {r0-r1}
	ldr	fp, [sp, #0]
	mov	lr, pc
	bx	fp
	ldr	r3, .L581+36
	ldr	r2, [r4, #36]
	add	sl, sl, #1
	str	sl, [r3, #28]
	stmia	r4, {r0-r1}
	mla	r3, r9, r6, r6
	add	r9, r5, r2
	b	.L450
.L456:
	ldr	r1, .L581+52
	mov	r3, #1069547520
	str	r1, [sp, #0]
	mov	r2, #0
	ldmia	r5, {r0-r1}
	add	r3, r3, #3145728
	ldr	r9, [sp, #0]
	mov	lr, pc
	bx	r9
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3145728
	mov	lr, pc
	bx	r9
	ldr	fp, [r5, #32]
	ldr	sl, [r5, #20]
	ldr	ip, [sp, #44]
	add	lr, sl, fp
	stmia	r5, {r0-r1}
	str	fp, [sp, #4]
	ldr	r5, [r5, #16]
	ldr	r6, [ip, #0]
	str	lr, [sp, #32]
	b	.L454
.L562:
	ldr	r8, .L581+40
	ldr	r1, [r4, #36]
	str	r8, [sp, #44]
	ldr	r6, [r8, #0]
	add	r0, r5, #1
	ldr	r8, .L581+44
	b	.L411
.L438:
	ldr	r3, [lr, #28]
	cmp	r3, #0
	beq	.L525
	ldr	r3, [r4, #32]
	add	ip, r2, r3
	add	sl, ip, #1
	add	r0, sl, r0
	mov	r0, r0, asl #1
	str	r3, [sp, #32]
	ldrh	r3, [r8, r0]
	cmp	r3, #0
	ldr	fp, .L581+44
	beq	.L571
	mla	r3, r9, r6, r6
	add	r0, r3, sl
	mov	r0, r0, asl #1
	ldrh	r0, [fp, r0]
	cmp	r0, #0
	beq	.L441
	add	r1, r1, r1, lsr #31
	add	r1, r5, r1, asr #1
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L441
	add	r1, r5, #4
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L441
	sub	r1, r9, #4
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L441
	add	fp, lr, #16
	ldmia	fp, {sl-fp}
	mov	r3, #1073741824
	ldr	r5, .L581+48
	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	add	r3, r3, #7405568
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L521
	ldr	ip, [sp, #32]
	ldr	r3, .L581+28
	rsb	r0, ip, #240
	mov	lr, pc
	bx	r3
	ldr	r9, .L581+20
	add	fp, r9, #8
	ldmia	fp, {sl-fp}
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L444
	mov	r3, #1069547520
	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L581+32
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L444:
	adr	r3, .L581+8
	ldmia	r3, {r2-r3}
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	ldr	fp, .L581+32
	mov	lr, pc
	bx	fp
	ldr	r2, [r4, #36]
	ldr	ip, [sp, #44]
	ldr	r9, [r4, #16]
	ldr	r3, [ip, #0]
	add	r9, r9, r2
	ldr	ip, [r4, #32]
	ldr	r2, [r4, #20]
	mla	r3, r9, r3, r3
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	add	ip, r2, ip
	b	.L441
.L325:
	ldr	fp, [r7, #32]
	cmp	fp, #0
	beq	.L326
	ldr	r8, .L581+40
	ldr	r1, [r4, #36]
	str	r8, [sp, #44]
	ldr	r6, [r8, #0]
	add	r0, r5, #1
	ldr	r8, .L581+16
	b	.L324
.L478:
	add	r3, r5, #3
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	ldr	r2, .L581+44
	beq	.L480
	ldr	r1, [r4, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L480
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L480
	ldr	r2, .L581+20
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	add	r3, r3, #524288
	mov	r2, #0
	ldr	ip, .L581+32
	mov	lr, pc
	bx	ip
	ldr	lr, .L581+20
	str	r0, [lr, #8]
	str	r1, [lr, #12]
	b	.L479
.L582:
	.align	3
.L581:
	.word	-1717986918
	.word	1067030937
	.word	1202590843
	.word	1067743969
	.word	collisionMap1Bitmap
	.word	wolf
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	collisionMap2Bitmap
	.word	__aeabi_dcmpeq
	.word	__aeabi_dsub
.L480:
	add	r3, r5, #2
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	ldr	r2, .L581+44
	beq	.L479
	ldr	r1, [r4, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L479
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L479
	ldr	r2, .L581+20
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	ldr	ip, .L581+32
	mov	r2, #0
	mov	lr, pc
	bx	ip
	ldr	lr, .L581+20
	str	r0, [lr, #8]
	str	r1, [lr, #12]
	b	.L479
.L370:
	ldr	r1, [sp, #32]
	add	r6, r6, r1
	mov	r2, r6, asl #1
	ldrh	r5, [r3, r2]
	cmp	r5, #0
	beq	.L371
	add	ip, ip, ip, lsr #31
	add	ip, sl, ip, asr #1
	mov	ip, ip, asl #1
	ldrh	r2, [r3, ip]
	cmp	r2, #0
	beq	.L371
	add	sl, r3, sl, asl #1
	ldrh	r2, [sl, #8]
	cmp	r2, #0
	beq	.L371
	add	r6, r3, r6, asl #1
	ldrh	r3, [r6, #-8]
	cmp	r3, #0
	bne	.L372
	b	.L371
.L368:
	ldr	r2, [sp, #4]
	mla	r6, r2, r6, fp
	mov	r6, r6, asl #1
	ldrh	r3, [r8, r6]
	cmp	r3, #0
	mov	r3, #0
	str	r9, [r5, #56]
	str	sl, [r5, #60]
	str	r3, [r7, #28]
	beq	.L369
	ldmia	r5, {r0-r1}
	ldr	r3, .L581+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L581+28
	mov	lr, pc
	bx	r3
	ldr	r9, .L581+32
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3145728
.L523:
	mov	lr, pc
	bx	r9
	ldr	fp, [r5, #20]
	ldr	ip, [r5, #32]
	ldr	sl, [sp, #44]
	add	lr, ip, fp
	stmia	r5, {r0-r1}
	ldr	r6, [sl, #0]
	ldr	r5, [r5, #16]
	str	lr, [sp, #32]
	b	.L367
.L350:
	ldr	r3, [r7, #32]
	cmp	r3, #0
	ldr	lr, .L581+36
	beq	.L351
	ldr	ip, [r4, #32]
	ldr	fp, [sp, #4]
	add	ip, r2, ip
	mla	r3, fp, r6, r6
	b	.L349
.L414:
	ldr	ip, .L581+40
	ldr	r6, [ip, #0]
	str	ip, [sp, #44]
	add	r0, r5, #1
	sub	ip, r2, #1
	mla	r3, r6, r0, ip
	ldr	r8, .L581+44
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldreq	r1, [r4, #36]
	beq	.L416
	ldr	r1, [r4, #36]
	add	lr, r5, r1
	mla	r3, lr, r6, r6
	add	r3, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L416
	add	r3, r1, r1, lsr #31
	add	r3, r5, r3, asr #1
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L416
	add	r3, r5, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L416
	sub	r3, lr, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L416
	mov	r3, #0
	ldr	r5, .L581+48
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #1
	movne	r3, fp
	tst	r3, #255
	bne	.L417
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	r3, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	lr, .L581+52
	strne	lr, [sp, #0]
	bne	.L419
	ldr	r0, .L581+52
	mov	r3, #1069547520
	str	r0, [sp, #0]
	mov	r1, sl
	mov	r0, r9
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L581+52
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L419:
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	adr	r3, .L583
	ldmia	r3, {r2-r3}
	ldr	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #20]
	add	r0, r5, #1
.L416:
	cmp	r1, #0
	ble	.L423
	ldr	ip, [r4, #16]
	mov	r3, #0
	b	.L425
.L488:
	mov	r5, ip
.L425:
	add	r0, r3, r5
	mla	r0, r6, r0, r2
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	addeq	r5, r5, #1
	add	r3, r3, #1
	moveq	ip, r5
	cmp	r3, r1
	bne	.L488
	b	.L530
.L364:
	ldr	fp, [r7, #28]
	cmp	fp, #2
	beq	.L572
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3670016
	str	r2, [r4, #56]
	str	r3, [r4, #60]
	ldmia	r4, {r0-r1}
	ldr	sl, .L583+8
	mov	lr, pc
	bx	sl
	ldr	r2, [r4, #36]
	add	sl, fp, #1
	ldr	r3, .L583+12
	ldr	fp, [sp, #4]
	add	r2, r5, r2
	str	sl, [r3, #28]
	stmia	r4, {r0-r1}
	mla	r3, fp, r6, r6
	str	r2, [sp, #4]
	b	.L363
.L369:
	ldr	r0, .L583+8
	mov	r3, #1069547520
	str	r0, [sp, #0]
	mov	r2, #0
	add	r3, r3, #3145728
	ldmia	r5, {r0-r1}
	ldr	r9, [sp, #0]
	mov	lr, pc
	bx	r9
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3145728
	b	.L523
.L326:
	ldr	r3, .L583+12
	ldr	r3, [r3, #28]
	cmp	r3, #0
	beq	.L573
	ldr	ip, .L583+16
	ldr	r6, [ip, #0]
	str	ip, [sp, #44]
	add	r0, r5, #1
	sub	ip, r2, #1
	mla	r3, r6, r0, ip
	ldr	r8, .L583+24
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldreq	r1, [r4, #36]
	beq	.L329
	ldr	r1, [r4, #36]
	add	lr, r5, r1
	mla	r3, lr, r6, r6
	add	r3, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L329
	add	r3, r1, r1, lsr #31
	add	r3, r5, r3, asr #1
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L329
	add	r3, r5, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L329
	sub	r3, lr, #4
	mla	r3, r6, r3, ip
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L329
	mov	r3, #0
	ldr	r5, .L583+28
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	mov	r3, #1
	movne	r3, fp
	tst	r3, #255
	bne	.L330
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	r3, #0
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	lr, .L583+8
	strne	lr, [sp, #0]
	bne	.L332
	ldr	r0, .L583+8
	mov	r3, #1069547520
	str	r0, [sp, #0]
	mov	r1, sl
	mov	r0, r9
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L583+8
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L332:
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	adr	r3, .L583
	ldmia	r3, {r2-r3}
	ldr	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	ldr	r1, [r4, #36]
	ldr	r2, [r4, #20]
	add	r0, r5, #1
.L329:
	cmp	r1, #0
	ble	.L336
	ldr	ip, [r4, #16]
	mov	r3, #0
	b	.L338
.L486:
	mov	r5, ip
.L338:
	add	r0, r3, r5
	mla	r0, r6, r0, r2
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	addeq	r5, r5, #1
	add	r3, r3, #1
	moveq	ip, r5
	cmp	r3, r1
	bne	.L486
	b	.L529
.L351:
	ldr	r3, [lr, #28]
	cmp	r3, #0
	beq	.L574
	ldr	r9, [r4, #32]
	add	ip, r2, r9
	add	sl, ip, #1
	add	r0, sl, r0
	mov	r0, r0, asl #1
	ldrh	r3, [r8, r0]
	cmp	r3, #0
	ldr	fp, .L583+24
	bne	.L353
	ldr	r0, [sp, #4]
	mla	r3, r0, r6, r6
.L354:
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	ldr	r6, [lr, #0]
	ldr	r1, .L583+20
	mov	lr, #1
	mla	r0, r5, r6, r6
	str	lr, [r1, #0]
	b	.L349
.L571:
	mla	r3, r9, r6, r6
.L441:
	ldr	lr, [sp, #44]
	ldr	r5, [r4, #16]
	ldr	r6, [lr, #0]
	ldr	r1, .L583+20
	mov	lr, #1
	mla	r0, r5, r6, r6
	str	lr, [r1, #0]
	b	.L436
.L566:
	add	r3, r9, r2, asl #1
	ldrh	r3, [r3, #8]
	cmp	r3, #0
	beq	.L366
	ldr	lr, [sp, #52]
	add	r3, r9, lr, asl #1
	ldrh	r3, [r3, #-8]
	cmp	r3, #0
	bne	.L367
	b	.L366
.L584:
	.align	3
.L583:
	.word	1202590843
	.word	1067743969
	.word	__aeabi_dsub
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	direction
	.word	collisionMap1Bitmap
	.word	__aeabi_dcmpeq
	.word	wolf
	.word	__aeabi_i2d
	.word	__aeabi_dadd
.L565:
	ldr	fp, [r4, #32]
	add	ip, r2, fp
	add	lr, ip, #1
	add	r0, lr, r0
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L583+24
	beq	.L342
	ldr	r9, [sp, #4]
	sub	r0, r9, #1
	mla	r0, r6, r0, lr
	mov	r0, r0, asl #1
	ldrh	r0, [sl, r0]
	cmp	r0, #0
	beq	.L342
	add	r1, r1, r1, lsr #31
	add	r1, r5, r1, asr #1
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L342
	add	r1, r5, #4
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L342
	sub	r1, r9, #4
	mla	r1, r6, r1, lr
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L342
	add	sl, r3, #16
	ldmia	sl, {r9-sl}
	mov	r3, #1073741824
	ldr	r5, .L583+28
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #7405568
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L513
	ldr	ip, .L583+32
	ldr	r3, .L583+36
	rsb	r0, fp, #240
	add	sl, ip, #8
	ldmia	sl, {r9-sl}
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L345
	mov	r3, #1069547520
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L583+40
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L345:
	adr	r3, .L585
	ldmia	r3, {r2-r3}
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	ldr	fp, .L585+52
	mov	lr, pc
	bx	fp
	ldr	r9, [r4, #16]
	ldr	r3, [r4, #36]
	ldr	lr, [sp, #44]
	ldr	r2, [r4, #20]
	ldr	ip, [r4, #32]
	add	r3, r9, r3
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	ldr	r6, [lr, #0]
	str	r3, [sp, #4]
	add	ip, r2, ip
.L342:
	ldr	r0, [sp, #44]
	ldr	r5, [r4, #16]
	ldr	r1, [r0, #0]
	ldr	r9, [sp, #4]
	ldr	r0, .L585+16
	mov	lr, #1
	mla	r3, r9, r6, r6
	str	lr, [r0, #0]
	mov	r6, r1
	mla	r0, r5, r1, r1
	b	.L349
.L570:
	add	r2, r2, r2, lsr #31
	add	r2, r9, r2, asr #1
	mla	r2, r6, r2, r5
	mov	r2, r2, asl #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L482
	b	.L481
.L573:
	ldr	r9, .L585+20
	ldr	r1, [r4, #36]
	str	r9, [sp, #44]
	add	r0, r5, #1
	ldr	r6, [r9, #0]
	ldr	r8, .L585+24
	b	.L324
.L574:
	ldr	ip, [r4, #32]
	ldr	lr, [sp, #4]
	add	ip, r2, ip
	mla	r3, lr, r6, r6
	b	.L349
.L569:
	mov	r1, #2272
	mov	r2, #11008
	ldr	r0, .L585+28
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r4, #16]
	ldr	r2, [r6, #0]
	mla	r6, r3, r2, r2
	ldr	r5, [r4, #20]
	sub	r1, r5, #1
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	ip, .L585+44
	ldr	r0, .L585+32
	bne	.L464
	ldr	lr, [ip, #36]
	add	sl, r3, lr
	sub	sl, sl, #1
	mla	sl, r2, sl, r1
	mov	sl, sl, asl #1
	ldrh	sl, [r0, sl]
	cmp	sl, #0
	bne	.L464
	add	lr, lr, lr, lsr #31
	add	lr, r3, lr, asr #1
	mla	r1, r2, lr, r1
	mov	r1, r1, asl #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	bne	.L464
.L548:
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #3670016
	ldr	r0, .L585+36
	str	r2, [ip, #56]
	str	r3, [ip, #60]
	str	r0, [sp, #0]
.L465:
	ldmia	r4, {r0-r1}
	ldr	ip, [sp, #0]
	b	.L534
.L568:
	ldr	r0, .L585+44
	ldr	r1, [r0, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L392
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L392
	ldr	r2, .L585+44
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	add	r3, r3, #1048576
	mov	r2, #0
	ldr	ip, .L585+52
	mov	lr, pc
	bx	ip
	ldr	lr, .L585+44
	str	r0, [lr, #8]
	str	r1, [lr, #12]
	b	.L393
.L394:
	add	r3, r5, #2
	add	r2, r3, sl
	mov	r2, r2, asl #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	ldr	r2, .L585+24
	beq	.L393
	ldr	r1, [r4, #36]
	add	r0, r9, r1
	sub	r0, r0, #1
	mla	r0, r6, r0, r3
	mov	r0, r0, asl #1
	ldrh	r0, [r2, r0]
	cmp	r0, #0
	beq	.L393
	add	r1, r1, r1, lsr #31
	add	r1, r9, r1, asr #1
	mla	r3, r6, r1, r3
	mov	r3, r3, asl #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L393
	ldr	r2, .L585+44
	mov	r3, #1073741824
	add	r1, r2, #8
	ldmia	r1, {r0-r1}
	ldr	ip, .L585+52
	mov	r2, #0
	mov	lr, pc
	bx	ip
	ldr	lr, .L585+44
	str	r0, [lr, #8]
	str	r1, [lr, #12]
	b	.L393
.L532:
	mov	r1, #2272
	mov	r2, #11008
	add	r1, r1, #5
	add	r2, r2, #17
	ldr	r0, .L585+28
	bl	playSoundB
	ldr	r3, [r5, #56]
	mov	r2, #1069547520
	add	r3, r3, #1
	mov	r1, #0
	add	r2, r2, #3670016
	cmp	r3, #5
	str	r1, [r4, #56]
	str	r2, [r4, #60]
	str	r3, [r5, #56]
	moveq	r3, #0
	streq	r3, [r5, #32]
	streq	r3, [r5, #52]
	streq	r3, [r5, #56]
	b	.L376
.L464:
	sub	r1, r5, #4
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L585+32
	beq	.L466
	ldr	r0, [r4, #36]
	add	r9, r3, r0
	sub	r9, r9, #1
	mul	r9, r2, r9
	add	ip, r9, r1
	mov	ip, ip, asl #1
	ldrh	ip, [sl, ip]
	cmp	ip, #0
	ldr	ip, .L585+44
	beq	.L466
	add	r0, r0, r0, lsr #31
	add	r0, r3, r0, asr #1
	mul	fp, r2, r0
	add	r1, fp, r1
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L466
.L557:
	ldr	r2, .L585+36
	str	r2, [sp, #0]
	add	r1, ip, #8
	ldmia	r1, {r0-r1}
	mov	r3, #1073741824
	str	ip, [sp, #12]
	ldr	r8, [sp, #0]
	mov	r2, #0
	add	r3, r3, #1048576
.L544:
	mov	lr, pc
	bx	r8
	add	r3, r6, r5
	mov	r3, r3, asl #1
	ldrh	r3, [sl, r3]
	ldr	ip, [sp, #12]
	cmp	r3, #0
	str	r0, [ip, #8]
	str	r1, [ip, #12]
	beq	.L475
	add	r3, r9, r5
	mov	r3, r3, asl #1
	ldrh	r3, [sl, r3]
	cmp	r3, #0
	beq	.L475
	add	r3, fp, r5
	mov	r3, r3, asl #1
	ldrh	r3, [sl, r3]
	cmp	r3, #0
	bne	.L476
.L475:
	add	r5, r5, #20
	str	r5, [r4, #20]
.L476:
	adr	r3, .L585+8
	ldmia	r3, {r2-r3}
	str	r2, [r4, #56]
	str	r3, [r4, #60]
	b	.L465
.L586:
	.align	3
.L585:
	.word	1202590843
	.word	1067743969
	.word	858993459
	.word	1070805811
	.word	direction
	.word	.LANCHOR1
	.word	collisionMap1Bitmap
	.word	injuredGrunt
	.word	collisionMap2Bitmap
	.word	__aeabi_dsub
	.word	__aeabi_dcmpeq
	.word	wolf
	.word	__aeabi_i2d
	.word	__aeabi_dadd
.L466:
	sub	r1, r5, #3
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L585+32
	beq	.L469
	ldr	r0, [r4, #36]
	add	r9, r3, r0
	sub	r9, r9, #1
	mul	r9, r2, r9
	add	ip, r9, r1
	mov	ip, ip, asl #1
	ldrh	ip, [sl, ip]
	cmp	ip, #0
	ldr	ip, .L585+44
	beq	.L469
	add	r0, r0, r0, lsr #31
	add	r0, r3, r0, asr #1
	mul	fp, r2, r0
	add	r1, fp, r1
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	beq	.L469
.L556:
	ldr	lr, .L585+36
	mov	r3, #1073741824
	add	r1, ip, #8
	ldmia	r1, {r0-r1}
	str	lr, [sp, #0]
	mov	r2, #0
	add	r3, r3, #524288
	str	ip, [sp, #12]
	mov	r8, lr
	b	.L544
.L572:
	ldr	r2, [r4, #36]
	ldr	r9, [sp, #4]
	add	r2, r5, r2
	mla	r3, r9, r6, r6
	str	r2, [sp, #4]
	b	.L363
.L469:
	sub	r1, r5, #2
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	r8, .L585+32
	bne	.L472
.L547:
	ldr	r9, .L585+36
	add	r3, r4, #56
	ldmia	r3, {r2-r3}
	str	r9, [sp, #0]
	b	.L465
.L353:
	ldr	r0, [sp, #4]
	mla	r3, r0, r6, r6
	add	r0, r3, sl
	mov	r0, r0, asl #1
	ldrh	r0, [fp, r0]
	cmp	r0, #0
	beq	.L354
	add	r1, r1, r1, lsr #31
	add	r1, r5, r1, asr #1
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L354
	add	r1, r5, #4
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L354
	ldr	r0, [sp, #4]
	sub	r1, r0, #4
	mla	r1, r6, r1, sl
	mov	r1, r1, asl #1
	ldrh	r1, [fp, r1]
	cmp	r1, #0
	beq	.L354
	add	fp, lr, #16
	ldmia	fp, {sl-fp}
	mov	r3, #1073741824
	ldr	r5, .L585+40
	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	add	r3, r3, #7405568
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L515
	ldr	r1, .L585+44
	ldr	r3, .L585+48
	rsb	r0, r9, #240
	add	fp, r1, #8
	ldmia	fp, {sl-fp}
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L357
	mov	r3, #1069547520
	mov	r0, sl
	mov	r1, fp
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L585+52
	mov	lr, pc
	bx	r9
	str	r0, [r4, #8]
	str	r1, [r4, #12]
.L357:
	adr	r3, .L587
	ldmia	r3, {r2-r3}
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	ldr	fp, .L587+28
	mov	lr, pc
	bx	fp
	ldr	ip, [sp, #44]
	ldr	r9, [r4, #16]
	ldr	r2, [r4, #36]
	ldr	r3, [ip, #0]
	add	r2, r9, r2
	str	r2, [sp, #4]
	mla	r3, r2, r3, r3
	ldr	ip, [r4, #32]
	ldr	r2, [r4, #20]
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	add	ip, r2, ip
	b	.L354
.L567:
	mov	r1, #2272
	mov	r2, #11008
	ldr	r0, .L587+8
	add	r1, r1, #5
	add	r2, r2, #17
	bl	playSoundB
	ldr	r3, [r4, #16]
	ldr	r2, [r6, #0]
	mla	r6, r3, r2, r2
	ldr	r5, [r4, #20]
	sub	r1, r5, #1
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	ip, .L587+36
	ldr	r0, .L587+12
	bne	.L378
	ldr	lr, [ip, #36]
	add	sl, r3, lr
	sub	sl, sl, #1
	mla	sl, r2, sl, r1
	mov	sl, sl, asl #1
	ldrh	sl, [r0, sl]
	cmp	sl, #0
	bne	.L378
	add	lr, lr, lr, lsr #31
	add	lr, r3, lr, asr #1
	mla	r1, r2, lr, r1
	mov	r1, r1, asl #1
	ldrh	r1, [r0, r1]
	cmp	r1, #0
	beq	.L548
.L378:
	sub	r1, r5, #4
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L587+12
	beq	.L380
	ldr	r0, [r4, #36]
	add	r9, r3, r0
	sub	r9, r9, #1
	mul	r9, r2, r9
	add	ip, r9, r1
	mov	ip, ip, asl #1
	ldrh	ip, [sl, ip]
	cmp	ip, #0
	ldr	ip, .L587+36
	beq	.L380
	add	r0, r0, r0, lsr #31
	add	r0, r3, r0, asr #1
	mul	fp, r2, r0
	add	r1, fp, r1
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	bne	.L557
.L380:
	sub	r1, r5, #3
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	sl, .L587+12
	beq	.L383
	ldr	r0, [r4, #36]
	add	r9, r3, r0
	sub	r9, r9, #1
	mul	r9, r2, r9
	add	ip, r9, r1
	mov	ip, ip, asl #1
	ldrh	ip, [sl, ip]
	cmp	ip, #0
	ldr	ip, .L587+36
	beq	.L383
	add	r0, r0, r0, lsr #31
	add	r0, r3, r0, asr #1
	mul	fp, r2, r0
	add	r1, fp, r1
	mov	r1, r1, asl #1
	ldrh	r1, [sl, r1]
	cmp	r1, #0
	bne	.L556
.L383:
	sub	r1, r5, #2
	add	r0, r6, r1
	mov	r0, r0, asl #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	ldr	r8, .L587+12
	beq	.L547
.L472:
	ldr	r0, [r4, #36]
	add	r9, r3, r0
	sub	r9, r9, #1
	mul	r9, r2, r9
	add	ip, r9, r1
	mov	ip, ip, asl #1
	ldrh	ip, [r8, ip]
	cmp	ip, #0
	ldr	sl, .L587+36
	addeq	r3, sl, #56
	ldmeqia	r3, {r2-r3}
	ldreq	sl, .L587+32
	streq	sl, [sp, #0]
	beq	.L465
.L473:
	add	r0, r0, r0, lsr #31
	add	r3, r3, r0, asr #1
	mul	ip, r2, r3
	add	r3, ip, r1
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	ldreq	fp, .L587+32
	addeq	r3, sl, #56
	ldmeqia	r3, {r2-r3}
	streq	fp, [sp, #0]
	beq	.L465
.L474:
	ldr	lr, .L587+32
	add	r1, sl, #8
	ldmia	r1, {r0-r1}
	mov	r3, #1073741824
	str	ip, [sp, #12]
	str	lr, [sp, #0]
	mov	r2, #0
	mov	fp, lr
	mov	lr, pc
	bx	fp
	add	r3, r6, r5
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	str	r0, [sl, #8]
	str	r1, [sl, #12]
	ldr	ip, [sp, #12]
	beq	.L475
	add	r3, r9, r5
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L475
	add	r3, ip, r5
	mov	r3, r3, asl #1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	bne	.L476
	b	.L475
.L519:
	add	fp, fp, fp, lsr #31
	mov	r0, fp, asr #1
	ldr	r3, .L587+20
	rsb	r0, r0, #120
	mov	lr, pc
	bx	r3
	ldr	fp, .L587+36
	add	r6, fp, #8
	ldmia	r6, {r5-r6}
	mov	r2, r0
	mov	r3, r1
	mov	r0, r5
	mov	r1, r6
	ldr	ip, .L587+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L520
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	mov	r0, r9
	ldr	ip, .L587+28
	mov	r1, sl
	mov	lr, pc
	bx	ip
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	ldr	r9, .L587+28
	mov	lr, pc
	bx	r9
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L432
.L402:
	ldr	r3, [r4, #32]
	add	r3, r3, r3, lsr #31
	mov	r0, r3, asr #1
	rsb	r0, r0, #120
	ldr	r3, .L587+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L517
	ldr	sl, .L587+32
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	str	sl, [sp, #0]
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	sl
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	sl
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L404
.L588:
	.align	3
.L587:
	.word	1202590843
	.word	1067743969
	.word	injuredGrunt
	.word	collisionMap1Bitmap
	.word	__aeabi_dcmple
	.word	__aeabi_i2d
	.word	__aeabi_dcmpge
	.word	__aeabi_dadd
	.word	__aeabi_dsub
	.word	wolf
.L417:
	ldr	r3, [r4, #32]
	add	r3, r3, r3, lsr #31
	mov	r0, r3, asr #1
	rsb	r0, r0, #120
	ldr	r3, .L587+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L518
	ldr	sl, .L587+32
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	str	sl, [sp, #0]
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	sl
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	sl
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L419
.L521:
	ldr	ip, [sp, #32]
	add	r0, ip, ip, lsr #31
	ldr	lr, .L587+36
	mov	r0, r0, asr #1
	ldr	r3, .L587+20
	rsb	r0, r0, #120
	add	r6, lr, #8
	ldmia	r6, {r5-r6}
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+24
	mov	r2, r0
	mov	r3, r1
	mov	r0, r5
	mov	r1, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L522
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L587+28
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	r9
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	r9
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L444
.L520:
	mov	r3, #1069547520
	mov	r0, r5
	mov	r1, r6
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	sl, .L587+28
	mov	lr, pc
	bx	sl
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L432
.L517:
	ldr	fp, .L587+32
	mov	r3, #1069547520
	add	r3, r3, #2097152
	str	fp, [sp, #0]
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	lr, pc
	bx	fp
	ldr	r3, .L587+36
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	b	.L404
.L522:
	mov	r3, #1069547520
	mov	r0, r5
	mov	r1, r6
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	sl, .L587+28
	mov	lr, pc
	bx	sl
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L444
.L518:
	ldr	fp, .L587+32
	mov	r3, #1069547520
	add	r3, r3, #2097152
	str	fp, [sp, #0]
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	lr, pc
	bx	fp
	ldr	r3, .L587+36
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	b	.L419
.L515:
	add	r0, r9, r9, lsr #31
	ldr	ip, .L587+36
	mov	r0, r0, asr #1
	ldr	r3, .L587+20
	rsb	r0, r0, #120
	add	r6, ip, #8
	ldmia	r6, {r5-r6}
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+24
	mov	r2, r0
	mov	r3, r1
	mov	r0, r5
	mov	r1, r6
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L516
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	r9, .L587+28
	mov	r0, sl
	mov	r1, fp
	mov	lr, pc
	bx	r9
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	r9
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L357
.L330:
	ldr	r3, [r4, #32]
	add	r3, r3, r3, lsr #31
	mov	r0, r3, asr #1
	rsb	r0, r0, #120
	ldr	r3, .L587+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L512
	ldr	sl, .L587+32
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	str	sl, [sp, #0]
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	sl
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	sl
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L332
.L315:
	ldr	r3, [r4, #32]
	add	r3, r3, r3, lsr #31
	mov	r0, r3, asr #1
	rsb	r0, r0, #120
	ldr	r3, .L587+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L587+16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r9
	mov	r1, sl
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L511
	ldr	sl, .L587+32
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	str	sl, [sp, #0]
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	sl
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	mov	lr, pc
	bx	sl
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L317
.L513:
	add	fp, fp, fp, lsr #31
	mov	r0, fp, asr #1
	ldr	r3, .L587+20
	rsb	r0, r0, #120
	mov	lr, pc
	bx	r3
	ldr	fp, .L587+36
	add	r6, fp, #8
	ldmia	r6, {r5-r6}
	mov	r2, r0
	mov	r3, r1
	mov	r0, r5
	mov	r1, r6
	ldr	ip, .L587+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L514
	mov	r3, #1069547520
	mov	r2, #0
	add	r3, r3, #2097152
	mov	r0, r9
	ldr	ip, .L587+28
	mov	r1, sl
	mov	lr, pc
	bx	ip
	mov	r3, #1069547520
	str	r0, [r7, #16]
	str	r1, [r7, #20]
	mov	r2, #0
	add	r1, r7, #40
	ldmia	r1, {r0-r1}
	add	r3, r3, #2097152
	ldr	r9, .L587+28
	mov	lr, pc
	bx	r9
	str	r0, [r7, #40]
	str	r1, [r7, #44]
	b	.L345
.L511:
	ldr	fp, .L587+32
	mov	r3, #1069547520
	add	r3, r3, #2097152
	str	fp, [sp, #0]
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	lr, pc
	bx	fp
	ldr	r3, .L587+36
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	b	.L317
.L514:
	mov	r3, #1069547520
	mov	r0, r5
	mov	r1, r6
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	sl, .L587+28
	mov	lr, pc
	bx	sl
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L345
.L516:
	mov	r3, #1069547520
	mov	r0, r5
	mov	r1, r6
	mov	r2, #0
	add	r3, r3, #2097152
	ldr	sl, .L587+28
	mov	lr, pc
	bx	sl
	str	r0, [r4, #8]
	str	r1, [r4, #12]
	b	.L357
.L512:
	ldr	fp, .L587+32
	mov	r3, #1069547520
	add	r3, r3, #2097152
	str	fp, [sp, #0]
	mov	r0, r9
	mov	r1, sl
	mov	r2, #0
	mov	lr, pc
	bx	fp
	ldr	r3, .L587+36
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	b	.L332
	.size	werewolf, .-werewolf
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r4, .L602
	ldr	r6, .L602+4
	add	r1, r4, #16
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r5, #67108864
	mov	r3, r3, lsr #16
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #16]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r4, #40
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r4, #64
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #20]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, r0, asl #16
	mov	ip, r0, lsr #16
	mov	r2, #100663296
	strh	ip, [r5, #22]	@ movhi
	mov	r0, #3
	ldr	r1, .L602+8
	add	r2, r2, #65536
	mov	r3, #16384
	ldr	r6, .L602+12
	mov	lr, pc
	bx	r6
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L602+16
	add	r2, r2, #512
	mov	r0, #3
	mov	lr, pc
	bx	r6
	bl	werewolf
	mov	r0, #0
	bl	knight
	mov	r0, #1
	bl	knight
	mov	r0, #2
	bl	knight
	ldr	r5, .L602+20
	mov	r0, #3
	bl	knight
	mov	r0, #4
	bl	knight
	bl	doorPlacement
	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	.L600
.L590:
	ldr	r7, .L602+24
	bl	updateOAM
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L602+28
	mov	r2, #117440512
	mov	lr, pc
	bx	r6
	ldr	r3, [r7, #0]
	tst	r3, #512
	beq	.L591
	ldr	r2, .L602+32
	ldr	r2, [r2, #0]
	ands	r2, r2, #512
	beq	.L601
.L591:
	tst	r3, #4
	beq	.L593
	ldr	r3, .L602+32
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L593
	mov	r1, #67108864
	mov	r0, #256	@ movhi
	ldr	r2, .L602+28
	strh	r0, [r1, #0]	@ movhi
.L594:
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L594
	mov	ip, #67108864
	mov	r4, #0	@ movhi
	strh	r4, [ip, #16]	@ movhi
	ldr	r4, .L602+36
	mov	lr, #23296
	mov	r5, #4
	str	r5, [r4, #0]
	add	lr, lr, #128
	mov	r4, #0	@ movhi
	strh	r4, [ip, #18]	@ movhi
	mov	r0, #3
	ldr	r1, .L602+40
	mov	r2, #100663296
	mov	r3, #0
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	add	r2, r2, #55296
	mov	r3, #0
	mov	r0, #3
	ldr	r1, .L602+44
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #2]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #6]	@ movhi
.L593:
	ldr	r3, .L602+48
	add	r1, r3, #480
.L596:
	ldr	r2, [r3, #56]
	cmp	r2, #0
	streq	r2, [r3, #16]
	streq	r2, [r3, #20]
	add	r3, r3, #96
	cmp	r3, r1
	bne	.L596
	ldr	r2, .L602+52
	ldr	r3, .L602+56
	ldr	r0, [r2, #20]
	ldr	r1, [r3, #20]
	cmp	r0, r1
	ble	.L589
	ldr	r4, [r2, #32]
	ldr	ip, [r3, #32]
	add	r0, r0, r4
	add	r1, r1, ip
	cmp	r0, r1
	bge	.L589
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	ble	.L589
	ldr	r3, [r7, #0]
	tst	r3, #64
	beq	.L589
	ldr	r3, .L602+32
	ldr	r3, [r3, #0]
	tst	r3, #64
	bne	.L589
	bl	initialize2
	mov	r5, #67108864
	mov	lr, #4864	@ movhi
	strh	lr, [r5, #0]	@ movhi
	mov	ip, #23296
	ldr	lr, .L602+36
	mov	r4, #3
	add	ip, ip, #128
	mov	r3, #11136
	str	r4, [lr, #0]
	ldr	r1, .L602+60
	strh	ip, [r5, #8]	@ movhi
	mov	r2, #100663296
	add	r3, r3, #32
	mov	r0, r4
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, r4
	ldr	r1, .L602+64
	add	r2, r2, #55296
	mov	r3, #2048
	mov	lr, pc
	bx	r6
	mov	ip, #24064
	add	ip, ip, #140
	mov	r2, #100663296
	ldr	r1, .L602+68
	add	r2, r2, #49152
	mov	r3, #1152
	mov	r0, r4
	strh	ip, [r5, #10]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r0, r4
	ldr	r1, .L602+72
	add	r2, r2, #61440
	mov	r3, #2048
	mov	lr, pc
	bx	r6
.L589:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L601:
	ldr	r1, [r5, #0]
	cmp	r1, #0
	ldr	r1, .L602+20
	moveq	r2, #1
	streq	r2, [r1, #0]
	moveq	r2, #5
	streq	r2, [r4, #36]
	strne	r2, [r1, #0]
	strne	r2, [r4, #36]
	b	.L591
.L600:
	bl	healthbar
	b	.L590
.L603:
	.align	2
.L602:
	.word	.LANCHOR0
	.word	__aeabi_d2uiz
	.word	spriteSheetTiles
	.word	DMANow
	.word	spriteSheetPal
	.word	cheat
	.word	oldButtons
	.word	shadowOAM
	.word	buttons
	.word	state
	.word	pauseTiles
	.word	pauseMap
	.word	Knight
	.word	wolf
	.word	door
	.word	level2BackgroundTiles
	.word	level2BackgroundMap
	.word	background2Tiles
	.word	background2Map
	.size	game, .-game
	.align	2
	.global	game2
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L619
	ldr	r6, .L619+4
	add	r1, r4, #16
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r5, #67108864
	mov	r3, r3, lsr #16
	add	r1, r4, #8
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #16]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r4, #40
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #18]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r3, r0, asl #16
	mov	r3, r3, lsr #16
	add	r1, r4, #64
	ldmia	r1, {r0-r1}
	strh	r3, [r5, #20]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r0, r0, asl #16
	mov	ip, r0, lsr #16
	mov	r2, #100663296
	strh	ip, [r5, #22]	@ movhi
	mov	r0, #3
	ldr	r1, .L619+8
	add	r2, r2, #65536
	mov	r3, #16384
	ldr	r6, .L619+12
	mov	lr, pc
	bx	r6
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L619+16
	add	r2, r2, #512
	mov	r0, #3
	mov	lr, pc
	bx	r6
	bl	werewolf
	mov	r0, #0
	bl	knight
	mov	r0, #1
	bl	knight
	mov	r0, #2
	bl	knight
	ldr	r5, .L619+20
	mov	r0, #3
	bl	knight
	mov	r0, #4
	bl	knight
	bl	doorPlacement
	ldr	r3, [r5, #0]
	cmp	r3, #0
	beq	.L617
.L605:
	ldr	r7, .L619+24
	bl	updateOAM
	mov	r3, #512
	mov	r0, #3
	ldr	r1, .L619+28
	mov	r2, #117440512
	mov	lr, pc
	bx	r6
	ldr	r3, [r7, #0]
	tst	r3, #512
	beq	.L606
	ldr	r2, .L619+32
	ldr	r2, [r2, #0]
	ands	r2, r2, #512
	beq	.L618
.L606:
	tst	r3, #4
	beq	.L608
	ldr	r3, .L619+32
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L608
	mov	r1, #67108864
	mov	r0, #256	@ movhi
	ldr	r2, .L619+28
	strh	r0, [r1, #0]	@ movhi
.L609:
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L609
	mov	ip, #67108864
	mov	r4, #0	@ movhi
	strh	r4, [ip, #16]	@ movhi
	ldr	r4, .L619+36
	mov	lr, #23296
	mov	r5, #4
	str	r5, [r4, #0]
	add	lr, lr, #128
	mov	r4, #0	@ movhi
	strh	r4, [ip, #18]	@ movhi
	mov	r0, #3
	ldr	r1, .L619+40
	mov	r2, #100663296
	mov	r3, #0
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	add	r2, r2, #55296
	mov	r3, #0
	mov	r0, #3
	ldr	r1, .L619+44
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #2]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #6]	@ movhi
.L608:
	ldr	r3, .L619+48
	add	r1, r3, #480
.L611:
	ldr	r2, [r3, #56]
	cmp	r2, #0
	streq	r2, [r3, #16]
	streq	r2, [r3, #20]
	add	r3, r3, #96
	cmp	r3, r1
	bne	.L611
	ldr	r2, .L619+52
	ldr	r3, .L619+56
	ldr	r0, [r2, #20]
	ldr	r1, [r3, #20]
	cmp	r0, r1
	ble	.L604
	ldr	r4, [r2, #32]
	ldr	ip, [r3, #32]
	add	r0, r0, r4
	add	r1, r1, ip
	cmp	r0, r1
	bge	.L604
	ldr	r2, [r2, #16]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	ble	.L604
	ldr	r3, [r7, #0]
	tst	r3, #64
	beq	.L604
	ldr	r3, .L619+32
	ldr	r3, [r3, #0]
	ands	r3, r3, #64
	bne	.L604
	mov	r1, #67108864
	mov	r0, #256	@ movhi
	ldr	r2, .L619+28
	strh	r0, [r1, #0]	@ movhi
.L613:
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L613
	ldr	r5, .L619+36
	mov	lr, #23296
	mov	r4, #0
	mov	ip, #67108864
	add	lr, lr, #128
	mov	r7, #5
	strh	r4, [ip, #16]	@ movhi
	mov	r3, r4
	str	r7, [r5, #0]
	mov	r0, #3
	strh	r4, [ip, #18]	@ movhi
	ldr	r1, .L619+60
	strh	lr, [ip, #8]	@ movhi
	mov	r2, #100663296
	mov	lr, pc
	bx	r6
	mov	r2, #100663296
	mov	r3, r4
	mov	r0, #3
	ldr	r1, .L619+64
	add	r2, r2, #55296
	mov	lr, pc
	bx	r6
	ldr	r3, .L619+68
	ldr	r3, [r3, #0]
	add	r0, r3, #12
	add	r3, r3, #24
	str	r4, [r0, #8]
	str	r4, [r3, #8]
	ldr	r3, .L619+72
	mov	r1, #74752
	str	r4, [r3, #12]
	mov	r2, #11008
	ldr	r3, .L619+76
	ldr	r0, .L619+80
	add	r1, r1, #416
	add	r2, r2, #17
	str	r4, [r3, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	b	playSoundB
.L604:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L618:
	ldr	r1, [r5, #0]
	cmp	r1, #0
	ldr	r1, .L619+20
	moveq	r2, #1
	streq	r2, [r1, #0]
	moveq	r2, #5
	streq	r2, [r4, #36]
	strne	r2, [r1, #0]
	strne	r2, [r4, #36]
	b	.L606
.L617:
	bl	healthbar
	b	.L605
.L620:
	.align	2
.L619:
	.word	.LANCHOR0
	.word	__aeabi_d2uiz
	.word	spriteSheetTiles
	.word	DMANow
	.word	spriteSheetPal
	.word	cheat
	.word	oldButtons
	.word	shadowOAM
	.word	buttons
	.word	state
	.word	pauseTiles
	.word	pauseMap
	.word	Knight
	.word	wolf
	.word	door
	.word	winTiles
	.word	winMap
	.word	dma
	.word	soundA
	.word	soundB
	.word	winMusic
	.size	game2, .-game2
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #23296
	ldr	r4, .L635
	mov	r5, #67108864
	mov	r6, #0
	mov	r2, #4352	@ movhi
	add	r3, r3, #128
	strh	r2, [r5, #0]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	ldr	r0, .L635+4
	str	r6, [r4, #0]
	ldr	r3, .L635+8
	mov	lr, pc
	bx	r3
	ldr	r7, .L635+12
	mov	r3, r6
	mov	r0, #3
	ldr	r1, .L635+16
	mov	r2, #100663296
	mov	lr, pc
	bx	r7
	mov	r2, #100663296
	mov	r3, r6
	mov	r0, #3
	ldr	r1, .L635+20
	add	r2, r2, #55296
	mov	lr, pc
	bx	r7
	add	r0, r5, #512
	ldrh	r2, [r0, #0]
	ldr	r1, .L635+24
	mov	r3, #50331648
	add	r3, r3, #28672
	orr	r2, r2, #1
	str	r1, [r3, #4092]
	strh	r2, [r0, #0]	@ movhi
	ldrh	ip, [r5, #4]
	orr	ip, ip, #8
	strh	ip, [r5, #4]	@ movhi
	mov	r1, #905216
	mov	ip, #1	@ movhi
	mvn	r3, #1264
	strh	ip, [r0, #8]	@ movhi
	sub	r3, r3, #1
	mov	ip, #128	@ movhi
	add	r1, r1, #2112
	mov	r2, #44032
	strh	ip, [r5, #132]	@ movhi
	strh	r6, [r5, #128]	@ movhi
	ldr	r0, .L635+28
	add	r1, r1, #9
	add	r2, r2, #68
	strh	r3, [r5, #130]	@ movhi
	bl	playSoundA
	ldr	r6, .L635+32
	ldr	r7, .L635+36
.L634:
	ldr	r3, [r6, #0]
	ldr	r2, [r4, #0]
.L623:
	str	r3, [r7, #0]
	ldr	r3, [r5, #304]
	str	r3, [r6, #0]
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L623
.L631:
	.word	.L624
	.word	.L625
	.word	.L626
	.word	.L627
	.word	.L628
	.word	.L629
	.word	.L630
.L630:
	bl	lose
	b	.L634
.L629:
	bl	win
	b	.L634
.L628:
	bl	pause
	b	.L634
.L627:
	bl	game2
	b	.L634
.L626:
	bl	game
	b	.L634
.L625:
	bl	instructions
	b	.L634
.L624:
	bl	initialize
	bl	menu
	b	.L634
.L636:
	.align	2
.L635:
	.word	state
	.word	background1Pal
	.word	loadPalette
	.word	DMANow
	.word	menuTiles
	.word	menuMap
	.word	interruptHandler
	.word	menuMusic
	.word	buttons
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	muteSound
	.type	muteSound, %function
muteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0	@ movhi
	strh	r2, [r3, #132]	@ movhi
	bx	lr
	.size	muteSound, .-muteSound
	.align	2
	.global	unmuteSound
	.type	unmuteSound, %function
unmuteSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #128	@ movhi
	strh	r2, [r3, #132]	@ movhi
	bx	lr
	.size	unmuteSound, .-unmuteSound
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #2]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	bic	r2, r2, #128
	mov	r2, r2, asl #16
	mov	r2, r2, lsr #16
	strh	r2, [r3, #6]	@ movhi
	bx	lr
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r2, [r3, #2]
	orr	r2, r2, #128
	strh	r2, [r3, #2]	@ movhi
	ldrh	r2, [r3, #6]
	orr	r2, r2, #128
	strh	r2, [r3, #6]	@ movhi
	bx	lr
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L642
	ldr	r2, [r3, #0]
	mov	r3, #0
	add	r1, r2, #12
	add	r2, r2, #24
	str	r3, [r1, #8]
	str	r3, [r2, #8]
	ldr	r2, .L642+4
	str	r3, [r2, #12]
	ldr	r2, .L642+8
	str	r3, [r2, #12]
	bx	lr
.L643:
	.align	2
.L642:
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	add	r3, r2, #512
	str	r4, [sp, #-4]!
	ldrh	r0, [r2, #4]
	ldrh	ip, [r3, #0]
	mov	r1, #50331648
	ldr	r4, .L645
	add	r1, r1, #28672
	orr	ip, ip, #1
	orr	r0, r0, #8
	str	r4, [r1, #4092]
	strh	ip, [r3, #0]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	mov	r2, #1	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldmfd	sp!, {r4}
	bx	lr
.L646:
	.align	2
.L645:
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	hOff
	.global	vOff
	.global	hOffSky
	.global	vOffSky
	.global	collMapSize
	.global	doubleJump
	.global	slowerFlames
	.global	wolfDWait
	.global	damaged
	.global	moveAway
	.global	bounceLeft
	.global	bounceRight
	.global	bounceUp
	.global	damageReaction
	.global	duration
	.global	wolfPalette
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	wolf,64,8
	.comm	slashAttack,64,8
	.comm	door,64,8
	.comm	health,64,8
	.comm	moon,64,8
	.comm	Knight,480,8
	.comm	direction,4,4
	.comm	cheat,4,4
	.comm	prevGameState,4,4
	.comm	state,4,4
	.comm	soundA,28,4
	.comm	soundB,28,4
	.comm	vbCountA,4,4
	.comm	vbCountB,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	collMapSize, %object
	.size	collMapSize, 4
collMapSize:
	.word	512
	.type	bounceLeft, %object
	.size	bounceLeft, 4
bounceLeft:
	.word	1
	.type	bounceRight, %object
	.size	bounceRight, 4
bounceRight:
	.word	2
	.type	bounceUp, %object
	.size	bounceUp, 4
bounceUp:
	.word	3
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	duration, %object
	.size	duration, 4
duration:
	.space	4
	.space	4
	.type	vOff, %object
	.size	vOff, 8
vOff:
	.space	8
	.type	hOff, %object
	.size	hOff, 8
hOff:
	.space	8
	.type	slowerFlames, %object
	.size	slowerFlames, 4
slowerFlames:
	.space	4
	.type	doubleJump, %object
	.size	doubleJump, 4
doubleJump:
	.space	4
	.type	damaged, %object
	.size	damaged, 4
damaged:
	.space	4
	.type	wolfPalette, %object
	.size	wolfPalette, 4
wolfPalette:
	.space	4
	.type	hOffSky, %object
	.size	hOffSky, 8
hOffSky:
	.space	8
	.type	wolfDWait, %object
	.size	wolfDWait, 4
wolfDWait:
	.space	4
	.type	moveAway, %object
	.size	moveAway, 4
moveAway:
	.space	4
	.type	damageReaction, %object
	.size	damageReaction, 4
damageReaction:
	.space	4
	.space	4
	.type	vOffSky, %object
	.size	vOffSky, 8
vOffSky:
	.space	8
	.ident	"GCC: (devkitARM release 31) 4.5.0"
