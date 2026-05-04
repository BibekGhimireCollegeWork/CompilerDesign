# Lab 1: C Compilation Pipeline

## sum.c — Sum of Two Numbers
```c
#include <stdio.h>
int main() {
    int a, b, sum;
    printf("Enter two numbers: ");
    scanf("%d %d", &a, &b);
    sum = a + b;
    printf("Sum = %d\n", sum);
    return 0;
}
```

## Steps

**1. Preprocessing** — Expands `#include` and `#define` into plain C code.
```bash
gcc -E sum.c -o sum.i
```

**2. Compilation** — Converts C code into Assembly language.
```bash
gcc -S sum.c -o sum.s
```

**3. Assembly** — Converts Assembly into binary machine code (object file).
```bash
gcc -c sum.c -o sum.o
```

View the symbol table of the object file:
```bash
nm sum.o
```

**4. Linking** — Links object file with system libraries to produce the final executable.
```bash
gcc sum.o -o sum
./sum
```

---

## Exercise — Area of Circle using `#define`
```c
#include <stdio.h>
#define PI 3.14159
int main() {
    float radius, area;
    printf("Enter radius: ");
    scanf("%f", &radius);
    area = PI * radius * radius;
    printf("Area = %.2f\n", area);
    return 0;
}
```
```bash
gcc area_circle.c -o area_circle
./area_circle
```