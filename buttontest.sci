COMPORT=8;
// mount library on handle "1"
h=slMount();

// handle "1": check availability of specified COM port
slCheck(h,COMPORT);

// handle "1": configure port
slConfig(h,9600,8,0,1);

// handle "1": open port
slOpen(h,COMPORT);
while(1)
    tune=input(" ");
    if tune==0 then
        break;
    else
        slSendByte(h,48+tune);
    end
end
slClose(h);
