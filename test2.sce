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
            printf("Port 4 available\n")
          else
            printf("Port over board!\n")
            abort
          end
disp('1')
ret = slUMount(h)
