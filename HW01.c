#include <stdio.h>

// Массив A
static int A[100];
// Массив B
static int B[100];

// Считывание данных
int GetInput() {
    // Кол-во элементов и индекс
    int n, i;
    // Считывание количества элементов
    scanf("%d", &n);
    if (n < 0 || n > 100) {
        return -1;
    }
    // Считывание массива
    for (i = 0; i < n; ++i) {
        scanf("%d", &A[i]);
    }
    return n;
}

// Получение B, n - кол-во элементов
void GetB(int n) {
    // Индекс
    int i;
    // Заполнение массива B
    for (i = 0; i < n; ++i) {
        if (A[i] > 5) {
            B[i] = A[i] + 5;
        } else if (A[i] < -5) {
            B[i] = A[i] - 5;
        } else {
            B[i] = 0;
        }
    }
}

// Вывод результата
void Print(int n) {
    // Индекс
    int i;
    // Вывод массива B
    for (i = 0; i < n; ++i) {
        printf("%d\n", B[i]);
    }
}

int main(int argc, char** argv) {
    // Кол-во элементов
    int n = GetInput();
    // Проверка на корректность
    if (n == -1) {
        printf("%s", "strange input\n");
        return 0;
    }
    // Получение B, n - кол-во элементов
    GetB(n);
    // Вывод результата
    Print(n);
    return 0;
}#include <stdio.h>

// Массив A
static int A[100];
// Массив B
static int B[100];

// Считывание данных
int GetInput() {
    // Кол-во элементов и индекс
    int n, i;
    // Считывание количества элементов
    scanf("%d", &n);
    if (n < 0 || n > 100) {
        return -1;
    }
    // Считывание массива
    for (i = 0; i < n; ++i) {
        scanf("%d", &A[i]);
    }
    return n;
}

// Получение B, n - кол-во элементов
void GetB(int n) {
    // Индекс
    int i;
    // Заполнение массива B
    for (i = 0; i < n; ++i) {
        if (A[i] > 5) {
            B[i] = A[i] + 5;
        } else if (A[i] < -5) {
            B[i] = A[i] - 5;
        } else {
            B[i] = 0;
        }
    }
}

// Вывод результата
void Print(int n) {
    // Индекс
    int i;
    // Вывод массива B
    for (i = 0; i < n; ++i) {
        printf("%d\n", B[i]);
    }
}

int main(int argc, char** argv) {
    // Кол-во элементов
    int n = GetInput();
    // Проверка на корректность
    if (n == -1) {
        printf("%s", "strange input\n");
        return 0;
    }
    // Получение B, n - кол-во элементов
    GetB(n);
    // Вывод результата
    Print(n);
    return 0;
}
