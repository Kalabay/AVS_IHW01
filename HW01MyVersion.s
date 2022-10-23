.intel_syntax noprefix              # Интел синтаксис
.text                               # Новая секция
.local	A                           # Массив A
.comm	A,4 * 100,32            # 100 элементов по 4 байта (так как int)
.local	B                           # Массив B
.comm	B,4 * 100,32            # 100 элементов по 4 байта (так как int)
.section	.rodata                 # Секция .rodata
.StringD:                           # Метка для "%d"
.string	"%d"                    # Кладём строчку "%d"
.StringInput:                       # Метка для "strange input"
.string	"strange input"         # Кладём строчку "strange input"
.StringDBackN:                      # Метка для "%d\n"
.string	"%d\n"                  # Кладём строчку "%d\n"
.text                               # Новая секция
.globl	GetInput
.type	GetInput, @function         # Функция, cчитывание данных
GetInput:
push	rbp                     # rbp -> стэк
    mov	rbp, rsp                    # Приравнивание
    sub	rsp, 16                     # Двигаем
    lea	rax, -8[rbp]                # Кладём на выделенное место на стэке
mov	rsi, rax                    # Приравнивание, второй аргумент, так как rax
lea	rdi, .StringD[rip]          # Кладём на выделенное место на стэке, первый аргумент
    mov	eax, 0                      # Приравнивание
    call	scanf@PLT               # Считывание
    mov	eax, DWORD PTR -8[rbp]  # Приравнивание
    test	eax, eax                # Проверка на 0
js	.L2                         # jump по сути просто go to
mov	eax, DWORD PTR -8[rbp]  # Приравнивание
    cmp	eax, 100                    # Сравнение со 100
jle	.L3                         # jump less eq -> .L3
.L2:                            # Метка
    mov	eax, -1                     # Приравнивание k -1
jmp	.L7                         # jump по сути просто go to
.L3:                            # Метка
    mov	DWORD PTR -4[rbp], 0        # i = 0
jmp	.L5                         # jump по сути просто go to
.L6:                            # Метка
    mov	eax, DWORD PTR -4[rbp]      # eax i
cdqe                            # Отвечает за знак -
lea	rdx, 0[0+rax*4]         # rdx = 4 * rax
lea	rax, A[rip]                 # rax = начало A
    add	rax, rdx                    # Сложение
    mov	rsi, rax                    # Приравнивание, второй аргумент, так как rax
lea	rax, .StringD[rip]          # Получение %d
    mov	rdi, rax                    # Приравнивание
    mov	eax, 0                      # Приравнивание к 0
call	scanf@PLT               # Считывание
    add	DWORD PTR -4[rbp], 1    # i += 1
.L5:                            # Метка
    mov	eax, DWORD PTR -8[rbp]      # Приравнивание
    cmp	DWORD PTR -4[rbp], eax      # Сравнение
    jl	.L6                     # jump less -> .L6
    mov	eax, DWORD PTR -8[rbp]  # Приравнивание
.L7:                            # Секция .rodata
    leave                           # Выходим из функции
    ret                             # return

.globl	GetB
.type	GetB, @function             # Функция для получения B
GetB:
push	rbp                     # rbp -> стэк
    mov	rbp, rsp                    # Приравнивание
    mov	DWORD PTR -20[rbp], edi     # Приравнивание
    mov	DWORD PTR -4[rbp], 0        # i = 0
jmp	.L9                             # jump по сути просто go to
.L13:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, A[rip]                     # rax = начало A
    mov	eax, DWORD PTR [rdx+rax]        # Приравнивание с массив[i]
cmp	eax, 5                          # Сравнение с 5
jle	.L10                            # jump less eq -> .L10
    mov	eax, DWORD PTR -4[rbp]      # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, A[rip]                     # rax = начало A
    mov	eax, DWORD PTR [rdx+rax]        # Приравнивание с массив[i]
lea	ecx, 5[rax]
mov	eax, DWORD PTR -4[rbp]          # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, B[rip]                     # rax = начало B
    mov	DWORD PTR [rdx+rax], ecx        # Приравнивание с массив[i]
jmp	.L11                        # jump по сути просто go to
.L10:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, A[rip]                     # rax = начало A
    mov	eax, DWORD PTR [rdx+rax]        # Приравнивание с массив[i]
cmp	eax, -5                         # Сравнение < -5
jge	.L12                            # jump, но больше или равен
mov	eax, DWORD PTR -4[rbp]      # eax -> i
    cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, A[rip]                     # rax = начало A
    mov	eax, DWORD PTR [rdx+rax]        # Приравнивание с массив[i]
lea	ecx, -5[rax]
mov	eax, DWORD PTR -4[rbp]          # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, B[rip]                     # rax = начало B
    mov	DWORD PTR [rdx+rax], ecx        # Приравнивание с массив[i]
jmp	.L11                        # jump по сути просто go to
.L12:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, B[rip]                     # rax = начало B
    mov	DWORD PTR [rdx+rax], 0          # Приравнивание с массив[i]
.L11:                               # Метка
    add	DWORD PTR -4[rbp], 1            # i += 1
.L9:                                # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax = i
cmp	eax, DWORD PTR -20[rbp]         # Сравнение
    jl	.L13                            # jump less -> .L13
    pop	rbp
    ret                             # return
.section	.rodata                 # Секция .rodata
.text                               # Новая секция
.globl	Print
.type	Print, @function            # Функция вывода
Print:
push	rbp                     # rbp -> стэк
    mov	rbp, rsp                    # Приравнивание
    sub	rsp, 32                     # Двигаем
    mov	DWORD PTR -20[rbp], edi         # Приравнивание
    mov	DWORD PTR -4[rbp], 0        # i = 0
jmp	.L15                            # jump по сути просто go to
.L16:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax = i
cdqe                                # Отвечает за знак -
lea	rdx, 0[0+rax*4]             # rdx = 4 * rax
lea	rax, B[rip]                     # rax = начало B
    mov	esi, DWORD PTR [rdx+rax]        # Приравнивание с массив[i]
lea	rax, .StringDBackN[rip]         # Для бэк слэщ n
mov	rdi, rax                        # Приравнивание
    mov	eax, 0                          # Приравнивание k 0
call	printf@PLT                  # Вывод
    add	DWORD PTR -4[rbp], 1        # i += 1
.L15:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # eax = i
cmp	eax, DWORD PTR -20[rbp]         # Сравнение
    jl	.L16                            # jump less -> .L16
    leave                           # Выходим из функции
    ret                                 # return
.section	.rodata                 # Секция .rodata
.text                               # Новая секция
.globl	main
.type	main, @function             # Прсосто main
main:
push	rbp                         # rbp -> стэк
    mov	rbp, rsp                        # Приравнивание
    sub	rsp, 32                         # Двигаем
    mov	DWORD PTR -20[rbp], edi         # Приравнивание
    mov	QWORD PTR -32[rbp], rsi     # Приравнивание
    mov	eax, 0                      # Приравнивание k 0
call	GetInput                    # Вызов нашей функции
    mov	DWORD PTR -4[rbp], eax          # Приравнивание n
cmp	DWORD PTR -4[rbp], -1       # Проверка на -1
jne	.L18                            # Просто условие перехода после cmp
    lea	rax, .StringInput[rip]      # Для возможного вывода
    mov	rdi, rax                        # Приравнивание
    call	puts@PLT
    mov	eax, 0                      # для return 0
jmp	.L19                            # jump по сути просто go to
.L18:                               # Метка
    mov	eax, DWORD PTR -4[rbp]          # Приравнивание n
mov	edi, eax                        # Приравнивание
    call	GetB                        # Вызов нашей функции
    mov	eax, DWORD PTR -4[rbp]          # Приравнивание n
mov	edi, eax                        # Приравнивание
    call	Print                       # Вызов нашей функции
    mov	eax, 0                          # Приравнивание k 0
.L19:                               # Метка
    leave                               # Выходим из функции
    ret                             # return
