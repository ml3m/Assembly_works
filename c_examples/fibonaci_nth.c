#include <stdio.h>

int fibonacciSum(int n) {
    int prev = 0, current = 1, next, sum = 0;
    
    if (n == 1) 
        return prev;
    
    for (int i = 2; i <= n; i++) {
        sum += current;
        next = prev + current;
        prev = current;
        current = next;
    }
    
    return sum; // Adding 1 because the sum includes the first Fibonacci number which is 0.
}

int main() {
    int n;
    printf("Enter the number of Fibonacci numbers: ");
    scanf("%d", &n);

    int sum = fibonacciSum(n);
    printf("Sum of the first %d Fibonacci numbers is: %d\n", n, sum);

    return 0;
}
