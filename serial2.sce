COMPORT=8;
// mount library on handle "1"
//slLoad();
h=slMount()

// handle "1": check availability of specified COM port
slCheck(h,COMPORT)

// handle "1": configure port
slConfig(h,9600,8,0,1);

// handle "1": open port
if slOpen(h,COMPORT) then
    printf("Port 8 open\n")
else
    printf("Port over board!\n")
    abort
end

n=300;
i=2;
t=1;
prevdata=0;
prevdata2=0;
data=0;
data2=0;

//h=openserial(8,"9600,n,8,1",blocking=%t);
//data=zeros(n*10);

f=figure('figure_position',[600,50],'figure_size',[656,532],'auto_resize','on','background',[33],'figure_name','Graphic window number %d');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.stopb=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.9,0.9,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','STOP','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','stopb','Callback','stopb_callback(handles)')

//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////

function stopb_callback(handles)
//Write your callback for  stopb  here
//slClose(h);
slUMount(h);
abort;
endfunction

plot(0,20)
a=gca(); // Handle on axes entity
//a.x_location = "origin"; 
a.y_location = "origin";
//f.figure_size= [100,530];
tic();
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
    //set(a,'tight_limits',"on");
    a.x_location = "middle";
    a.data_bounds=[i-100,-255;i+1,255];
    drawnow();
    a.tight_limits(1);
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
ret = slUMount(h);
   


