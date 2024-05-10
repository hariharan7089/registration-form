#include <LPC214x.h>

#define DELAY_MS 2000  // 2 Second(s) Delay
#define PRESCALE 60000 // 60000 PCLK clock cycles to increment TC by 1

void Timer0_Init(void);
void Timer0_Run(void);

int main(void)
{
    VPBDIV = 0x01;       // Set PCLK = 60MHz
    IO1DIR = 0x00FF0000; // P1.16 to P1.23 are output
    Timer0_Init();       // Initialize Timer0

    while (1)
    {
        Timer0_Run();
    }
}

void Timer0_Init(void)
{
    // Assuming that PLL0 has been setup with CCLK = 60MHz and PCLK also = 60MHz
    T0CTCR = 0x0;
    T0PR = PRESCALE - 1; // Increment T0TC at every 60000 clock cycles
                         // Count begins from zero hence subtracting 1
                         // 60000 clock cycles @60MHz = 1 mS

    T0MR0 = DELAY_MS - 1; // Zero Indexed Count - hence subtracting 1
    T0MCR = 3;            // Set bit0 & bit1 to High which is to : Interrupt & Reset TC on MR0

    T0TCR = 0x02; // Reset Timer
    T0TCR = 0x01; // Enable timer
}

void Timer0_Run(void)
{
    unsigned char regVal;
    if (T0IR)
    {                         // Polling the Interrupt Flag
        regVal = T0IR;        // Read current IR value
        IO1PIN ^= 0x00FF0000; // Toggle LED pins in Port 1
        T0IR = regVal;        // Write back to IR to clear Interrupt Flag
    }
}
