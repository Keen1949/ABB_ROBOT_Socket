MODULE Calibrate
    !*************************************************************************************!

    VAR robtarget temp_point;
    VAR robtarget PointCur;
    FUNC string CaliCam(string nSpeedPercen,string Xizui,string strStep)
        VAR num rXdist:=5;
        var num rYdist:=5;
        var num rUdisp:=5;
        VAR robtarget temp_point;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointCur:=CRobT(\Tool:=toolnew,\WObj:=wobj0);
        TEST Xizui
        CASE "1":
        temp_point:=Point_Snap1;
        CASE "2":
        temp_point:=Point_Snap2;
        DEFAULT:
        ENDTEST
        
        TEST strStep
        CASE "1":
            Movel Offs(temp_point,0,0,30),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
            Movel Offs(temp_point,0,0,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "2":
            Movel Offs(temp_point,rXdist,0,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "3":
            Movel Offs(temp_point,rXdist,rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "4":
            Movel Offs(temp_point,0,rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "5":
            Movel Offs(temp_point,-rXdist,rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "6":
            Movel Offs(temp_point,-rXdist,0,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "7":
            Movel Offs(temp_point,-rXdist,-rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "8":
            Movel Offs(temp_point,0,-rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "9":
            Movel Offs(temp_point,rXdist,-rYdist,0),v30,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "10":
            Movel RelTool(temp_point,0,0,0\Rz:=rUdisp),v5,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "11":
            Movel RelTool(temp_point,0,0,0\Rz:=-rUdisp),v5,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        CASE "12": 
            Movel Offs(temp_point,0,0,0),v20,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
            Movel Offs(Point_Assemble,0,0,0),v20,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
            WaitRob\ZeroSpeed;
        DEFAULT:
        ENDTEST
        WaitTime(1);
        PointCur:=crobt(\Tool:=tool3\WObj:=wobj0);
        RETURN "CaliCam_OK,"+ValToStr(PointCur.trans.x)+","+ValToStr(PointCur.trans.y)+","+valtostr(EulerZYX(\Z,PointCur.rot))+",";
    ENDFUNC
  
    

    FUNC string TranCam(string nSpeedPercen,string Xizui)
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        CylBack_Cut_1;
        CylBack_Cut_2;
        CylBack_Suck12;
        !WaitDI Safty,1;
        TEST Xizui
        CASE "1":
        temp_point:=Point_Put1;
            movej offs(Point_Put1,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            movel Point_Put1,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            VacSuck_1;
            WaitTime(0.5);
            movel offs(Point_Put1,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            movel Point_Snap1,g_SpeedRun,fine,toolnew\WObj:=wobj0; 
         CASE "2":
         temp_point:=Point_Put2;
            movej offs(Point_Put2,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            movel Point_Put2,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            VacSuck_2;
            WaitTime(0.5);
            movel offs(Point_Put2,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            movel Point_Snap2,g_SpeedRun,fine,toolnew\WObj:=wobj0; 
        DEFAULT:
        ENDTEST
        WaitTime(1);
        PointCur:=crobt(\Tool:=tool3\WObj:=wobj0);
        RETURN "TranCam_OK,"+","+ValToStr(PointCur.trans.x)+","+ValToStr(PointCur.trans.y)+","+valtostr(EulerZYX(\Z,PointCur.rot))+","+ValToStr(temp_point.trans.x)+","+ValToStr(temp_point.trans.y)+","+ValToStr(eulerzyx(\z,temp_point.rot))+",";
    ENDFUNC    
    
ENDMODULE
