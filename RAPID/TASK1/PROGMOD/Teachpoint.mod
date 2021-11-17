MODULE Teachpoint
    PROC MovePoint()
        VAR robtarget pTemp;
        VAR num rx;
        VAR num ry;
        movel Point_Home,V100,fine,tool3\WObj:=wobj0;
        movel Point_SafeHigh,V100,fine,tool3\WObj:=wobj0;
        movel Point_Pick1,V100,fine,tool3\WObj:=wobj0;
        movel Point_Pick2,V100,fine,tool3\WObj:=wobj0;
        movel Point_Over1,V100,fine,tool3\WObj:=wobj0;
        movel Point_Over2,V100,fine,tool3\WObj:=wobj0;
        movel Point_Snap,V100,fine,tool3\WObj:=wobj0;
        movel Point_Assemble,V100,fine,tool3\WObj:=wobj0;
        movel Point_Throw,V100,fine,tool3\WObj:=wobj0;
    ENDPROC

    PROC MoveToolPoint()
        VAR robtarget pTemp;
        VAR num rx;
        VAR num ry;
        !        movel Point_Home,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Pick1,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Pick2,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Over1,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Over2,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Snap,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Assemble,V100,fine,tool3_qq\WObj:=wobj0;
        !        movel Point_Throw,V100,fine,tool3_qq\WObj:=wobj0;


        movel Point_Home,V100,fine,tool3\WObj:=wobj0;
        movel Point_SafeHigh,V100,fine,tool3\WObj:=wobj0;
        movel Point_Pick1,V100,fine,tool3\WObj:=wobj0;
        movel Point_Pick2,V100,fine,tool3\WObj:=wobj0;
        movel Point_Over1,V100,fine,tool3\WObj:=wobj0;
        movel Point_Over2,V100,fine,tool3\WObj:=wobj0;
        movel Point_Snap,V100,fine,tool3\WObj:=wobj0;
        movel Point_Assemble,V100,fine,tool3\WObj:=wobj0;
        movel Point_Throw,V100,fine,tool3\WObj:=wobj0;
    endPROC
ENDMODULE