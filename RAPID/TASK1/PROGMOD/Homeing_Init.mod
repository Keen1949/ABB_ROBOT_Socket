MODULE Homeing_Init
    !*************************************************************************************!

    FUNC string Init(string nSpeedPercen)
        VAR string return_str;
        VAR robtarget point_cont;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointCur:=crobt(\Tool:=toolnew\WObj:=wobj0);
        CylBack_Cut_1;
        CylBack_Cut_2;
        CylBack_Suck12;
        WaitTime(1);
        VacSuck_12;
        WaitTime(1);
        IF SuckSence1=1 or SuckSence2=1 THEN
        Throw12;  
        movej Point_home,g_SpeedRun,z5,tool3\WObj:=wobj0;
        ENDIF
        WaitRob\ZeroSpeed;
        return_str:="Init_OK"+",";
        RETURN return_str;
    ENDFUNC

    PROC Throw12()
        PointCur:=crobt(\Tool:=tool3\WObj:=wobj0);
        IF PointCur.trans.y>0 THEN
        movel Guodu1,g_SpeedRun,fine,tool3\WObj:=wobj0;
        movej Guodu2,g_SpeedRun,z5,tool3\WObj:=wobj0;
        movel Point_Throw1,g_SpeedRun,fine,tool3\WObj:=wobj0;
        CylPlace_Suck_1;
        VacBlow_1;
        CylBack_Suck_1;
        movel Point_Throw2,g_SpeedRun,fine,tool3\WObj:=wobj0;
        CylPlace_Suck_2;
        VacBlow_2;
        CylBack_Suck_2;
        ELSE
        movel Guodu3,g_SpeedRun,fine,tool3\WObj:=wobj0;
        movej Guodu4,g_SpeedRun,z5,tool3\WObj:=wobj0;
        movel Point_Throw1,g_SpeedRun,fine,tool3\WObj:=wobj0;
        CylPlace_Suck_1;
        VacBlow_1;
        CylBack_Suck_1;
        movel Point_Throw2,g_SpeedRun,fine,tool3\WObj:=wobj0;
        CylPlace_Suck_2;
        VacBlow_2;
        CylBack_Suck_2;  
        ENDIF      
    ENDPROC
    
    
    
    
    
    

    FUNC string Home()
        VAR string return_str;
        VAR robtarget point_cont;
        AccSet 50,50;
        jump Point_home,SafeLmtZ,my_init_speed,tool3,wobj0;

        return_str:="1";
        RETURN return_str;

    ENDFUNC
ENDMODULE