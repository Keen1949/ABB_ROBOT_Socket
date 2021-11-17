MODULE Socket_Commands
    var string strData{Order_Otr_Num};

    FUNC string Tcp_Command(string str)

        var string strNull{Order_Otr_Num};
        strData:=strNull;
        ParseStr str,",";

        TEST strData{1}

        CASE "Init":
            str:=Init(strData{2})+"\0D\0A";

        CASE "Pick12":
            str:=Pick12(strData{2},strData{3},strData{4},strData{5},strData{6})+"\0D\0A";
            
        CASE "Pick1":
            str:=Pick1(strData{2},strData{3},strData{4},strData{5},strData{6})+"\0D\0A";
            
        CASE "Pick2":
            str:=Pick2(strData{2},strData{3},strData{4},strData{5},strData{6})+"\0D\0A";           

        CASE "MoveToSnap":
            str:=MoveToSnap(strData{2},strData{3},strData{4})+"\0D\0A";

        CASE "Move":
            str:=MoveTo(strData{2},strData{3},strData{4})+"\0D\0A";

        CASE "Throw":
            str:=Throw(strData{2},strData{3})+"\0D\0A";

        CASE "Assemble":
            str:=Assemble(strData{2},strData{3},strData{4},strData{5},strData{6})+"\0D\0A";

        CASE "GetPos":
            str:=GetPos()+"\0D\0A";
        CASE "GoSnap":
            str:=GoSnap()+"\0D\0A";


        CASE "MoveToDym":
            str:=MoveToDym(strData{2})+"\0D\0A";


        CASE "CaliCam":
            str:=CaliCam(strData{2})+"\0D\0A";
        CASE "TranCamDown":
            str:=TranCam()+"\0D\0A";

        DEFAULT:
            str:=strData{1}+","+"0,1,Unknown command received"+"\0D\0A";
        ENDTEST

        RETURN str;
    ENDFUNC




ENDMODULE
