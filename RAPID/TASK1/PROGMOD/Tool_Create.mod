MODULE Tool_Create

    CONST robtarget Target_10:=[[333.82,-295.18,119.51],[0,0.792973,0.609257,0],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[359.61,-295.19,119.51],[0,0.843151,0.537676,0],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_30:=[[339.02,-295.18,119.51],[0,0.801258,0.598319,0],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !    CONST robtarget Target_10:=[[377.21,38.95,78.95],[0,0.746394,-0.665505,0],[0,-4,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !    CONST robtarget Target_20:=[[342.68,29.72,80.21],[0,0.959845,-0.28053,0],[0,-5,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !    CONST robtarget Target_30:=[[405.85,1.28,73.72],[0,0.169005,-0.985615,0],[0,-3,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    TASK PERS tooldata Tooldata_1:=[TRUE,[[61.603,93.301,10],[0.965925826,0,0,0.258819045]],[1,[0,0,1],[1,0,0,0],0,0,0]];
    PERS tooldata toolnew:=[TRUE,[[0,0,0],[1,0,0,0]],
                        [2,[0,0,40.5],[1,0,0,0],0,0,0]];
    PERS tooldata toolPos:=[TRUE,[[0,0,0],[1,0,0,0]],
                        [2,[0,0,40.5],[1,0,0,0],0,0,0]];
    TASK PERS tooldata Tool_suck:=[TRUE,[[34.8481,13.6692,0],[0.169005,0,0,-0.985615]],[2,[0,0,0.001],[1,0,0,0],0,0,0]];
    VAR robtarget p_temp;
    VAR robtarget cir_center;
    VAR num nn;
    !!!   ! PERS tooldata tool3:=[TRUE,[[-137.156,36.9955,0],[1,0,0,0]],[0.5,[-68.578,18.497,0],[1,0,0,0],0,0,0]];
    PERS tooldata tool3_qq:=[TRUE,[[-43.3836,133.126,0],[1,0,0,0]],[0.7,[-19,-2.8,1],[1,0,0,0],0,0,0.002]];
    !!!    PERS tooldata tool4:=[TRUE,[[-45.8189,132.655,0],[1,0,0,0]],[0.5,[-22.909,66.3275,0],[1,0,0,0],0,0,0]];
    !!!!     PERS tooldata tool3:=[TRUE,[[-137.156,36.9955,0],[1,0,0,0]],[0.5,[-68.5,78,0],[1,0,0,0],0,0,0]];
    PERS tooldata tool3:=[TRUE,[[-41.8404,134.725,0],[1,0,0,0]],[0.7,[-19,-2.8,1],[1,0,0,0],0,0,0.002]];

    PROC tcp_setup()
        MoveL Target_10,v1000,z100,toolPos\WObj:=wobj0;
        MoveL Target_20,v1000,z100,toolPos\WObj:=wobj0;
        MoveL Target_30,v1000,z100,toolPos\WObj:=wobj0;
        !        MoveL Target_10,v1000,z100,toolnew\WObj:=wobj0;
        !        MoveL Target_20,v1000,z100,toolnew\WObj:=wobj0;
        !        MoveL Target_30,v1000,z100,toolnew\WObj:=wobj0;

        p_temp:=Target_10;
        cir_center:=Target_10;
        cir_center.rot:=[0,1,0,0];
        cal_cir Target_10,Target_20,Target_30,cir_center;
        !calculate the circle center position in wobj0 based on Target_10,Target_20,Target30
        cal_matr Target_30,cir_center,p_temp;
        !calculate the trans pose: Target_30 to cir_center
        Tool_suck.tframe.trans.x:=p_temp.trans.x;
        Tool_suck.tframe.trans.y:=p_temp.trans.y;
        Tool_suck.tframe.rot:=p_temp.rot;
        Stop;
    ENDPROC

    PROC cal_matr(robtarget p1,robtarget p2,inout robtarget p3)
        VAR pose pose1;
        VAR pose pose2;
        VAR pose pose3;
        pose1.trans:=p1.trans;
        pose2.trans:=p2.trans;
        pose1.rot:=p1.rot;
        pose2.rot:=p2.rot;
        pose3:=PoseMult(PoseInv(pose1),pose2);
        p3.trans:=pose3.trans;
        p3.rot:=pose3.rot;
    ENDPROC

    PROC cal_cir(robtarget p1,robtarget p2,robtarget p3,inout robtarget p_center)
        VAR num r;
        VAR num a;
        VAR num b;
        VAR num c;
        VAR num d;
        VAR num e;
        VAR num f;
        VAR num x;
        VAR num y;
        VAR num x1;
        VAR num y1;
        VAR num x2;
        VAR num y2;
        VAR num x3;
        VAR num y3;

        x1:=p1.trans.x;
        x2:=p2.trans.x;
        x3:=p3.trans.x;
        y1:=p1.trans.y;
        y2:=p2.trans.y;
        y3:=p3.trans.y;
        a:=2*(x2-x1);
        b:=2*(y2-y1);
        c:=x2*x2+y2*y2-x1*x1-y1*y1;
        d:=2*(x3-x2);
        e:=2*(y3-y2);
        f:=x3*x3+y3*y3-x2*x2-y2*y2;
        x:=(b*f-e*c)/(b*d-e*a);
        y:=(d*c-a*f)/(b*d-e*a);
        r:=sqrt((x-x1)*(x-x1)+(y-y1)*(y-y1));
        p_center.trans.x:=x;
        p_center.trans.y:=y;
    ENDPROC




ENDMODULE