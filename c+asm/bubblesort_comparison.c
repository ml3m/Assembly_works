#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void bubbleSort(int arr[], int n) {
    int i, j, temp;
    for (i = 0; i < n-1; i++) {
        for (j = 0; j < n-i-1; j++) {
            if (arr[j] > arr[j+1]) {
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
}

void bubbleSortAsm(int arr[], int n) {
    __asm__ (
        "mov %[n], %%ecx\n"          // Move n to ecx
        "dec %%ecx\n"                // Decrement ecx by 1 for the outer loop

        "1:\n"                       // Outer loop label
        "mov %%ecx, %%ebx\n"         // Move outer loop counter to ebx (inner loop counter)
        "mov %[arr], %%rsi\n"        // Move base address of arr to rsi

        "2:\n"                       // Inner loop label
        "mov (%%rsi), %%eax\n"       // Move arr[j] to eax
        "mov 4(%%rsi), %%edx\n"      // Move arr[j+1] to edx
        "cmp %%eax, %%edx\n"         // Compare arr[j] with arr[j+1]
        "jge 3f\n"                   // If arr[j] >= arr[j+1], skip the swap
        "mov %%edx, (%%rsi)\n"       // Swap arr[j] and arr[j+1]
        "mov %%eax, 4(%%rsi)\n"
        "3:\n"                       // No swap label
        "add $4, %%rsi\n"            // Move to the next pair of elements
        "dec %%ebx\n"                // Decrement the inner loop counter
        "jnz 2b\n"                   // If inner loop counter is not zero, continue inner loop

        "dec %%ecx\n"                // Decrement the outer loop counter
        "jnz 1b\n"                   // If outer loop counter is not zero, continue outer loop
        :
        : [arr] "r" (arr), [n] "r" (n)
        : "eax", "edx", "ebx", "ecx", "rsi"
    );
/*
    printf("Debug: Array after assembly sort:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
*/
}
/*
void printArray(int arr[], int size) {
    int i;
    for (i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}
*/

int isSorted(int arr[], int size) {
    for (int i = 0; i < size - 1; i++) {
        if (arr[i] > arr[i + 1]) {
            return 0; 
        }
    }
    return 1; 
}

int main() {
    srand(time(NULL)); 

    int n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);

    int *arr = (int *)malloc(n * sizeof(int));
    int *arr2 = (int *)malloc(n * sizeof(int));

    for (int i = 0; i < n; i++) {
        arr[i] = rand() % 100; 
        arr2[i] = arr[i];
    }

    //printf("Unsorted array: \n");
    //printArray(arr, n);

    // C 
    clock_t start, end;
    double cpu_time_used;

    start = clock();
    bubbleSort(arr, n);
    end = clock();

    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("Sorted array (C): \n");
    //printArray(arr, n);
    printf("Time taken to sort (C): %f seconds\n", cpu_time_used);
    printf("Is array sorted (C)? %s\n", isSorted(arr, n) ? "Yes" : "No");

    // ASM
    start = clock();
    bubbleSortAsm(arr2, n);
    end = clock();

    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    //printf("Sorted array (ASM): \n");
    //printArray(arr2, n);
    printf("Time taken to sort (ASM): %f seconds\n", cpu_time_used);
    printf("Is array sorted (ASM)? %s\n", isSorted(arr2, n) ? "Yes" : "No");

    free(arr);
    free(arr2);

    return 0;
}
