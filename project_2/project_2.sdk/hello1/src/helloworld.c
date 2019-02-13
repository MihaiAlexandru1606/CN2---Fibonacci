#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"


int main()
{
    init_platform();

    int fib1 = 0, fib2 = 1, fib = 1, i, n = 9;

    for(i = 0; i < n; i++){
    	fib2 = fib;
    	fib = fib2 + fib1;
    	fib1 = fib2;
    }

    xil_printf("%d\n", fib);
    cleanup_platform();
    return 0;
}
