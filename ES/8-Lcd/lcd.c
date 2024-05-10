#include <lpc214x.h>

#define bit(x) (1 << x)
#define delay1                 \
    for (i = 0; i < 1000; i++) \
        ;
#define delay2                   \
    for (i = 0; i < 100000; i++) \
        ;

unsigned int i;

void lcd_int(void);
void dat(unsigned char);
void cmd(unsigned char);
void string(unsigned char *);

int main()
{
    IO0DIR |= 0XFFF;
    lcd_int();
    cmd(0x8a);
    string("VANAKAM DA MAPLA V2 LA IRUNTHU");
    while (1)
    {
        cmd(0x18);
    }
}

void lcd_int(void)
{
    cmd(0x30);
    cmd(0x0c);
    cmd(0x06);
    cmd(0x01);
    cmd(0x80);
}

void cmd(unsigned char a)
{
    IO0PIN &= 0x00;
    IO0PIN |= (a << 0);
    IO0CLR |= bit(8);  // rs=0
    IO0CLR |= bit(9);  // rw=0
    IO0SET |= bit(10); // en=1
    delay2;
    IO0CLR |= bit(10); // en=0
}

void dat(unsigned char b)
{
    IO0PIN &= 0x00;
    IO0PIN |= (b << 0);
    IO0SET |= bit(8);  // rs=1
    IO0CLR |= bit(9);  // rw=0
    IO0SET |= bit(10); // en=1
    delay1;
    IO0CLR |= bit(10); // en=0
}

void string(unsigned char *p)
{
    while (*p != '\0')
    {
        dat(*p++);
    }
}
