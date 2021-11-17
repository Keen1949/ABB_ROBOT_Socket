MODULE MyFunction
    PROC pallet(num row,num column,num distance,PERS tooldata tool,PERS wobjdata wobj)

        VAR robtarget palletpos:=[[0,0,0],[1,0,0,0],[0,0,0,0],[9E9,9E9,9E9,9E9,9E9,9E9]];

        palletpos:=Offs(palletpos,(row-1)*distance,(column-1)*distance,0);

        ! MoveL palletpos,v100,fine,tool\WObj:=wobj;
        jump palletpos,-80,v100,tool3,wobj;

    ENDPROC

    PROC jump(robtarget point,num Zlim,speeddata speed,PERS tooldata tool,PERS wobjdata wobj)
        VAR robtarget palletpos;
        palletpos:=CRobT(\Tool:=tool\WObj:=wobj);
        palletpos.trans.z:=Zlim;
        movel palletpos,speed,z10,tool\WObj:=wobj;
        WaitRob\ZeroSpeed;
        palletpos:=point;
        palletpos.trans.z:=Zlim;     
        movel palletpos,speed,z10,tool\WObj:=wobj;
        WaitRob\ZeroSpeed;
        movel point,speed,fine\Inpos:=my_inpos,tool\WObj:=wobj;
    ENDPROC

    
    proc ParseStr(string str,string match)

        VAR num Index;
        VAR string strbuf;
        VAR num found:=0;
        VAR num Len:=0;
        found:=StrMatch(str,1,"\0D");
        str:=strpart(str,1,found-1);
        strbuf:=str;
        Len:=StrLen(strbuf);

        FOR i FROM 1 TO Order_Otr_Num DO
            found:=StrMatch(strbuf,1,",");
            strData{i}:=StrPart(strbuf,1,found-1);
            Index:=Index+found;
            IF i<Order_Otr_Num THEN
                strbuf:=StrPart(str,Index+1,Len-Index);
            ENDIF

        ENDFOR

    ENDPROC

    FUNC robtarget sub(robtarget a,robtarget b)
        VAR robtarget sub;
        sub:=a;
        sub.trans.x:=a.trans.x-b.trans.x;
        sub.trans.y:=a.trans.y-b.trans.y;
        sub.trans.z:=a.trans.z-b.trans.z;
        sub.rot:=OrientZYX(EulerZYX(\Z,a.rot)-EulerZYX(\Z,b.rot),0,0);
        RETURN sub;

    ENDFUNC

    FUNC robtarget s_add(robtarget a,robtarget b)
        VAR robtarget s_add;
        s_add:=a;
        s_add.trans.x:=a.trans.x+b.trans.x;
        s_add.trans.y:=a.trans.y+b.trans.y;
        s_add.trans.z:=a.trans.z+b.trans.z;
        s_add.rot:=OrientZYX(EulerZYX(\Z,a.rot)+EulerZYX(\Z,b.rot),0,0);
        RETURN s_add;


    ENDFUNC

    FUNC num StrToNum(string str)
        VAR num back;
        VAR bool b;
        b:=strtoval(str,back);
        RETURN back;
    ENDFUNC
    


   
    FUNC robtarget here()
        VAR robtarget P_temp;
        P_temp:=CRobT(\Tool:=tool3,\WObj:=wobj0);
        RETURN P_temp;
    ENDFUNC



    FUNC bool Wait_Di(num index_Di,num b)
        VAR bool Time_Out_flag;
        Time_Out_flag:=FALSE;
        TEST index_Di
        CASE 1:
            !WaitDI DI1,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 2:
            !WaitDI DI2,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 3:
            !    WaitDI DI3,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 4:
            !   WaitDI DI4,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 5:
            !   WaitDI DI5,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 6:
            !  WaitDI DI6,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 7:
            !   WaitDI DI7,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 8:
            !  WaitDI DI8,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 9:
            !  WaitDI DI9,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 10:
            ! WaitDI DI10,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 10:
            ! WaitDI DI10,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 11:
            !  WaitDI DI11,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 12:
            !  WaitDI DI12,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 13:
            ! WaitDI DI13,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 14:
            ! WaitDI DI14,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 15:
            ! WaitDI DI15,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        CASE 16:
            ! WaitDI DI16,b\MaxTime:=3\TimeFlag:=Time_Out_flag;
        DEFAULT:
            Time_Out_flag:=TRUE;
        ENDTEST

        RETURN Time_Out_flag;

    ENDFUNC


ENDMODULE