#include <stdio.h>
//-35, 95
int main(){
    int start_num = 85;
    int n = 10;
    int w = 1; // generated number
    int decimal = 1;
    for (int i = 1; i< n+1 ; i++) {
        w = w * start_num ^ i;
        w = w * (i << 1);
        w = w + (w << start_num); 
        while (w > 100) {
            w -= 100;
        }
        while(w < -100){
            w +=100;
        }

        decimal = decimal * start_num ^ i;
        decimal = decimal * (i << 1);
        decimal = decimal + (decimal << start_num); 
        decimal = decimal << (i + w);
        while (decimal >99){
            decimal -=10;
        }
        while (decimal <0){
            decimal += 10;
        }
        printf("num:%d: %d.%d\n", i, w, decimal);
    }
}
