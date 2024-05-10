#include "config.h"
#include "stdlib.h"

extern void Roll_LED(void)
{
    IO1DIR |= 0x00FF0000;
    for (unsigned int i = 0; i < 16; i++)
    {
        if (i < 8)
        {
            IO1SET |= (1 << (23 - i));
            OSTimeDly(60);
            IO1CLR |= (1 << (23 - i));
        }
        else
        {
            IO1SET |= (1 << (i - 8));
            OSTimeDly(60);
            IO1CLR |= (1 << (i - 8));
        }
    }
}
