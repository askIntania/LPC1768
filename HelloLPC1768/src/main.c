#include "lpc17xx.h"

void delay_ms(unsigned int count)
{
	volatile unsigned int j=0,i=0;
	for(j=0;j<count;j++)
	{
		for(i=0;i<12000;i++);
	}
}

int main(void){
	uint8_t i = 0;

	SystemInit();                    //Clock and PLL configuration
	LPC_PINCON->PINSEL4 &= ~(0xFFFF); 	// Configure pins P2.0-P2.7 function  to gpio mode
	LPC_GPIO2->FIODIR0   = 0xFF;  		// Configure pins P2.0-P2.7 gpio mode to output;

	while(1){
		LPC_GPIO2->FIOCLR0   = 0xFF;
		LPC_GPIO2->FIOSET0   = 1<<i++;        // Make pins P2.0-P2.7 to low
		if(i == 8)
			i = 0;
		delay_ms(1000);
	}
}
