#include <stdio.h>

int main(){
    int fact = 1, n = 5;
    while (n > 1) {
        int temp = fact; // Store the current value of fact
        for (int i = 1; i < n; i++) {
            fact += temp; // Add temp to fact n-1 times
        }
        n--; // Decrement n
    }
    printf("%d", fact);
}
