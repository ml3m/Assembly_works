#include <stdio.h>

unsigned long long sumOfPowersOf2(int k) {
    unsigned long long sum = 0;
    unsigned long long powerOf2 = 2; // Start with 2^1

    for (int i = 1; i < k; i++) {
        sum += powerOf2;
        powerOf2 <<= 1;  // Multiply by 2 by left-shifting
    }

    return sum - 2;
}

int main() {
    int k;
    printf("Enter the value of k: ");
    scanf("%d", &k);

    unsigned long long sum = sumOfPowersOf2(k);
    printf("The sum of the first %d powers of 2 is: %llu\n", k, sum);

    return 0;
}
