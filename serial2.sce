COMPORT=8;
// mount library on handle "1"
//slLoad();
h=slMount();

// handle "1": check availability of specified COM port
slCheck(h,COMPORT);

// handle "1": configure port
slConfig(h,9600,8,0,1);

// handle "1": open port
slOpen(h,COMPORT);

n=300;
i=2;
t=1;
prevdata=0;
prevdata2=0;
data=0;
data2=0;
tic();
//h=openserial(8,"9600,n,8,1",blocking=%t);
//data=zeros(n*10);
plot(0,20)
a=gca(); // Handle on axes entity
a.x_location = "origin"; 
a.y_location = "origin";
f=gcf();
//f.figure_size= [100,530];
while(i<=n)
    //h=openserial(8,"9600,n,8,1",blocking=%t);
    i=2+(10*toc());
    //TCL_EvalStr("flush.h");
    //fort("flush",h,1,"i","out",[1,1],2,"i")
    //TCL_EvalStr("flush "+h)
    //[q,flags]=serialstatus(h)
    //disp(q)
    //writeserial(h,'t');
    //data(i)=ascii(readserial(h,1));
    slFlush(h);
    if slReadByte(h,1)==255 then     
        data=slReadByte(h,1);
        //data=slReadArray(h);
        data2=slReadByte(h,1);
        data=data-100;
        data2=2*(data2-127);
    //data=data-100;
    plot(i,data,'b-o');
    xsegs([t,i],[prevdata,data]);
    plot(i,data2,'r-o');
    xsegs([t,i],[prevdata2,data2]);
    drawnow();
    t=i;
    prevdata=data;
    prevdata2=data2;
    //disp(data);
    //disp(data2);
    //disp(--------------);
    end
    //key=input();
    //if key ~= ' ' then
    //    writeserial(h,key);
    //end
    //closeserial(h);
    //sleep(10); // wait a little to give data a chance to arrive
    //disp("----------------------");
end
//closeserial(h);
slClose(h);    
