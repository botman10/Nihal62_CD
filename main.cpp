#include <iostream>

extern int yyparse();

int main() {
    std::cout << "Enter NIHAL instruction (e.g., NIHAL RESULT = 3, 4, 5;):\n";
    yyparse();
    return 0;
}