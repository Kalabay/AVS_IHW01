.file	"HW01.c" # Имя файла
.intel_syntax noprefix # Интел синтаксис
.text # Новая секция
.local	A # Массив A
.comm	A,400,32 # Резервируем 100 элементов по 4 байта (int)
.local	B # Массив B
.comm	B,400,32 # Резервируем 100 элементов по 4 байта (int)
.section	.rodata # Секция .rodata
.LC0:
.string	"%d" # Кладём строчку "%d"
.text # Новая секция
.globl	GetInput
.type	GetInput, @function # Функция, cчитывание данных
GetInput:
endbr64
    push	rbp # rbp -> стэк
    mov	rbp, rsp # Приравнивание
    sub	rsp, 16 # Двигаем
    lea	rax, -8[rbp] # Кладём на выделенное место на стэке
mov	rsi, rax # Приравнивание, второй аргумент, так как rax
lea	rax, .LC0[rip] # Кладём на выделенное место на стэке, первый аргумент
    mov	rdi, rax # Приравнивание
    mov	eax, 0 # Приравнивание
    call	__isoc99_scanf@PLT # Вывод
    mov	eax, DWORD PTR -8[rbp] # Приравнивание
    test	eax, eax # Проверка на 0
js	.L2
    mov	eax, DWORD PTR -8[rbp] # Приравнивание
    cmp	eax, 100 # Сравнение
    jle	.L3
.L2:
mov	eax, -1  # Приравнивание к -1
jmp	.L7
.L3:
mov	DWORD PTR -4[rbp], 0 # Приравнивание
    jmp	.L5
.L6:
mov	eax, DWORD PTR -4[rbp] # Приравнивание
    cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, A[rip] # rax = начало A
    add	rax, rdx # Сложение
    mov	rsi, rax # Приравнивание, второй аргумент, так как rax
lea	rax, .LC0[rip] # Получение %d
    mov	rdi, rax # Приравнивание
    mov	eax, 0 # Приравнивание к 0
call	__isoc99_scanf@PLT # Считывание
    add	DWORD PTR -4[rbp], 1 # i += 1
.L5:
mov	eax, DWORD PTR -8[rbp]
cmp	DWORD PTR -4[rbp], eax
    jl	.L6
    mov	eax, DWORD PTR -8[rbp] # Приравнивание
.L7:
leave # Выходим из функции
    ret
.size	GetInput, .-GetInput
.globl	GetB
.type	GetB, @function # Функция для получения B
GetB:
endbr64
    push	rbp # rbp -> стэк
    mov	rbp, rsp # Приравнивание
    mov	DWORD PTR -20[rbp], edi # Приравнивание
    mov	DWORD PTR -4[rbp], 0 # i = 0
jmp	.L9
.L13:
mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, A[rip] # rax = начало A
    mov	eax, DWORD PTR [rdx+rax] # Приравнивание с массив[i]
cmp	eax, 5 # Сравнение с 5
jle	.L10
    mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, A[rip] # rax = начало A
    mov	eax, DWORD PTR [rdx+rax] # Приравнивание с массив[i]
lea	ecx, 5[rax] # Отвечает за знак -
mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, B[rip] # rax = начало B
    mov	DWORD PTR [rdx+rax], ecx # Приравнивание с массив[i]
jmp	.L11
.L10:
mov	eax, DWORD PTR -4[rbp] # eax i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, A[rip] # rax = начало A
    mov	eax, DWORD PTR [rdx+rax] # Приравнивание с массив[i]
cmp	eax, -5 # Сравнение < -5
jge	.L12
    mov	eax, DWORD PTR -4[rbp] # eax -> i
    cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # Отвечает за знак -
lea	rax, A[rip] # rax = начало A
    mov	eax, DWORD PTR [rdx+rax] # Приравнивание с массив[i]
lea	ecx, -5[rax]
mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, B[rip] # rax = начало B
    mov	DWORD PTR [rdx+rax], ecx # Приравнивание с массив[i]
jmp	.L11
.L12:
mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe # Отвечает за знак -
lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, B[rip] # Отвечает за знак -
mov	DWORD PTR [rdx+rax], 0 # Приравнивание с массив[i]
.L11:
add	DWORD PTR -4[rbp], 1 # i += 1
.L9:
mov	eax, DWORD PTR -4[rbp] # eax = i
cmp	eax, DWORD PTR -20[rbp] # Сравнение
    jl	.L13
    nop
nop
    pop	rbp
    ret
.size	GetB, .-GetB
.section	.rodata # Секция .rodata
.LC1:
.string	"%d\n"  # Сохраняем бэк слеш + d
.text  # Новая секция
.globl	Print
.type	Print, @function # Функция вывода
Print:
endbr64
    push	rbp # rbp -> стэк
    mov	rbp, rsp    # Приравнивание
    sub	rsp, 32 # Двигаем
    mov	DWORD PTR -20[rbp], edi # Приравнивание
    mov	DWORD PTR -4[rbp], 0 # i = 0
jmp	.L15
.L16:
mov	eax, DWORD PTR -4[rbp] # eax = i
cdqe
    lea	rdx, 0[0+rax*4] # rdx = 4 * rax
lea	rax, B[rip] # rax = начало B
    mov	eax, DWORD PTR [rdx+rax] # Приравнивание с массив[i]
mov	esi, eax
lea	rax, .LC1[rip] # Для бэк слэщ n
mov	rdi, rax # Приравнивание
    mov	eax, 0 # Приравнивание к 0
call	printf@PLT # Вывод
    add	DWORD PTR -4[rbp], 1 # i += 1
.L15:
mov	eax, DWORD PTR -4[rbp] # eax = i
cmp	eax, DWORD PTR -20[rbp] # Сравнение
    jl	.L16
    nop
nop
    leave # Выходим из функции
    ret
.size	Print, .-Print
.section	.rodata # Секция .rodata
.LC2:
.string	"strange input" # Объявляем строку
.text # Новая секция
.globl	main
.type	main, @function # Просто main
main:
endbr64
    push	rbp # rbp -> стэк
    mov	rbp, rsp # Приравнивание
    sub	rsp, 32 # Двигаем
    mov	DWORD PTR -20[rbp], edi # Приравнивание
    mov	QWORD PTR -32[rbp], rsi
    mov	eax, 0 # Приравнивание к 0
call	GetInput # Вызов ввода
mov	DWORD PTR -4[rbp], eax # Приравнивание n
cmp	DWORD PTR -4[rbp], -1 # Проверка на -1
jne	.L18
    lea	rax, .LC2[rip] # Для возможного вывода
    mov	rdi, rax # Приравнивание
    call	puts@PLT
    mov	eax, 0 # для return 0
jmp	.L19
.L18:
mov	eax, DWORD PTR -4[rbp] # Приравнивание n
mov	edi, eax # Приравнивание
    call	GetB # Создание B
mov	eax, DWORD PTR -4[rbp] # Приравнивание n
mov	edi, eax # Приравнивание
    call	Print # Вызов вывода
mov	eax, 0 # Приравнивание к 0
.L19:
leave # Выходим из функции
    ret
.size	main, .-main
.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0" # Генерация от компилятора, которую можно убрать
.section	.note.GNU-stack,"",@progbits
.section	.note.gnu.property,"a"
.align 8
.long	1f - 0f
.long	4f - 1f
.long	5
0:
.string	"GNU"
1:
.align 8
.long	0xc0000002
.long	3f - 2f
2:
.long	0x3
3:
.align 8
4:
