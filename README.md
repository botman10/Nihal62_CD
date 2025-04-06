# NIHAL Mini Compiler

A simple compiler using **Flex** and **Bison** to parse and evaluate a custom instruction:  
`NIHAL RESULT = a, b, c;` → evaluates `RESULT = a² + b² - c²`

---

## 📌 Features

- Parses custom NIHAL instruction
- Generates:
  - Three-address code
  - Optimized instruction
  - Final assembly-like output
- Includes a Makefile for easy building

---

## 🗂️ Files

| File         | Purpose                          |
|--------------|----------------------------------|
| `parser.y`   | Bison grammar rules              |
| `lexer.l`    | Flex lexer rules                 |
| `main.cpp`   | Entry point for the compiler     |
| `Makefile`   | Automates build steps            |
| `input.txt`  | Sample input for testing         |

---

## 🛠️ Build & Run

### Requirements

- `g++`
- `flex`
- `bison`

### Build

```bash
make
```

### Run with input

```bash
./mycompiler < input.txt
```

### Clean

```bash
make clean
```

---

## 💡 Sample Output

```
NIHAL RESULT = 3, 4, 5;
```

```
[Three Address Code]
t1 = 3.00 * 3.00
t2 = 4.00 * 4.00
t3 = 5.00 * 5.00
t4 = t1 + t2
RESULT = t4 - t3

[Optimized Instruction]
NIHAL RESULT = 3, 4, 5

[Evaluated Result] RESULT = 0.00

[Final Code]
STORE RESULT
```


