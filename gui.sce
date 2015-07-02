COMPORT=8;
// mount library on handle "1"
h=slMount();

// handle "1": check availability of specified COM port
slCheck(h,COMPORT);

// handle "1": configure port
slConfig(h,9600,8,0,1);

// handle "1": open port
slOpen(h,COMPORT);

// This GUI file is generated by guibuilder version 3.0
//////////
f=figure('figure_position',[400,50],'figure_size',[656,532],'auto_resize','on','background',[33],'figure_name','Graphic window number %d');
//////////
delmenu(f.figure_id,gettext('File'))
delmenu(f.figure_id,gettext('?'))
delmenu(f.figure_id,gettext('Tools'))
toolbar(f.figure_id,'off')
handles.dummy = 0;
handles.inc_lil=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5,0.6,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','+0.1','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','inclil','Callback','inclil_callback(handles)')
handles.dec_lil=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3,0.6,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','-0.1','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','declil','Callback','declil_callback(handles)')
handles.inc_more=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5,0.5,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','+5','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','incmore','Callback','incmore_callback(handles)')
handles.dec_more=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3,0.5,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','-5','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','decmore','Callback','decmore_callback(handles)')
handles.inc=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.5,0.4,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','+1','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','inc','Callback','inc_callback(handles)')
handles.dec=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.3,0.4,0.1,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','-1','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','dec','Callback','dec_callback(handles)')
handles.list=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[1],'Max',[1],'Min',[0],'Position',[0.4015625,0.7091189,0.0984375,0.15],'Relief','default','SliderStep',[0.01,0.1],'String','Kp|Ki|Kd','Style','listbox','Value',[3],'VerticalAlignment','middle','Visible','on','Tag','list','Callback','list_callback(handles)')


//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////



function inclil_callback(handles)
//Write your callback for  inc_lil  here
slSendByte(h,ascii("3"));
endfunction


function declil_callback(handles)
//Write your callback for  dec_lil  here
slSendByte(h,ascii("6"));
endfunction


function incmore_callback(handles)
//Write your callback for  inc_more  here
slSendByte(h,ascii("2"));
endfunction


function decmore_callback(handles)
//Write your callback for  dec_more  here
slSendByte(h,ascii("5"));
endfunction


function inc_callback(handles)
//Write your callback for  inc  here
slSendByte(h,ascii("1"));
endfunction


function dec_callback(handles)
//Write your callback for  dec  here
slSendByte(h,ascii("4"))
//disp(4);
endfunction


function list_callback(handles)
//Write your callback for  list  here
//data=ascii(get(h,'value'));
data=get(handles.list,'value');
slSendByte(h,data+54);
//disp(data);
endfunction



