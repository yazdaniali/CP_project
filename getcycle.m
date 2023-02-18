function [Cycle_points_R,Cycle_points_L] = getcycle()

disp(' ~~~ Please Select Sample Marker Data File ~~~ ');
[name_samp,path_samp] = uigetfile('*.xlsx');
Loc_samp_marker = [path_samp,name_samp];
S = xlsread(Loc_samp_marker);
S(isnan(S))=0;

Heel_R_x = S(:,1);
Heel_L_x = S(:,5);
n = length(Heel_R_x);
tt = n / 120;
t = 0:1/120:tt;

t(n+1)=[];

for i=1:n-1
    Vx_H_R(i) = ( Heel_R_x(i+1) - Heel_R_x(i) )*120;
    Vx_H_L(i) = ( Heel_L_x(i+1) - Heel_L_x(i) )*120;
end

Vx_H_R(n)=Vx_H_R(n-1);
Vx_H_L(n)=Vx_H_L(n-1);

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

Cycle_points_R = Q_R(QQ_R);
Cycle_points_L = Q_L(QQ_L);
