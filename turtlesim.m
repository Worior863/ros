
% setenv('ROS_IP', '192.168.0.101')
% setenv('ROS_MASTER_URI', 'http://192.168.0.105:11311')


sterowanie = rospublisher('/turtle1/cmd_vel');
pozycja = rossubscriber('turtle1/pose');    

% wiadomosc.Linear.X = 0;
% wiadomosc.Linear.Y = 0;
% wiadomosc.Angular.Z = 0;
% 

%% 
% 
% while(1)
% 
%% sine
% for i = 0:0.25:10
%     
% send(sterowanie,wiadomosc);
% wiadomosc.Angular.Z = sin(i*pi);
% wiadomosc.Linear.X = 1;
% 
% % polozenie = receive (pozycja, 1);
% % x = polozenie.X;
% % y = polozenie.Y;
% % 
% % theta = polozenie.Theta;
% % v=0.2;
% % w = -theta+pi/2;
% % 
% % wiadomosc.Linear.X = v;
% % wiadomosc.Angular.Z = w;
% 
% send(sterowanie,wiadomosc);
% pause(1);
% end
% % 
% % end
% 
% 
% 
% %% sine
% 
% 
% for i = -2*pi:0.25:2*pi
%     send(sterowanie,wiadomosc);
%     wiadomosc.Angular.Z = sin(i*pi);
%     wiadomosc.Linear.X = wiadomosc.Linear.X - 0.5;
% 
% end
%% d

% wiadomosc = rosmessage(sterowanie.MessageType);

% while(1) 
% polozenie = receive (pozycja, 1);
% x = polozenie.X;
% y = polozenie.Y;
% theta = polozenie.Theta;
% 
% e = sqrt( (x^2) +  (y^2) );
% alfa = atan2(y,x) - theta;
% beta = alfa + theta;
% 
% w = sin(alfa) * cos(alfa) + ((beta * sin(alfa) * cos(alfa))/alfa);
% v = -e*cos(alfa);
% 
% wiadomosc = rosmessage(sterowanie.MessageType);
% wiadomosc.Linear.X = v;
% wiadomosc.Angular.Z = -w;
%  
% 
% send(sterowanie,wiadomosc);
% pause(1);
% 
% end

%% circle
% wiadomosc = rosmessage(sterowanie.MessageType);
% 
% while(1)
%  
% polozenie = receive (pozycja, 1);
% x = polozenie.X;
% y = polozenie.Y;
% theta = polozenie.Theta;
% 
% 
% w = pi;
% v = 3;
% 
% wiadomosc.Linear.X = v;
% wiadomosc.Angular.Z = w;
% send(sterowanie,wiadomosc);
% pause(0.5);
% 
% end

%% spiral
% 
% wiadomosc = rosmessage(sterowanie.MessageType);
% 
% for i = 1:10
% wiadomosc.Linear.X = v+i ;
% wiadomosc.Angular.Z = w;
% send(sterowanie,wiadomosc);
% pause(0.5);
% end

%% to point

wiadomosc = rosmessage(sterowanie.MessageType);

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





