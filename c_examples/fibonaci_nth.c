#include <stdio.h>

int main() {
    int n;

    printf("Enter the number of Fibonacci numbers: ");
    scanf("%d", &n);

    int prev = 0, current = 1, next;
    
    if (n == 1) 
        return prev;
    
    for (int i = 1; i <= n; i++) {
        printf("%d ", current);
        next = prev + current;
   

        prev = current;
        current = next;

    }
    return 0;
}
