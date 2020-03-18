

    /*
  * THROTTLE_CONTROLLER_data.c
  *
    * Academic License - for use in teaching, academic research, and meeting
* course requirements at degree granting institutions only.  Not for
* government, commercial, or other organizational use. 
  * 
  * Code generation for model "THROTTLE_CONTROLLER".
  *
  * Model version              : 1.49
  * Simulink Coder version : 9.2 (R2019b) 18-Jul-2019
  * C source code generated on : Thu Jan  9 14:02:30 2020
 * 
 * Target selection: saber_rtw.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: 32-bit Generic
 * Emulation hardware selection: 
 *    Differs from embedded hardware (MATLAB Host)
 * Code generation objectives: Unspecified
 * Validation result: Not run
  */



    

        #include "THROTTLE_CONTROLLER.h"

      #include "THROTTLE_CONTROLLER_private.h"



  

  

  

  

  

  

  

  

  

  

      /* Block parameters (default storage) */
        


         P_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_P = {
            
    
                /* Mask Parameter: PIDController_D
  * Referenced by: '<S1>/Derivative Gain'
   */
0.0, 



    
    
                /* Mask Parameter: PIDController_I
  * Referenced by: '<S1>/Integral Gain'
   */
0.01, 



    
    
                /* Mask Parameter: PIDController_P
  * Referenced by: '<S1>/Proportional Gain'
   */
200.0, 



    
    
                /* Expression: 0
  * Referenced by: '<S1>/Integrator'
   */
0.0, 



    
    
                /* Expression: 0.05
  * Referenced by: '<Root>/Gain'
   */
0.05, 



    
    
                /* Expression: 1
  * Referenced by: '<Root>/Saturation3'
   */
1.0, 



    
    
                /* Expression: -1
  * Referenced by: '<Root>/Saturation3'
   */
-1.0






      };

     
  



  

  

  

  

  

  

  

  

  
