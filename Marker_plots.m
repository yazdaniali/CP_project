clear;clc;

disp(' ~~~ Please Select Sample Marker Data File ~~~ ');
[name_samp,path_samp] = uigetfile('*.xlsx');
Loc_samp = [path_samp,name_samp];
S = xlsread(Loc_samp);
S(isnan(S))=0;

%% %%%%%%%%%%%%%%%%%%%%%%%%%    displacement(x)    %%%%%%%%%%%%%%%%%%%

Heel_R_x = S(:,1);

n = length(Heel_R_x);
tt = n / 120;
t = 0:1/120:tt;
t(n+1)=[];

Heel_R_z = S(:,2);

Toe_L_x = S(:,7);
Toe_L_z = S(:,8);

Heel_L_x = S(:,5);
Heel_L_z = S(:,6);

Toe_R_x = S(:,3);
Toe_R_z = S(:,4);

%% %%%%%%%%%%%%%%%%%%%%%%%%%      Pace(V)          %%%%%%%%%%%%%%%%%%%

for i=1:n-1
    Vx_H_R(i) = ( Heel_R_x(i+1) - Heel_R_x(i) )*120;
    Vz_H_R(i) = ( Heel_R_z(i+1) - Heel_R_z(i) )*120;
    Vx_T_L(i) = ( Toe_L_x(i+1) - Toe_L_x(i) )*120;
    Vz_T_L(i) = ( Toe_L_z(i+1) - Toe_L_z(i) )*120;
    Vx_H_L(i) = ( Heel_L_x(i+1) - Heel_L_x(i) )*120;
    Vz_H_L(i) = ( Heel_L_z(i+1) - Heel_L_z(i) )*120;
    Vx_T_R(i) = ( Toe_R_x(i+1) - Toe_R_x(i) )*120;
    Vz_T_R(i) = ( Toe_R_z(i+1) - Toe_R_z(i) )*120;
end

Vx_H_R(n)=Vx_H_R(n-1);
Vz_H_R(n)=Vz_H_R(n-1);
Vx_T_L(n)=Vx_T_L(n-1);
Vz_T_L(n)=Vz_T_L(n-1);
Vx_H_L(n)=Vx_H_L(n-1);
Vz_H_L(n)=Vz_H_L(n-1);
Vx_T_R(n)=Vx_T_R(n-1);
Vz_T_R(n)=Vz_T_R(n-1);

ww1 = -min(Vx_H_R);
www2= max(Vx_H_R);
if ww1>www2
    Vx_H_R = -Vx_H_R;
end

ww3 = -min(Vx_H_L);
www4= max(Vx_H_L);
if ww3>www4
    Vx_H_L = -Vx_H_L;
end

ww5 = -min(Vx_T_R);
www6= max(Vx_T_R);
if ww5>www6
    Vx_T_R = -Vx_T_R;
end

ww7 = -min(Vx_T_L);
www8= max(Vx_T_L);
if ww7>www8
    Vx_T_L = -Vx_T_L;
end

%% %%%%%%%%%%%%%%%%%%%%%%%%     PLots       %%%%%%%%%%%%%%%%%%%%%%%%

subplot(4,4,1);
plot(Heel_R_x,Heel_R_z,'k');
title('Right Heel Relative displacement');
xlabel('x');
ylabel('z');

subplot(4,4,2);
plot(t,Heel_R_x , 'b',t,Heel_R_z,'r')
title('Right Heel displacements in time');
legend('x direction','z direction');
xlabel('t');
ylabel('x,z');

subplot(4,4,3);
plot(t,Vx_H_R,'b');
title('Right Heel pace in x ');
xlabel('t');
ylabel('Vx(t)');

subplot(4,4,4);
plot(t,Vz_H_R,'r');
title('Right Heel pace in z ');
xlabel('t');
ylabel('Vz(t)');

subplot(4,4,5);
plot(Toe_R_x,Toe_R_z,'k');
title('Right Toe Relative displacement');
xlabel('x');
ylabel('z');

subplot(4,4,6);
plot(t,Toe_R_x , 'b',t,Toe_R_z,'r')
title('Right Toe displacements in time');
legend('x direction','z direction');
xlabel('t');
ylabel('x,z');

subplot(4,4,7);
plot(t,Vx_T_R,'b');
title('Right Toe pace in x ');
xlabel('t');
ylabel('Vx(t)');


subplot(4,4,8);
plot(t,Vz_T_R,'r');
title('Right Toe pace in z ');
xlabel('t');
ylabel('Vz(t)');


subplot(4,4,9);
plot(Heel_L_x,Heel_L_z,'k');
title('Left Heel Relative displacement');
xlabel('x');
ylabel('z');

subplot(4,4,10);
plot(t,Heel_L_x , 'b',t,Heel_L_z,'r')
title('Left Heel displacements in time');
legend('x direction','z direction');
xlabel('t');
ylabel('x,z');

subplot(4,4,11);
plot(t,Vx_H_L,'b');
title('Left Heel pace in x ');
xlabel('t');
ylabel('Vx(t)');


subplot(4,4,12);
plot(t,Vz_H_L,'r');
title('Left Heel pace in z ');
xlabel('t');
ylabel('Vz(t)');


subplot(4,4,13);
plot(Toe_L_x,Toe_L_z,'k');
title('Left Toe Relative displacement');
xlabel('x');
ylabel('z');

subplot(4,4,14);
plot(t,Toe_L_x , 'b',t,Toe_L_z,'r')
title('Left Toe displacements in time');
legend('x direction','z direction');
xlabel('t');
ylabel('x,z');

subplot(4,4,15);
plot(t,Vx_T_L,'b');
title('Left Toe pace in x ');
xlabel('t');
ylabel('Vx(t)');


subplot(4,4,16);
plot(t,Vz_T_L,'r');
title('Left Toe pace in z ');
xlabel('t');
ylabel('Vz(t)');

%%
% subplot(4,1,1);
% plot(t,Vx_H_R,'b');
% title('Right Heel pace in x ');
% xlabel('t');
% ylabel('Vx(t)');
% subplot(4,1,2);
% plot(t,Vx_T_R,'b');
% title('Right Toe pace in x ');
% xlabel('t');
% ylabel('Vx(t)');
% subplot(4,1,3);
% plot(t,Vx_H_L,'b');
% title('Left Heel pace in x ');
% xlabel('t');
% ylabel('Vx(t)');
% subplot(4,1,4);
% plot(t,Vx_T_L,'b');
% title('Left Toe pace in x ');
% xlabel('t');
% ylabel('Vx(t)');
% 
% 
% 
% subplot(4,1,1);
% plot(t,Vz_H_R,'r');
% title('Right Heel pace in z ');
% xlabel('t');
% ylabel('Vz(t)');
% subplot(4,1,2);
% plot(t,Vz_T_R,'r');
% title('Right Toe pace in z ');
% xlabel('t');
% ylabel('Vz(t)');
% subplot(4,1,3);
% plot(t,Vz_H_L,'r');
% title('Left Heel pace in z ');
% xlabel('t');
% ylabel('Vz(t)');
% subplot(4,1,4);
% plot(t,Vz_T_L,'r');
% title('Left Toe pace in z ');
% xlabel('t');
% ylabel('Vz(t)');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

j=1;
k=1;
for i=40:n
    if Vx_H_R(i-1) > 20 & Vx_H_R(i) < 20
        Q_R(j)= i-1;
        j=j+1;
    end
     if Vx_H_L(i-1) > 20 & Vx_H_L(i) < 20
        Q_L(k)= i-1;
        k=k+1;
     end
end

n1=length(Q_R) ;
n2=length(Q_L) ;
jj=2;
kk=2;
QQ_R(1)=1;
QQ_L(1)=1;
for i=1:n1
    if i~=QQ_R(jj-1)
        continue
    end
    for ii=2:n1 
        if t(Q_R(ii)) - t(Q_R(i)) > 0.9
           QQ_R(jj) = ii;
           jj=jj+1;
           break
        end
    end
    if jj==5
        break
    end
end

for i=1:n2
    if i~=QQ_L(kk-1)
        continue
    end
    for ii=2:n2 
        if t(Q_L(ii)) - t(Q_L(i)) > 0.9
           QQ_L(kk) = ii;
           kk=kk+1;
           break
        end
    end
    if kk==5
        break
    end
end

Cycle_points_R = Q_R(QQ_R)
Cycle_points_L = Q_L(QQ_L)
