#include <stdio.h>

int seriesSum(int k) {
    int sum = 0;
    int term = 3; // First term of the series

    for (int i = 0; i < k; i++) {
        sum += term;
        printf("term{%d}:%d\n",i, term);
        term = term + term - 1; // Next term is previous term + 2 * i + 1
    }

    return sum;
}

int main() {
    int k;
    
    printf("Enter the number of terms: ");
    scanf("%d", &k);

    int result = seriesSum(k);
    printf("Sum of the series for %d terms: %d\n", k, result);

    return 0;
}
