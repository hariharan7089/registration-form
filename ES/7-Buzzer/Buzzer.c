#include <LPC214x.h>

#define BUZZ (1 << 7)

void Delay(unsigned int n)
{
    unsigned int i, j;
    for (i = 0; i < n; i++)
        for (j = 0; j < 10000; j++)
            ;
}

int main()
{
    IO0DIR |= BUZZ; // Configure Port 0.7 as Output pin for the buzzer

    while (1)
    {
        IOSET0 = BUZZ; // Buzzer On
        Delay(100);
        IOCLR0 = BUZZ; // Buzzer Off
        Delay(100);
    }
}
