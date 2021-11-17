MODULE My_Pallet
    
!    VAR num Row;    !hang
!    VAR num Column; !lie
    VAR num row_Height;
    VAR num Column_Width;
    VAR num Row:=3; 
    VAR num Column:=2; 

    VAR num RowUnload;
    VAR num ColumnUnload;
    VAR robtarget pallet_Col; 
    VAR robtarget pallet_Row;
    VAR robtarget pianyi;
     
    PROC Pallet_Def(num row_num,num column_num)
        Row:=Row;
        Column:=Column;
        pallet_Col.trans.x:=(Point_Pallet1.trans.x-Point_Pallet0.trans.x)/(Column-1);
        pallet_Col.trans.y:=(Point_Pallet1.trans.y-Point_Pallet0.trans.y)/(Column-1);
        pallet_Col.trans.z:=(Point_Pallet1.trans.z-Point_Pallet0.trans.z)/(Column-1);
        pallet_Col.rot:=OrientZYX((EulerZYX(\Z,Point_Pallet1.rot)-EulerZYX(\Z,Point_Pallet1.rot))/(Column-1),0,0);

        pallet_Row.trans.x:=(Point_Pallet2.trans.x-Point_Pallet0.trans.x)/(Row-1);
        pallet_Row.trans.y:=(Point_Pallet2.trans.y-Point_Pallet0.trans.y)/(Row-1);
        pallet_Row.trans.z:=(Point_Pallet2.trans.z-Point_Pallet0.trans.z)/(Row-1);
        pallet_Row.rot:=OrientZYX((EulerZYX(\Z,Point_Pallet2.rot)-EulerZYX(\Z,Point_Pallet0.rot))/(Row-1),0,0);

    ENDPROC
    
    PROC Pallet_Def2(robtarget Point_Pallet0,robtarget Point_Pallet3)
        pianyi.trans.x:=Point_Pallet1.trans.x-Point_Pallet0.trans.x;
        pianyi.trans.y:=Point_Pallet1.trans.y-Point_Pallet0.trans.y;
        pianyi.trans.z:=Point_Pallet1.trans.z-Point_Pallet0.trans.z;
        pianyi.rot:=OrientZYX((EulerZYX(\Z,Point_Pallet1.rot)-EulerZYX(\Z,Point_Pallet1.rot)),0,0);
    ENDPROC

    FUNC robtarget GetPallet(num p)
        VAR num nRow;!hang
        VAR num nCol;!lie
        VAR robtarget pt;
        VAR robtarget pick_p;
        VAR robtarget pos;
        pick_p:=Point_Pallet0;
        pos:=Point_Pallet2;
        Pallet_Def 3,2;

        IF (p<=(Row*Column)) THEN
            nRow:=(p-1) DIV Column; !deshu
            
            nCol:=(p-1) MOD Column; !yushu
            
            pt.trans.x:=Point_Pallet0.trans.x+pallet_Row.trans.x*nRow;
            pt.trans.y:=Point_Pallet0.trans.y+pallet_Row.trans.y*nRow;
            pt.trans.z:=Point_Pallet0.trans.z+pallet_Row.trans.z*nRow;

            pick_p.trans.x:=pt.trans.x+pallet_Col.trans.x*nCol;
            pick_p.trans.y:=pt.trans.y+pallet_Col.trans.y*nCol;
            pick_p.trans.z:=pt.trans.z+pallet_Col.trans.z*nCol;
        ELSE
            pick_p:=Point_Pallet0;
        ENDIF
        RETURN pick_p;
    ENDFUNC


ENDMODULE
