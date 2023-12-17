/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <complex.h>
#include <stdlib.h>
#include "platform.h"
#include "xil_printf.h"
#include <xtime_l.h>
#define N 4

const int rev4[N] = {0,2,1,3};
const float complex W[N/2] = {1-0*I, 0-1*I};

void bitreverse(float complex dataIn[N], float complex dataOut[N])
{
	bit_reversal: for (int i = 0; i < N; i++){
		dataOut[i] = dataIn[rev4[i]];
	}
}

void FFT_stages(float complex FFT_input[N], float complex FFT_output[N])
{
	float complex temp1[N], temp2[N];
	stage1: for (int i = 0; i < N; i = i+2){
		temp1[i] = FFT_input[i]+FFT_input[i+1];
		temp1[i+1] = FFT_input[i]-FFT_input[i+1];
	}

	stage2: for(int i = 0; i<N/2;i++)
	{
		FFT_output[i] = temp1[i]+W[i]*temp1[i+2];
		FFT_output[i+2] = temp1[i]-W[i]*temp1[i+2];
	}
}


int main()
{
    init_platform();

    print("Hello World\n\r");

    const float complex FFT_input[N] = {11+23*I, 32+10*I, 91+94*I, 15+69*I};
    XTime PS_start_time, PS_end_time;
    XTime_SetTime(0);

    float complex FFT_output[N];
    float complex FFT_rev[N];

    XTime_GetTime(&PS_start_time);

    bitreverse(FFT_input, FFT_rev);
    FFT_stages(FFT_rev, FFT_output);

    XTime_GetTime(&PS_end_time);


    printf("\n Printing FFT input \r\n");
    for (int i = 0; i < N; i++)
    {
    	printf("%f %f\n", creal(FFT_input[i]), cimagf(FFT_input[i]));
    }

    printf("\n Printing FFT output \r\n");
        for (int i = 0; i < N; i++)
        {
        	printf("%f %f\n", creal(FFT_output[i]), cimagf(FFT_output[i]));
        }

    float time = 0;
    time = (float)1.0 * (PS_end_time-PS_start_time)/(COUNTS_PER_SECOND/1000000);

    printf("\n\rExecution Time for pS in microseconds: %f", time);

    cleanup_platform();
    return 0;
}
