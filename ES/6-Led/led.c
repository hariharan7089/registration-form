#include <lpc214x.h>

void delay(unsigned int count);

int main()
{
    IO0DIR |= 0xFFFFFFF; // Port 0 is now acting as an output pin

    while (1)
    {
        IOSET0 |= 0xFFFFFFF; // Port 0's all pins are high now (LED is glowing)
        delay(1000);         // Adjusted delay value for better blinking speed
        IOCLR0 |= 0xFFFFFFF; // Port 0's all pins are low now (LED is OFF)
        delay(1000);         // Adjusted delay value for better blinking speed
    }
}

void delay(unsigned int count)
{
    unsigned int i;
    for (i = 0; i < count; i++)
        ;
}
