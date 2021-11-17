MODULE Order_Commands
    VAR num nPalletCount;
    VAR robtarget PointPick;

    PROC VacBlow_12()
        SetDO Vac_Suck1,0;
        SetDO Vac_Blow1,1;
        SetDO Vac_Suck2,0;
        SetDO Vac_Blow2,1;        
        WaitTime(0.3);
        SetDO Vac_Blow1,0;
        SetDO Vac_Blow2,0;
    ENDPROC
    
    PROC VacBlow_1()
        SetDO Vac_Suck1,0;
        SetDO Vac_Blow1,1;
        WaitTime(0.3);
        SetDO Vac_Blow1,0;
    ENDPROC

    PROC VacBlow_2()
        SetDO Vac_Suck2,0;
        SetDO Vac_Blow2,1;
        WaitTime(0.3);
        SetDO Vac_Blow2,0;
    ENDPROC

    PROC VacSuck_12()
        SetDO Vac_Blow1,0;
        SetDO Vac_Suck1,1;
        SetDO Vac_Blow2,0;
        SetDO Vac_Suck2,1;        
    ENDPROC
    
    PROC VacSuck_1()
        SetDO Vac_Blow1,0;
        SetDO Vac_Suck1,1;
    ENDPROC
    
    PROC VacSuck_2()
        SetDO Vac_Blow2,0;
        SetDO Vac_Suck2,1;
    ENDPROC 
    
    PROC CylPlace_Suck12()
        VAR bool Time_Out_flag1;
        VAR bool Time_Out_flag2; 
        SetDO CylBack_Suck1,0;
        SetDO CylPlace_Suck1,1;
        SetDO CylBack_Suck2,0;
        SetDO CylPlace_Suck2,1;
        WaitDI PlaceSence_Suck1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag1;
        WaitDI PlaceSence_Suck2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag2;
        IF Time_Out_flag1 OR  Time_Out_flag2 THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylPlace_Suck12;
        ELSE
        ENDIF     
    ENDPROC
    
    PROC CylPlace_Suck_1()
        VAR bool Time_Out_flag;
        SetDO CylBack_Suck1,0;
        SetDO CylPlace_Suck1,1;
        WaitDI PlaceSence_Suck1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylPlace_Suck_1;
        ELSE 
        ENDIF
    ENDPROC
    
    PROC CylPlace_Suck_2()
        VAR bool Time_Out_flag;
        SetDO CylBack_Suck2,0;
        SetDO CylPlace_Suck2,1;
        WaitDI PlaceSence_Suck2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylPlace_Suck_2;
        ELSE 
        ENDIF        
    ENDPROC
    
    PROC CylBack_Suck12()
        VAR bool Time_Out_flag1;
        VAR bool Time_Out_flag2; 
        SetDO CylBack_Suck1,1;
        SetDO CylPlace_Suck1,0;
        SetDO CylBack_Suck2,1;
        SetDO CylPlace_Suck2,0;
        WaitDI BackSence_Suck1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag1;
        WaitDI BackSence_Suck2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag2;
        IF Time_Out_flag1 OR  Time_Out_flag2 THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylBack_Suck12;
        ELSE
        ENDIF 
    ENDPROC
    
    PROC CylBack_Suck_1()
        VAR bool Time_Out_flag;
        SetDO CylBack_Suck1,1;
        SetDO CylPlace_Suck1,0;
        WaitDI BackSence_Suck1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylBack_Suck_1;
        ELSE 
        ENDIF
    ENDPROC    
    
    PROC CylBack_Suck_2()
        VAR bool Time_Out_flag;
        SetDO CylBack_Suck2,1;
        SetDO CylPlace_Suck2,0;
        WaitDI BackSence_Suck2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylBack_Suck_2;
        ELSE 
        ENDIF
    ENDPROC   
    
    PROC CylPlace_Cut_1()
        VAR bool Time_Out_flag;
        SetDO CylBack_Cut1,0;
        SetDO CylPlace_Cut1,1;
        WaitDI PlaceSence_Cut1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylPlace_Cut_1;
        ELSE 
        ENDIF
    ENDPROC
    
    PROC CylPlace_Cut_2()
        VAR bool Time_Out_flag;
        SetDO CylBack_Cut2,0;
        SetDO CylPlace_Cut2,1;
        WaitDI PlaceSence_Cut2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylPlace_Cut_2;
        ELSE 
        ENDIF        
    ENDPROC
      
    PROC CylBack_Cut_1()
        VAR bool Time_Out_flag;
        SetDO CylBack_Cut1,1;
        SetDO CylPlace_Cut1,0;
        WaitDI BackSence_Cut1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylBack_Cut_1;
        ELSE 
        ENDIF
    ENDPROC    
    
    PROC CylBack_Cut_2()
        VAR bool Time_Out_flag;
        SetDO CylBack_Cut2,1;
        SetDO CylPlace_Cut2,0;
        WaitDI BackSence_Cut2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
        SETDO ALM_Cyl,1;
        WaitDI ALM_RST,1;
        SETDO ALM_Cyl,0;
        CylBack_Cut_2;
        ELSE 
        ENDIF
    ENDPROC    
    
    
    FUNC string Pick12(string nSpeedPercen,string DryRun,string strX,string strY,string strZ)
        VAR string return_str;
        VAR string Str1;
        VAR string Str2;
        VAR num Xoffet;
        VAR num Yoffet;
        VAR num Zoffet;
        Xoffet:=StrToNum(strX)*0.001;
        Yoffet:=StrToNum(strY)*0.001;
        Zoffet:=StrToNum(strZ)*0.001;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointPick:=Point_Pick1;
        PointPick.trans.x:=Point_Pick1.trans.x+Xoffet;
        PointPick.trans.y:=Point_Pick1.trans.y+Yoffet;
        PointPick.trans.z:=Point_Pick1.trans.z+Zoffet;
        PointPick.robconf:=Point_Pick1.robconf;        
        TEST DryRun
        CASE "0":
        MoveL offs(PointPick,0,0,35),g_SpeedRun,z5,toolnew\WObj:=wobj0;
        i:=0;
        Pick_12;
        MoveL offs(PointPick,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        IF SuckSence1=1  THEN
            Str1:="Pick1_OK"+",";
        ELSE
            Str1:="Pick1_NG"+",";
        ENDIF
        IF SuckSence2=1  THEN
            Str2:="Pick2_OK"+",";
        ELSE
            Str2:="Pick2_NG"+",";
        ENDIF
        return_str:=Str1+Str2;
        
        CASE "1":
        MoveL offs(PointPick,0,0,35),g_SpeedRun,Z5,toolnew\WObj:=wobj0;
        CylPlace_Suck12;
        MoveL offs(PointPick,0,0,5),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        VacSuck_12;
        MoveL offs(PointPick,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        return_str:="Pick1_OK"+","+"Pick2_OK"+",";
        DEFAULT:
        ENDTEST  
        RETURN return_str;
    ENDFUNC

    PROC Pick_12()
        VAR bool Time_Out_flag;
        MoveL offs(PointPick,0,0,15),g_SpeedRun,Z5,toolnew\WObj:=wobj0;
        CylPlace_Suck12;
        MoveL PointPick,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        VacSuck_12;
        Waittime(0.3);
        MoveL offs(PointPick,0,0,15),g_SpeedRun,Z5,toolnew\WObj:=wobj0;
        CylBack_Suck12;
        WaitDI SuckSence1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        WaitDI SuckSence2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
           SetDO ALM_Vac,1;
           WaitDI ALM_RST,1;
           SetDO ALM_Vac,0;
           i:=i+1;
           IF i<2 THEN
           Pick_12;
            ELSE   
            ENDIF 
        ELSE
            i:=0;
        ENDIF 
    ENDPROC    

    
    FUNC string Pick1(string nSpeedPercen,string DryRun,string strX,string strY,string strZ)
        VAR string return_str;
        VAR string Str1;
        VAR string Str2;
        VAR num Xoffet;
        VAR num Yoffet;
        VAR num Zoffet;
        Xoffet:=StrToNum(strX)*0.001;
        Yoffet:=StrToNum(strY)*0.001;
        Zoffet:=StrToNum(strZ)*0.001;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointPick:=Point_Pick1;
        PointPick.trans.x:=Point_Pick1.trans.x+Xoffet;
        PointPick.trans.y:=Point_Pick1.trans.y+Yoffet;
        PointPick.trans.z:=Point_Pick1.trans.z+Zoffet;
        PointPick.robconf:=Point_Pick1.robconf;    
        MoveL offs(PointPick,0,0,35),g_SpeedRun,z5,toolnew\WObj:=wobj0;
        i:=0;
        Pick_1;
        MoveL offs(PointPick,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        CylBack_Suck12;
        IF SuckSence1=1  THEN
            Str1:="Pick1_OK"+",";
        ELSE
            Str1:="Pick1_NG"+",";
        ENDIF
            Str2:="Pick2_OK"+",";
        return_str:=Str1+Str2;
        RETURN return_str;
    ENDFUNC

    PROC Pick_1()
        VAR bool Time_Out_flag;
        MoveL offs(PointPick,0,0,10),g_SpeedRun,Z5,toolnew\WObj:=wobj0;
        CylPlace_Suck_1;
        MoveL PointPick,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        VacSuck_1;
        Waittime(0.3);
        MoveL offs(PointPick,0,0,10),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        WaitDI SuckSence1,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
           SetDO ALM_Vac,1;
           WaitDI ALM_RST,1;
           SetDO ALM_Vac,0;
           i:=i+1;
           IF i<2 THEN
           Pick_1;
            ELSE   
            ENDIF 
        ELSE
            i:=0;
        ENDIF 
    ENDPROC  

    FUNC string Pick2(string nSpeedPercen,string DryRun,string strX,string strY,string strZ)
        VAR string return_str;
        VAR string Str1;
        VAR string Str2;
        VAR num Xoffet;
        VAR num Yoffet;
        VAR num Zoffet;
        Xoffet:=StrToNum(strX)*0.001;
        Yoffet:=StrToNum(strY)*0.001;
        Zoffet:=StrToNum(strZ)*0.001;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointPick:=Point_Pick2;
        PointPick.trans.x:=Point_Pick2.trans.x+Xoffet;
        PointPick.trans.y:=Point_Pick2.trans.y+Yoffet;
        PointPick.trans.z:=Point_Pick2.trans.z+Zoffet;
        PointPick.robconf:=Point_Pick2.robconf;    
        MoveL offs(PointPick,0,0,35),g_SpeedRun,z5,toolnew\WObj:=wobj0;
        i:=0;
        Pick_2;
        MoveL offs(PointPick,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        CylBack_Suck12;
        IF SuckSence1=2  THEN
            Str2:="Pick2_OK"+",";
        ELSE
            Str2:="Pick2_NG"+",";
        ENDIF
            Str1:="Pick1_OK"+",";
        return_str:=Str1+Str2;
        RETURN return_str;
    ENDFUNC

    PROC Pick_2()
        VAR bool Time_Out_flag;
        MoveL offs(PointPick,0,0,10),g_SpeedRun,Z5,toolnew\WObj:=wobj0;
        CylPlace_Suck_2;
        MoveL PointPick,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        VacSuck_2;
        Waittime(0.3);
        MoveL offs(PointPick,0,0,10),g_SpeedRun,fine,toolnew\WObj:=wobj0;
        WaitDI SuckSence2,1\MaxTime:=0.3\TimeFlag:=Time_Out_flag;
        IF Time_Out_flag THEN
           SetDO ALM_Vac,1;
           WaitDI ALM_RST,1;
           SetDO ALM_Vac,0;
           i:=i+1;
           IF i<2 THEN
           Pick_2;
            ELSE   
            ENDIF 
        ELSE
            i:=0;
        ENDIF 
    ENDPROC      
    
        FUNC string Throw(string nSpeedPercen,string Xizui)
        VAR string return_str;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        CylBack_Suck12;
        TEST Xizui
        CASE "1":
        MoveL Point_Throw1,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        CylPlace_Suck_1;
        VacBlow_1;
        CylBack_Suck_1;
        CASE "2":
        MoveL Point_Throw2,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        CylPlace_Suck_2;
        VacBlow_2;
        CylBack_Suck_2;
        DEFAULT:
        ENDTEST 
        return_str:="Throw_OK"+",";
        RETURN return_str;
    ENDFUNC

    FUNC string GetPos()
        VAR string return_str;
        VAR robtarget PointCur;
        PointCur:=CRobT(\Tool:=tool3,\WObj:=wobj0);
        return_str:="GetPos_OK,"+ValToStr(PointCur.trans.x)+","+ValToStr(PointCur.trans.y)+","+ValToStr(PointCur.trans.z)+","+ValToStr(eulerzyx(\z,PointCur.rot));
        RETURN return_str;
    ENDFUNC

    FUNC string GoSnap(string nSpeedPercen,string Xizui)
        VAR string return_str;
        VAR robtarget pTemp;
        VAR robtarget PointCur;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        PointCur:=CRobT(\Tool:=toolnew,\WObj:=wobj0);
        IF Xizui="1" THEN
            movel offs(Point_Snap1,0,0,20),g_SpeedRun,z5,toolnew\WObj:=wobj0;
            movel Point_Snap1,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitRob\ZeroSpeed;
            pTemp:=Point_Snap1;
            
        ELSEIF Xizui="2" THEN
            movel Point_Snap2,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitRob\ZeroSpeed;
            pTemp:=Point_Snap2;
           
        ENDIF
        return_str:="GoSnap_OK,"+ValToStr(pTemp.trans.x)+","+ValToStr(pTemp.trans.y)+","+ValToStr(eulerzyx(\z,pTemp.rot))+",";
        RETURN return_str;
    ENDFUNC

    FUNC string MoveToSnap(string strXpoint,string strYpoint,string strUpoint)
        VAR string return_str;
        VAR robtarget pTemp;
        VAR robtarget pNext;
        VAR num RX;
        VAR num RY;
        VAR robtarget pCurAssem1;
        VAR speeddata speedAssem;
        VAR num nSuck;
        VAR string bre;
        pTemp:=CRobT(\Tool:=tool3\WObj:=wobj0);
        pTemp.trans.x:=StrToNum(strXpoint);
        pTemp.trans.y:=StrToNum(strYpoint);
        RX:=EulerZYX(\X,pTemp.rot);
        RY:=EulerZYX(\Y,pTemp.rot);
        pTemp.rot:=OrientZYX(StrToNum(strUpoint),RY,RX);
        pTemp.trans.z:=Point_Snap.trans.z;
        bre:=",1";
        IF Abs(pTemp.trans.x-Point_Snap.trans.x)>30 OR Abs(pTemp.trans.y-Point_Snap.trans.y)>30 THEN
            pTemp:=Point_Snap;
            bre:=",0";
        endif

        pTemp.trans.z:=Point_Snap.trans.z;
        movel offs(pTemp,0,0,20),g_SpeedRun,z5,tool3\WObj:=wobj0;
        !        WaitRob\ZeroSpeed;
        Movel pTemp,g_SpeedRun,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
        WaitRob\ZeroSpeed;

        !        WaitRob\InPos;
        WaitTime 0.1;
        !        WaitTime 0.2;
        pTemp:=CRobT(\Tool:=tool3,\WObj:=wobj0);
        return_str:="MoveToSnap_OK,"+ValToStr(pTemp.trans.x)+","+ValToStr(pTemp.trans.y)+","+ValToStr(eulerzyx(\z,pTemp.rot))+bre;
        RETURN return_str;
    ENDFUNC

    FUNC string Assemble(string nSpeedPercen,string DryRun,string Gongwei,string strXpoint,string strYpoint,string strUpoint)
        VAR string return_str;
        VAR robtarget pTemp;   
        VAR robtarget pCurAssem;
        VAR speeddata speedAssem;
        VAR num RX;
        VAR num RY;
        VAR num RU; 
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        g_DryRun:=StrToNum(DryRun);
        TEST Gongwei
        CASE "1":
        pTemp:=Point_Assemble1;
        IF g_DryRun=1 THEN
            MoveL offs(pTemp,0,0,30),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            CylPlace_Cut_1;
            movel pTemp,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitTime(0.5);
            CylBack_Cut_1;
            CylBack_Suck_1;
        ELSE
            pTemp.trans.x:=StrToNum(strXpoint);
            pTemp.trans.y:=StrToNum(strYpoint);
            RX:=EulerZYX(\X,pTemp.rot);
            RY:=EulerZYX(\Y,pTemp.rot);
            pTemp.rot:=OrientZYX(StrToNum(strUpoint),RY,RX);  
            MoveL offs(pTemp,0,0,30),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            CylPlace_Cut_1;
            movel pTemp,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitTime(0.5);
            CylBack_Cut_1;
            CylBack_Suck_1;
        ENDIF
        CASE "2":
        pTemp:=Point_Assemble2;
        IF g_DryRun=1 THEN
            MoveL offs(pTemp,0,0,30),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            CylPlace_Cut_2;
            movel pTemp,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitTime(0.5);
            CylBack_Cut_2;
            CylBack_Suck_2;
        ELSE
            pTemp.trans.x:=StrToNum(strXpoint);
            pTemp.trans.y:=StrToNum(strYpoint);
            RX:=EulerZYX(\X,pTemp.rot);
            RY:=EulerZYX(\Y,pTemp.rot);
            pTemp.rot:=OrientZYX(StrToNum(strUpoint),RY,RX);  
            MoveL offs(pTemp,0,0,30),g_SpeedRun,fine,toolnew\WObj:=wobj0;
            CylPlace_Cut_2;
            movel pTemp,g_SpeedRun,fine,toolnew\WObj:=wobj0;
            WaitTime(0.5);
            CylBack_Cut_2;
            CylBack_Suck_2;
        ENDIF
        DEFAULT:
        ENDTEST 
        return_str:="Assemble_OK,"+",";
        RETURN return_str;
    ENDFUNC

    FUNC string Put(string nSpeedPercen,string Dianwei)
        VAR string return_str;
        VAR robtarget pTemp;
        VAR robtarget pNext;
        VAR robtarget palletpos;
        VAR num RX;
        VAR num RY;
        VAR num RU;        
        VAR robtarget pCurAssem;
        VAR bool Time_Out_flag;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        pTemp:=GetPallet(StrToNum(Dianwei));
        Movel offs(pTemp,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;            
        Movel pTemp,g_SpeedRun,fine,toolnew\WObj:=wobj0;
        VacBlow_12;
        WaitTime 0.2;
        pTemp:=CRobT(\Tool:=toolnew,\WObj:=wobj0);
        Movel offs(pTemp,0,0,35),g_SpeedRun,fine,toolnew\WObj:=wobj0;  
        WaitRob\ZeroSpeed;
        return_str:="Put_OK,"+",";
        RETURN return_str;
    ENDFUNC    
    
    
    FUNC string MoveTo(string strXpoint,string strYpoint,string strUpoint)
        VAR string return_str;
        VAR robtarget pTemp;
        VAR robtarget pNext;
        VAR num RX;
        VAR num RY;
        VAR robtarget pCurAssem1;
        VAR speeddata speedAssem;
        VAR num nSuck;
        speedAssem.v_tcp:=2000;
        speedAssem.v_ori:=3000;
        speedAssem.v_leax:=2000;
        speedAssem.v_reax:=1500;
        IF speedAssem.v_tcp>g_SpeedRun.v_tcp THEN
            speedAssem.v_tcp:=g_SpeedRun.v_tcp;
        ENDIF
        pTemp:=CRobT(\Tool:=tool3\WObj:=wobj0);
        IF g_DryRun=0 THEN
            pTemp.trans.x:=StrToNum(strXpoint);
            pTemp.trans.y:=StrToNum(strYpoint);
            RX:=EulerZYX(\X,pTemp.rot);
            RY:=EulerZYX(\Y,pTemp.rot);
            pTemp.rot:=OrientZYX(StrToNum(strUpoint),RY,RX);
        ENDIF
        !  SingArea\Wrist;
        movel offs(pTemp,0,0,0),speedAssem,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
        WaitRob\ZeroSpeed;
        !        WaitRob\InPos;
        WaitTime 0.1;
        pCurAssem1:=crobt(\Tool:=tool3\WObj:=wobj0);
        return_str:="Move_OK,"+ValToStr(pCurAssem1.trans.x)+","+ValToStr(pCurAssem1.trans.y)+","+ValToStr(eulerzyx(\z,pCurAssem1.rot));
        RETURN return_str;
    ENDFUNC
    

    FUNC string MoveToDym(string nSpeedPercen)
        VAR string return_str;
        VAR robtarget pTemp;
        VAR robtarget pNext;
        VAR num RX;
        VAR num RY;
        VAR robtarget pCurAssem1;
        VAR speeddata speedAssem;
        VAR num nSuck;
        g_SpeedRun.v_leax:=my_speed.v_leax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_ori:=my_speed.v_ori*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_reax:=my_speed.v_reax*StrToNum(nSpeedPercen)*0.01;
        g_SpeedRun.v_tcp:=my_speed.v_tcp*StrToNum(nSpeedPercen)*0.01;
        speedAssem.v_tcp:=2000;
        speedAssem.v_ori:=3000;
        speedAssem.v_leax:=2000;
        speedAssem.v_reax:=1500;
        IF speedAssem.v_tcp>g_SpeedRun.v_tcp THEN
            speedAssem.v_tcp:=g_SpeedRun.v_tcp;
        ENDIF
        pTemp:=crobt(\Tool:=tool3\WObj:=wobj0);
        movel offs(pTemp,0,0,20),g_SpeedRun,z5,tool3\WObj:=wobj0;
        !movel offs(PointPick,0,0,20),g_SpeedRun,z5,tool3\WObj:=wobj0;
        movel Point_Throw,g_SpeedRun,z5,tool3\WObj:=wobj0;
        movel offs(Point_Snap,0,0,20),g_SpeedRun,z5,tool3\WObj:=wobj0;
        movel Point_Snap,g_SpeedRun,fine\Inpos:=my_inpos,tool3\WObj:=wobj0;
        WaitRob\inpos;
        WaitTime 0.3;
        pCurAssem1:=crobt(\Tool:=tool3\WObj:=wobj0);
        return_str:="MoveToDym_OK,"+ValToStr(pCurAssem1.trans.x)+","+ValToStr(pCurAssem1.trans.y)+","+ValToStr(eulerzyx(\z,pCurAssem1.rot));
        RETURN return_str;
    ENDFUNC
ENDMODULE