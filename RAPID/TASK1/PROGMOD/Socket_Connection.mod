MODULE Socket_Connection
    !*********************Define TCP/IP Connection socket****************************************************************!
    VAR socketdev server_socket;
    VAR socketdev client_socket;
    VAR string receive_string;
    VAR string client_ip;
    VAR socketstatus socket_state;


    PROC TCP_Connections()
        !*********************Create server socket,****************************************************************!
        WHILE TRUE DO
            socket_state:=SocketGetStatus(server_socket);
            IF socket_state=SOCKET_LISTENING THEN
                GOTO Close_Socket;
            ENDIF

            SocketCreate server_socket;
            !*****Create socket
 
            SocketBind server_socket,server_socket_IP,host_prot;
            !*****Bind socket to Controller network wan IP,prot
            SocketListen server_socket;
            !*****Listening server socket 

            socket_state:=SocketGetStatus(server_socket);
            !*****socket
            IF socket_state=SOCKET_LISTENING THEN
                SocketAccept server_socket,client_socket\ClientAddress:=client_ip;
                SocketSend client_socket\Str:= "Ready\0D\0A";
                
                !*****wait client socket come,save client socket,ip
                WHILE true DO
                    socket_state:=SocketGetStatus(client_socket);
                    IF socket_state=SOCKET_CONNECTED THEN
                        
                        SocketReceive client_socket\Str:=receive_string\Time:=WAIT_MAX;
                        !*****read client data save to receive_string

                        receive_string:=Tcp_Command(receive_string);
                        !*****Command client data by function Tcp_Command
                        SocketSend client_socket\Str:=receive_string;
                        !*****Send Command result to client socket

                    ELSE
                        GOTO Close_Socket;
                    ENDIF

                ENDWHILE



            ENDIF

            Close_Socket:
            SocketClose server_socket;
            SocketClose client_socket;

        ENDWHILE

    ERROR
        IF ERRNO=ERR_SOCK_TIMEOUT THEN

            RETRY;

        ENDIF
        IF ERRNO=ERR_SOCK_CLOSED THEN


            ExitCycle;

        ENDIF
    UNDO

        SocketClose server_socket;

        SocketClose client_socket;


    ENDPROC



ENDMODULE