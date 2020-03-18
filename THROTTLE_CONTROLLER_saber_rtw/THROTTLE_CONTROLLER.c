

    
  
    /*
    * THROTTLE_CONTROLLER.c
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




  

  

  

  

  

  

  

  

  

  

    
    

  
    
    /* Block signals (default storage) */
                


  B_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_B;

      
  
      
    
    
    
    
    
    
    
    /* Continuous states */
        


  X_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_X;

      
      /* Block states (default storage) */
                


  DW_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_DW;

          
      /* External inputs (root inport signals with default storage) */
                      


  ExtU_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_U;

        
    
      /* External outputs (root outports fed by signals with default storage) */
                      


  ExtY_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_Y;

        

  
        /* Real-time model */
          


  RT_MODEL_THROTTLE_CONTROLLER_T THROTTLE_CONTROLLER_M_;

        


  RT_MODEL_THROTTLE_CONTROLLER_T *const THROTTLE_CONTROLLER_M = &THROTTLE_CONTROLLER_M_;



  

  

  

  

    
  
  
  

  
     

  
    /* 
 * This function updates continuous states using the ODE5 fixed-step
 * solver algorithm
 */

        static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
    {
      /* Solver Matrices */
      static const real_T rt_ODE5_A[6] = {
        1.0/5.0, 3.0/10.0, 4.0/5.0, 8.0/9.0, 1.0, 1.0
      };
      static const real_T rt_ODE5_B[6][6] = {
        {1.0/5.0, 0.0, 0.0, 0.0, 0.0, 0.0},
        {3.0/40.0, 9.0/40.0, 0.0, 0.0, 0.0, 0.0},
        {44.0/45.0, -56.0/15.0, 32.0/9.0, 0.0, 0.0, 0.0},
        {19372.0/6561.0, -25360.0/2187.0, 64448.0/6561.0, -212.0/729.0, 0.0, 0.0},
        {9017.0/3168.0,-355.0/33.0,46732.0/5247.0,49.0/176.0,-5103.0/18656.0,0.0},
        {35.0/384.0, 0.0, 500.0/1113.0, 125.0/192.0, -2187.0/6784.0, 11.0/84.0}
      };
      
      time_T    t     = rtsiGetT(si);
      time_T    tnew  = rtsiGetSolverStopTime(si);
      time_T    h     = rtsiGetStepSize(si);
      real_T    *x    = rtsiGetContStates(si);
      ODE5_IntgData  *id   = (ODE5_IntgData *)rtsiGetSolverData(si);
      real_T    *y    = id->y;
      real_T    *f0   = id->f[0];
      real_T    *f1   = id->f[1];
      real_T    *f2   = id->f[2];
      real_T    *f3   = id->f[3];
      real_T    *f4   = id->f[4];
      real_T    *f5   = id->f[5];
      real_T    hB[6];
      int_T     i;
      int_T     nXc   = 1;
      
      rtsiSetSimTimeStep(si,MINOR_TIME_STEP);
      
      
      /* Save the state values at time t in y, we'll use x as ynew. */
      (void) memcpy(y, x,
(uint_T)nXc*sizeof(real_T));
      
      /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
      /* f0 = f(t,y) */
      rtsiSetdX(si, f0);    
              THROTTLE_CONTROLLER_derivatives();

       
      /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
      hB[0] = h * rt_ODE5_B[0][0];
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0]);
      }
      rtsiSetT(si, t + h*rt_ODE5_A[0]);
      rtsiSetdX(si, f1);
      
        
    

      THROTTLE_CONTROLLER_output();
  

              THROTTLE_CONTROLLER_derivatives();

      
       
      /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
      for (i = 0; i <= 1; i++) {
        hB[i] = h * rt_ODE5_B[1][i];
      }
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
      }
      rtsiSetT(si, t + h*rt_ODE5_A[1]);
      rtsiSetdX(si, f2);
      
        
    

      THROTTLE_CONTROLLER_output();
  

              THROTTLE_CONTROLLER_derivatives();

      
       
      /* f(:,4) = feval(odefile, t + hA(3), y + f*hB(:,3), args(:)(*)); */
      for (i = 0; i <= 2; i++) {
        hB[i] = h * rt_ODE5_B[2][i];
      }
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
      }
      rtsiSetT(si, t + h*rt_ODE5_A[2]);
      rtsiSetdX(si, f3);
      
        
    

      THROTTLE_CONTROLLER_output();
  

              THROTTLE_CONTROLLER_derivatives();

      
      /* f(:,5) = feval(odefile, t + hA(4), y + f*hB(:,4), args(:)(*)); */
      for (i = 0; i <= 3; i++) {
        hB[i] = h * rt_ODE5_B[3][i];
      }
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
        f3[i]*hB[3]);
      }
      rtsiSetT(si, t + h*rt_ODE5_A[3]);
      rtsiSetdX(si, f4);
      
        
    

      THROTTLE_CONTROLLER_output();
  

              THROTTLE_CONTROLLER_derivatives();

      
      
      /* f(:,6) = feval(odefile, t + hA(5), y + f*hB(:,5), args(:)(*)); */
      for (i = 0; i <= 4; i++) {
        hB[i] = h * rt_ODE5_B[4][i];
      }
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
        f3[i]*hB[3] + f4[i]*hB[4]);
      }
      rtsiSetT(si, tnew);
      rtsiSetdX(si, f5);
      
        
    

      THROTTLE_CONTROLLER_output();
  

              THROTTLE_CONTROLLER_derivatives();

      
       
      /* tnew = t + hA(6);
      ynew = y + f*hB(:,6); */
      for (i = 0; i <= 5; i++) {
        hB[i] = h * rt_ODE5_B[5][i];
      }
      for (i = 0; i < nXc; i++) {
        x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2] +
        f3[i]*hB[3] + f4[i]*hB[4] + f5[i]*hB[5]);
      }
      
      
      
      rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
      
    }
    
  
    
  
  
    
  
  
        
        
          
    /* Model output function */
    
              void THROTTLE_CONTROLLER_output(void) 
    {
      
    
    
        
      
      
real_T *lastU;
real_T lastTime;
real_T rtb_error;
real_T rtb_out;


      

        
  



            
         
      if (rtmIsMajorTimeStep(THROTTLE_CONTROLLER_M)) {
        
      /* set solver stop time */
    if (!(THROTTLE_CONTROLLER_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&THROTTLE_CONTROLLER_M->solverInfo, ((THROTTLE_CONTROLLER_M->Timing.clockTickH0 + 1) * THROTTLE_CONTROLLER_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&THROTTLE_CONTROLLER_M->solverInfo, ((THROTTLE_CONTROLLER_M->Timing.clockTick0  + 1) * THROTTLE_CONTROLLER_M->Timing.stepSize0 + THROTTLE_CONTROLLER_M->Timing.clockTickH0 * THROTTLE_CONTROLLER_M->Timing.stepSize0 * 4294967296.0));
    }

  
  

      } /* end MajorTimeStep */
    /* Update absolute time of base rate at minor time step */
    if (rtmIsMinorTimeStep(THROTTLE_CONTROLLER_M)) {
      THROTTLE_CONTROLLER_M->Timing.t[0] = rtsiGetT(&THROTTLE_CONTROLLER_M->solverInfo);
    } 
      

    

      
     
        
  



                        
        
                /* {S!d6}Sum: '<Root>/Sum1' incorporates:
 *  Inport: '<Root>/angle'
 *  Inport: '<Root>/input'
 *  Inport: '<Root>/soll'
 *  Sum: '<Root>/Sum'
 */
rtb_error = THROTTLE_CONTROLLER_U.soll - (THROTTLE_CONTROLLER_U.ist1 - THROTTLE_CONTROLLER_U.offset);
/* {S!d8}Gain: '<S1>/Derivative Gain' */
THROTTLE_CONTROLLER_B.DerivativeGain = THROTTLE_CONTROLLER_P.PIDController_D * rtb_error;
/* {S!d10}Derivative: '<S1>/Ideal Derivative' */
rtb_out = THROTTLE_CONTROLLER_M->Timing.t[0];
if ((THROTTLE_CONTROLLER_DW.TimeStampA >= rtb_out) && (THROTTLE_CONTROLLER_DW.TimeStampB >= rtb_out)) {
    rtb_out = 0.0;
} else {
    lastTime = THROTTLE_CONTROLLER_DW.TimeStampA;
    lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeA;
    if (THROTTLE_CONTROLLER_DW.TimeStampA < THROTTLE_CONTROLLER_DW.TimeStampB) {
        if (THROTTLE_CONTROLLER_DW.TimeStampB < rtb_out) {
            lastTime = THROTTLE_CONTROLLER_DW.TimeStampB;
            lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeB;
        }
    } else {
        if (THROTTLE_CONTROLLER_DW.TimeStampA >= rtb_out) {
            lastTime = THROTTLE_CONTROLLER_DW.TimeStampB;
            lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeB;
        }
    }
    rtb_out = (THROTTLE_CONTROLLER_B.DerivativeGain - *lastU) / (rtb_out - lastTime);
}
/* {E!d10}End of Derivative: '<S1>/Ideal Derivative' */

/* {S!d12}Gain: '<Root>/Gain' incorporates:
 *  Gain: '<S1>/Proportional Gain'
 *  Integrator: '<S1>/Integrator'
 *  Sum: '<S1>/Sum'
 */
rtb_out = ((THROTTLE_CONTROLLER_P.PIDController_P * rtb_error + THROTTLE_CONTROLLER_X.Integrator_CSTATE) + rtb_out) * THROTTLE_CONTROLLER_P.Gain_Gain;
/* {S!d20}Saturate: '<Root>/Saturation3' */
if (rtb_out > THROTTLE_CONTROLLER_P.Saturation3_UpperSat) {
    /* {S!d14}Outport: '<Root>/motor_in' */
    THROTTLE_CONTROLLER_Y.motor_in = THROTTLE_CONTROLLER_P.Saturation3_UpperSat;
} else if (rtb_out < THROTTLE_CONTROLLER_P.Saturation3_LowerSat) {
    /* {S!d16}Outport: '<Root>/motor_in' */
    THROTTLE_CONTROLLER_Y.motor_in = THROTTLE_CONTROLLER_P.Saturation3_LowerSat;
} else {
    /* {S!d18}Outport: '<Root>/motor_in' */
    THROTTLE_CONTROLLER_Y.motor_in = rtb_out;
}
/* {E!d20}End of Saturate: '<Root>/Saturation3' */

/* {S!d22}Gain: '<S1>/Integral Gain' */
THROTTLE_CONTROLLER_B.IntegralGain = THROTTLE_CONTROLLER_P.PIDController_I * rtb_error;






        
  


        

    
    


      
          
  

    }
      

        
    
    /* Model update function */
    
              void THROTTLE_CONTROLLER_update(void) 
    {
      
    
    
    
    
        
    
    
real_T *lastU;

      
  



          
  



                      
                /* {S!d24}Update for Derivative: '<S1>/Ideal Derivative' */
if (THROTTLE_CONTROLLER_DW.TimeStampA == (rtInf)) {
    THROTTLE_CONTROLLER_DW.TimeStampA = THROTTLE_CONTROLLER_M->Timing.t[0];
    lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeA;
} else if (THROTTLE_CONTROLLER_DW.TimeStampB == (rtInf)) {
    THROTTLE_CONTROLLER_DW.TimeStampB = THROTTLE_CONTROLLER_M->Timing.t[0];
    lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeB;
} else if (THROTTLE_CONTROLLER_DW.TimeStampA < THROTTLE_CONTROLLER_DW.TimeStampB) {
    THROTTLE_CONTROLLER_DW.TimeStampA = THROTTLE_CONTROLLER_M->Timing.t[0];
    lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeA;
} else {
    THROTTLE_CONTROLLER_DW.TimeStampB = THROTTLE_CONTROLLER_M->Timing.t[0];
    lastU = &THROTTLE_CONTROLLER_DW.LastUAtTimeB;
}
*lastU = THROTTLE_CONTROLLER_B.DerivativeGain;
/* {E!d24}End of Update for Derivative: '<S1>/Ideal Derivative' */





          
  



          
  
  
    
    
        if (rtmIsMajorTimeStep(THROTTLE_CONTROLLER_M)) {
          rt_ertODEUpdateContinuousStates(&THROTTLE_CONTROLLER_M->solverInfo);
        }

            /* Update absolute time for base rate */
            /* The "clockTick0" counts the number of times the code of this task has 
    * been executed. The absolute time is the multiplication of "clockTick0" 
    * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not 
    * overflow during the application lifespan selected.
      * Timer of this task consists of two 32 bit unsigned integers. 
      * The two integers represent the low bits Timing.clockTick0 and the high bits 
      * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment. 
    */

    if(!(++THROTTLE_CONTROLLER_M->Timing.clockTick0)) {
 ++THROTTLE_CONTROLLER_M->Timing.clockTickH0; 
}  THROTTLE_CONTROLLER_M->Timing.t[0] = rtsiGetSolverStopTime(&THROTTLE_CONTROLLER_M->solverInfo);

      
	{
           /* Update absolute timer for sample time: [0.001s, 0.0s] */
	         /* The "clockTick1" counts the number of times the code of this task has 
    * been executed. The absolute time is the multiplication of "clockTick1" 
    * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not 
    * overflow during the application lifespan selected.
      * Timer of this task consists of two 32 bit unsigned integers. 
      * The two integers represent the low bits Timing.clockTick1 and the high bits 
      * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment. 
    */

    if(!(++THROTTLE_CONTROLLER_M->Timing.clockTick1)) {
 ++THROTTLE_CONTROLLER_M->Timing.clockTickH1; 
} THROTTLE_CONTROLLER_M->Timing.t[1] = THROTTLE_CONTROLLER_M->Timing.clockTick1 * THROTTLE_CONTROLLER_M->Timing.stepSize1 + THROTTLE_CONTROLLER_M->Timing.clockTickH1 * THROTTLE_CONTROLLER_M->Timing.stepSize1 * 4294967296.0;

	 }

        

    


    
    
  
  

    

    
    
    

      
      
    }
                  /* Derivatives for root system: '<Root>' */
        
        
    void THROTTLE_CONTROLLER_derivatives(void)
    {
  
      
  
      
  
XDot_THROTTLE_CONTROLLER_T *_rtXdot;

    
  



              
    
    
  



                    
                _rtXdot = ((XDot_THROTTLE_CONTROLLER_T *) THROTTLE_CONTROLLER_M->derivs);
/* Derivatives for Integrator: '<S1>/Integrator' */
_rtXdot->Integrator_CSTATE = THROTTLE_CONTROLLER_B.IntegralGain;





    
  



      
      
      }
      
  








  



  




  /* Model initialize function */
  
      void THROTTLE_CONTROLLER_initialize(void)
  { 
      


    
    
    
    
        
    
    





      
        
  



      
  



                    
                

/* InitializeConditions for Integrator: '<S1>/Integrator' */
THROTTLE_CONTROLLER_X.Integrator_CSTATE = THROTTLE_CONTROLLER_P.Integrator_IC;
/* InitializeConditions for Derivative: '<S1>/Ideal Derivative' */
THROTTLE_CONTROLLER_DW.TimeStampA = (rtInf);
THROTTLE_CONTROLLER_DW.TimeStampB = (rtInf);
        






  
  



            
    
        

  


      
  


  }    




      
  


  
    
    /* Model terminate function */
          void THROTTLE_CONTROLLER_terminate(void)

    {
      
      /* (no terminate code required) */



          
  

    }
      
  





  
  
  /*========================================================================*
   * Start of Classic call interface                                        *
   *========================================================================*/
   
      /* Solver interface called by GRT_Main */
   #ifndef USE_GENERATED_SOLVER
      void rt_ODECreateIntegrationData(RTWSolverInfo *si)
    {
      UNUSED_PARAMETER(si);
      return;
    } /* do nothing */  
       void rt_ODEDestroyIntegrationData(RTWSolverInfo *si)
    {
      UNUSED_PARAMETER(si);
      return;
    } /* do nothing */   
       void rt_ODEUpdateContinuousStates(RTWSolverInfo *si)
    {
      UNUSED_PARAMETER(si);
      return;
    } /* do nothing */
    #endif


     
    
         void MdlOutputs(int_T tid) {
      
        
        THROTTLE_CONTROLLER_output();
            UNUSED_PARAMETER(tid);

    }
           
     
    
         void MdlUpdate(int_T tid) {
      
          THROTTLE_CONTROLLER_update();
            UNUSED_PARAMETER(tid);

    }
    
  
   
  
     void MdlInitializeSizes(void) {
  }
  
   
  
     void MdlInitializeSampleTimes(void) {
  }
  
  
   
  
     void MdlInitialize(void) {
  }
    
   
  
     void MdlStart(void) {
    THROTTLE_CONTROLLER_initialize();
  }
  
    
   
     void MdlTerminate(void) {
      THROTTLE_CONTROLLER_terminate();
  }
    

  /* Registration function */
  
       RT_MODEL_THROTTLE_CONTROLLER_T *THROTTLE_CONTROLLER(void) {
        /* Registration code */
              
  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));
      
      

      
            
            /* initialize real-time model */
            (void) memset((void *)THROTTLE_CONTROLLER_M, 0,
sizeof(RT_MODEL_THROTTLE_CONTROLLER_T));
            
            
  
  
    
      
        
    {
      /* Setup solver object */

        rtsiSetSimTimeStepPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->Timing.simTimeStep);
      rtsiSetTPtr(&THROTTLE_CONTROLLER_M->solverInfo, &rtmGetTPtr(THROTTLE_CONTROLLER_M));
        rtsiSetStepSizePtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->Timing.stepSize0);
        rtsiSetdXPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->derivs);
        rtsiSetContStatesPtr(&THROTTLE_CONTROLLER_M->solverInfo, (real_T **) &THROTTLE_CONTROLLER_M->contStates);
        rtsiSetNumContStatesPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->Sizes.numContStates);
          rtsiSetNumPeriodicContStatesPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->Sizes.numPeriodicContStates);
          rtsiSetPeriodicContStateIndicesPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->periodicContStateIndices);
          rtsiSetPeriodicContStateRangesPtr(&THROTTLE_CONTROLLER_M->solverInfo, &THROTTLE_CONTROLLER_M->periodicContStateRanges);
      rtsiSetErrorStatusPtr(&THROTTLE_CONTROLLER_M->solverInfo, (&rtmGetErrorStatus(THROTTLE_CONTROLLER_M)));

      
      rtsiSetRTModelPtr(&THROTTLE_CONTROLLER_M->solverInfo, THROTTLE_CONTROLLER_M);
    }
      rtsiSetSimTimeStep(&THROTTLE_CONTROLLER_M->solverInfo, MAJOR_TIME_STEP);
          THROTTLE_CONTROLLER_M->intgData.y = THROTTLE_CONTROLLER_M->odeY;
          THROTTLE_CONTROLLER_M->intgData.f[0] = THROTTLE_CONTROLLER_M->odeF[0];
          THROTTLE_CONTROLLER_M->intgData.f[1] = THROTTLE_CONTROLLER_M->odeF[1];
          THROTTLE_CONTROLLER_M->intgData.f[2] = THROTTLE_CONTROLLER_M->odeF[2];
          THROTTLE_CONTROLLER_M->intgData.f[3] = THROTTLE_CONTROLLER_M->odeF[3];
          THROTTLE_CONTROLLER_M->intgData.f[4] = THROTTLE_CONTROLLER_M->odeF[4];
          THROTTLE_CONTROLLER_M->intgData.f[5] = THROTTLE_CONTROLLER_M->odeF[5];
          
          THROTTLE_CONTROLLER_M->contStates = ((real_T *) &THROTTLE_CONTROLLER_X);
          

          rtsiSetSolverData(&THROTTLE_CONTROLLER_M->solverInfo, (void *)&THROTTLE_CONTROLLER_M->intgData);
    rtsiSetSolverName(&THROTTLE_CONTROLLER_M->solverInfo,"ode5");

    
  

  
      
        /* Initialize timing info */
          {
            int_T  *mdlTsMap      = THROTTLE_CONTROLLER_M->Timing.sampleTimeTaskIDArray;
                mdlTsMap[0] = 0;
                mdlTsMap[1] = 1;
            THROTTLE_CONTROLLER_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
            THROTTLE_CONTROLLER_M->Timing.sampleTimes = (&THROTTLE_CONTROLLER_M->Timing.sampleTimesArray[0]);
            THROTTLE_CONTROLLER_M->Timing.offsetTimes = (&THROTTLE_CONTROLLER_M->Timing.offsetTimesArray[0]);
                /* task periods */
      THROTTLE_CONTROLLER_M->Timing.sampleTimes[0] = (0.0);
      THROTTLE_CONTROLLER_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
      THROTTLE_CONTROLLER_M->Timing.offsetTimes[0] = (0.0);
      THROTTLE_CONTROLLER_M->Timing.offsetTimes[1] = (0.0);
          }
        
          rtmSetTPtr(THROTTLE_CONTROLLER_M, &THROTTLE_CONTROLLER_M->Timing.tArray[0]);
        
          {
            int_T  *mdlSampleHits = THROTTLE_CONTROLLER_M->Timing.sampleHitArray;
                  mdlSampleHits[0] = 1;
                  mdlSampleHits[1] = 1;
            THROTTLE_CONTROLLER_M->Timing.sampleHits = (&mdlSampleHits[0]);
          }
  
  
      
        
        
          
              rtmSetTFinal(THROTTLE_CONTROLLER_M, 10.0);
                THROTTLE_CONTROLLER_M->Timing.stepSize0  = 0.001;
                THROTTLE_CONTROLLER_M->Timing.stepSize1  = 0.001;
        
        
            
  

        
      
          
            
  /* Setup for data logging */
  {
      static RTWLogInfo rt_DataLoggingInfo;
      rt_DataLoggingInfo.loggingInterval = NULL;

          THROTTLE_CONTROLLER_M->rtwLogInfo = &rt_DataLoggingInfo;

  }


  /* Setup for data logging */
  {

      /*
       * Set pointers to the data and signal info each state
       */
        
  
  


  {
    static  int_T rt_LoggedStateWidths[] =    {
      
1


    };

    static  int_T rt_LoggedStateNumDimensions[] =    {
      
1


    };

    static  int_T rt_LoggedStateDimensions[] =    {
      
1


    };
    
    static  boolean_T rt_LoggedStateIsVarDims[] =    {
      
0


    };
    
    static  BuiltInDTypeId rt_LoggedStateDataTypeIds[] =    {
      
SS_DOUBLE


    };

    static  int_T rt_LoggedStateComplexSignals[] =    {
      
0


    };
    
    static  RTWPreprocessingFcnPtr rt_LoggingStatePreprocessingFcnPtrs[] =    {
      
(NULL)


    };

    static  const char_T  *rt_LoggedStateLabels[] = {
    
"CSTATE"

};

    static  const char_T *rt_LoggedStateBlockNames[] = {
    
"THROTTLE_CONTROLLER/PID Controller/Integrator"

};
      
    static  const char_T *rt_LoggedStateNames[] = {
    
""

};

    static  boolean_T rt_LoggedStateCrossMdlRef[] =    {
      
0


    };

    static  RTWLogDataTypeConvert rt_RTWLogDataTypeConvert[] =    {
      
{ 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0}


    };

    static  RTWLogSignalInfo rt_LoggedStateSignalInfo =    {
        1,
      rt_LoggedStateWidths,
      rt_LoggedStateNumDimensions,
      rt_LoggedStateDimensions,
      rt_LoggedStateIsVarDims, 
      (NULL), 
      (NULL), 
      rt_LoggedStateDataTypeIds,
      rt_LoggedStateComplexSignals,
      (NULL), 
      rt_LoggingStatePreprocessingFcnPtrs,
      {rt_LoggedStateLabels},
      (NULL),
      (NULL),
      (NULL),
      {rt_LoggedStateBlockNames},
      {rt_LoggedStateNames},
      rt_LoggedStateCrossMdlRef,
      rt_RTWLogDataTypeConvert
    };
   
      static void * rt_LoggedStateSignalPtrs[1];
  
        rtliSetLogXSignalPtrs(THROTTLE_CONTROLLER_M->rtwLogInfo, (LogSignalPtrsType) rt_LoggedStateSignalPtrs);

  
        rtliSetLogXSignalInfo(THROTTLE_CONTROLLER_M->rtwLogInfo, &rt_LoggedStateSignalInfo);

    
rt_LoggedStateSignalPtrs[0] = (void*)&THROTTLE_CONTROLLER_X.Integrator_CSTATE;

  }

        rtliSetLogT(THROTTLE_CONTROLLER_M->rtwLogInfo, "tout");

        rtliSetLogX(THROTTLE_CONTROLLER_M->rtwLogInfo, "xout");

        rtliSetLogXFinal(THROTTLE_CONTROLLER_M->rtwLogInfo, "");

        rtliSetLogVarNameModifier(THROTTLE_CONTROLLER_M->rtwLogInfo, "rt_");

        rtliSetLogFormat(THROTTLE_CONTROLLER_M->rtwLogInfo, 0);

        rtliSetLogMaxRows(THROTTLE_CONTROLLER_M->rtwLogInfo, 0);

        rtliSetLogDecimation(THROTTLE_CONTROLLER_M->rtwLogInfo, 1);


    
      /*
       * Set pointers to the data and signal info for each output
       */ 
        

  




  
  
  
  

  
   
  {
      static void * rt_LoggedOutputSignalPtrs[] =       {	

&THROTTLE_CONTROLLER_Y.motor_in

      };

    
        rtliSetLogYSignalPtrs(THROTTLE_CONTROLLER_M->rtwLogInfo, ((LogSignalPtrsType)rt_LoggedOutputSignalPtrs));

  }
{

     
    
      
      
    
    

    static  int_T rt_LoggedOutputWidths[] =    {
      1
    };

    static  int_T rt_LoggedOutputNumDimensions[] =    {
      1
    };

    static  int_T rt_LoggedOutputDimensions[] =    {
      1
    };

    static  boolean_T rt_LoggedOutputIsVarDims[] =    {
      0
    };
    
    static  void* rt_LoggedCurrentSignalDimensions[] =    {
      (NULL)
    };
   
    static  int_T rt_LoggedCurrentSignalDimensionsSize[] =    {
      4
    };

    static  BuiltInDTypeId rt_LoggedOutputDataTypeIds[] =    {
      SS_DOUBLE
    };

    static  int_T rt_LoggedOutputComplexSignals[] =    {
      0
    };
    
    static  RTWPreprocessingFcnPtr rt_LoggingPreprocessingFcnPtrs[] =    {
      (NULL)
    };

      
      static  const char_T *rt_LoggedOutputLabels[] = {
        "out"};
      
      static  const char_T *rt_LoggedOutputBlockNames[] = {
        "THROTTLE_CONTROLLER/motor_in"};


    static  RTWLogDataTypeConvert rt_RTWLogDataTypeConvert[] =    {
      { 0, SS_DOUBLE, SS_DOUBLE, 0, 0, 0, 1.0, 0, 0.0}
    };



  static  RTWLogSignalInfo rt_LoggedOutputSignalInfo[] =  {
      {
        1,
	rt_LoggedOutputWidths,
	rt_LoggedOutputNumDimensions,
	rt_LoggedOutputDimensions,
        rt_LoggedOutputIsVarDims,
        rt_LoggedCurrentSignalDimensions, 
        rt_LoggedCurrentSignalDimensionsSize,
	rt_LoggedOutputDataTypeIds,
	rt_LoggedOutputComplexSignals,
	(NULL),
        rt_LoggingPreprocessingFcnPtrs,
	{rt_LoggedOutputLabels},
	(NULL),
	(NULL),
	(NULL),
	{rt_LoggedOutputBlockNames},
        {(NULL)},
	(NULL),
        rt_RTWLogDataTypeConvert
      }
  };
  
      rtliSetLogYSignalInfo(THROTTLE_CONTROLLER_M->rtwLogInfo, rt_LoggedOutputSignalInfo);

  /* set currSigDims field */
  rt_LoggedCurrentSignalDimensions[0] = &rt_LoggedOutputWidths[0]; 

}


  


      

             rtliSetLogY(THROTTLE_CONTROLLER_M->rtwLogInfo, "yout");


  }


      
      
  
  

    THROTTLE_CONTROLLER_M->solverInfoPtr = (&THROTTLE_CONTROLLER_M->solverInfo);
    THROTTLE_CONTROLLER_M->Timing.stepSize = (0.001);
    rtsiSetFixedStepSize(&THROTTLE_CONTROLLER_M->solverInfo, 0.001);
      rtsiSetSolverMode(&THROTTLE_CONTROLLER_M->solverInfo, SOLVER_MODE_SINGLETASKING);
  
  
  


    /* block I/O */
    
            THROTTLE_CONTROLLER_M->blockIO = ((void *) &THROTTLE_CONTROLLER_B);
  
    
    

      {
                    
            
              THROTTLE_CONTROLLER_B.DerivativeGain = 0.0;
            
            
            
            
              THROTTLE_CONTROLLER_B.IntegralGain = 0.0;
            
            
              }
  
    
  
  
    

  






        /* parameters */
        THROTTLE_CONTROLLER_M->defaultParam = ((real_T *)&THROTTLE_CONTROLLER_P);
        
      /* states (continuous) */
      {
                    
        real_T *x = (real_T *) &THROTTLE_CONTROLLER_X;
        
      THROTTLE_CONTROLLER_M->contStates = (x);

        (void) memset((void *)&THROTTLE_CONTROLLER_X, 0,
sizeof(X_THROTTLE_CONTROLLER_T));


      }

    /* states (dwork) */
    
        

        THROTTLE_CONTROLLER_M->dwork = ((void *) &THROTTLE_CONTROLLER_DW);
    
        
                      
      THROTTLE_CONTROLLER_DW.TimeStampA = 0.0;
  
  
      THROTTLE_CONTROLLER_DW.LastUAtTimeA = 0.0;
  
  
      THROTTLE_CONTROLLER_DW.TimeStampB = 0.0;
  
  
      THROTTLE_CONTROLLER_DW.LastUAtTimeB = 0.0;
  
        

        

        
  
    
    
    
    
    
        
  
    


        /* external inputs */
        
                  THROTTLE_CONTROLLER_M->inputs = (((void*)&THROTTLE_CONTROLLER_U));

                  
                THROTTLE_CONTROLLER_U.soll = 0.0;
THROTTLE_CONTROLLER_U.offset = 0.0;
THROTTLE_CONTROLLER_U.ist1 = 0.0;






      
    

  
  
        
        
        /* external outputs */
        
        
          THROTTLE_CONTROLLER_M->outputs = (&THROTTLE_CONTROLLER_Y);
      

  
  
        

                
  


  
          
          
        
            THROTTLE_CONTROLLER_Y.motor_in = 0.0;
                 


  


        
        

    

  

          

  
      


    
    
    
  
      /* Initialize Sizes */
        THROTTLE_CONTROLLER_M->Sizes.numContStates = (1); /* Number of continuous states */
    THROTTLE_CONTROLLER_M->Sizes.numPeriodicContStates = (0); /* Number of periodic continuous states */
  THROTTLE_CONTROLLER_M->Sizes.numY = (1);  /* Number of model outputs */
  THROTTLE_CONTROLLER_M->Sizes.numU = (3);    /* Number of model inputs */
    THROTTLE_CONTROLLER_M->Sizes.sysDirFeedThru = (1);  /* The model is direct feedthrough */
  THROTTLE_CONTROLLER_M->Sizes.numSampTimes = (2);   /* Number of sample times */
  THROTTLE_CONTROLLER_M->Sizes.numBlocks = (11); /* Number of blocks */
    THROTTLE_CONTROLLER_M->Sizes.numBlockIO = (2); /* Number of block outputs */
    THROTTLE_CONTROLLER_M->Sizes.numBlockPrms = (7);  /* Sum of parameter "widths" */

        
    return THROTTLE_CONTROLLER_M;
  }
  
  /*========================================================================*
   * End of Classic call interface                                          *
   *========================================================================*/




  

  

  

  
