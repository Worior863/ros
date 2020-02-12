%% init 
setenv('ROS_IP', '192.168.0.101');
setenv('ROS_MASTER_URI', 'http://192.168.0.105:11311');

sterowanie = rospublisher('/turtle1/cmd_vel');
pozycja = rossubscriber('turtle1/pose');    

wiadomosc.Linear.X = 0;
wiadomosc.Linear.Y = 0;
wiadomosc.Angular.Z = 0;

wiadomosc = rosmessage(sterowanie.MessageType);

%% circle
for j = 1:5
%  
polozenie = receive (pozycja, 1);
x = polozenie.X;
y = polozenie.Y;
theta = polozenie.Theta;


w = pi;
v = 3;

wiadomosc.Linear.X = v;
wiadomosc.Angular.Z = w;

send(sterowanie,wiadomosc);
pause(1);
end

%% spiral
for i = 1:0.5:3
wiadomosc.Linear.X = v+i ;
wiadomosc.Angular.Z = w;

send(sterowanie,wiadomosc);
pause(1);
end

%% sine
for i = 0:0.25:3
    
send(sterowanie,wiadomosc);
wiadomosc.Angular.Z = sin(i*pi);
wiadomosc.Linear.X = 1;

send(sterowanie,wiadomosc);
pause(0.5);
end

%% to point 
while(1)

polozenie=receive(pozycja,1);
    if polozenie.X==5 && polozenie.Y==5
        break;  
    end
X=polozenie.X-5;
Y=polozenie.Y-5;

Theta=polozenie.Theta;
alfa=atan2(Y,X)-Theta;
beta=alfa+Theta;

w=sin(alfa)*cos(alfa)+((beta*sin(alfa)*cos(alfa))/alfa)+alfa;
e=sqrt((X^2)+(Y^2));
v=-e*cos(alfa);

wiadomosc.Linear.X=v;
wiadomosc.Angular.Z=w;

send(sterowanie,wiadomosc);
end