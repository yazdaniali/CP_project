clear;clc;

disp(' ~~~ Please Select Sample Data File ~~~ ');
pause(2);
[name_samp,path_samp] = uigetfile('*.xlsx');

Loc_samp = [path_samp,name_samp];

Sample = xlsread(Loc_samp);
Sample(isnan(Sample))=0;

disp(' ~~~ Please Select Sample Marker Data File ~~~ ');
[name_samp,path_samp] = uigetfile('*.xlsx');
Loc_samp_marker = [path_samp,name_samp];
S = xlsread(Loc_samp_marker);
S(isnan(S))=0;

Heel_R_x = S(:,1);
Heel_L_x = S(:,5);

Toe_R_x = S(:,3);
Toe_L_x = S(:,7);

n = length(Heel_R_x);
tt = n / 120;
t = 0:1/120:tt;

t(n+1)=[];

for i=1:n-1
    Vx_H_R(i) = ( Heel_R_x(i+1) - Heel_R_x(i) )*120;
    Vx_H_L(i) = ( Heel_L_x(i+1) - Heel_L_x(i) )*120;
    Vx_T_R(i) = ( Toe_R_x(i+1) - Toe_R_x(i) )*120;
    Vx_T_L(i) = ( Toe_L_x(i+1) - Toe_L_x(i) )*120;

end

Vx_H_R(n)=Vx_H_R(n-1);
Vx_H_L(n)=Vx_H_L(n-1);
Vx_T_R(n)=Vx_T_R(n-1);
Vx_T_L(n)=Vx_T_L(n-1);


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
if ww5>www6
    Vx_T_L = -Vx_T_L;
end



j=1;
k=1;
r=1;
o=1;
for i=40:n
    if Vx_H_R(i-1) > 20 & Vx_H_R(i) < 20
        Q_R(j)= i-1;
        j=j+1;
    end
     if Vx_H_L(i-1) > 20 & Vx_H_L(i) < 20
        Q_L(k)= i-1;
        k=k+1;
     end
     if Vx_T_R(i-1) < 250 & Vx_T_R(i) > 250
         G_R(r)=  i-1;
         r=r+1;
     end
     
     if Vx_T_L(i-1) < 250 & Vx_T_L(i) > 250
         G_L(o)=  i-1;
         o=o+1;
     end
end
G_L=G_L(2:length(G_L));
G_R=G_R(2:length(G_R));

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

ll = min(length(Cycle_points_R) , length(Cycle_points_L));



%%

% F = Sample(:,7);
% n = length(F);
% j=1;k=1;
% for i=1:n
%     if F(i)==0
%         SW(j)= i;
%         j=j+1;
%     else
%         ST(k)=i;
%         k=k+1;
%     end
% end


A_L = Sample(:,1);
A_R = Sample(:,3);
H_L = Sample(:,5);
H_R = Sample(:,6);
K_L = Sample(:,2);
K_R = Sample(:,4);

ST_A_L=zeros(length(A_L),1);
ST_A_R=zeros(length(A_R),1);
SW_A_L=zeros(length(A_L),1);
SW_A_R=zeros(length(A_R),1);

for i=2:ll
ST_A_L = cat(1,ST_A_L,A_L(Cycle_points_L(i-1):G_L(i-1)));
ST_A_R = cat(1,ST_A_R,A_R(Cycle_points_R(i-1):G_R(i-1)));
SW_A_L = cat(1,SW_A_L,A_L(G_L(i-1):Cycle_points_L(i)));
SW_A_R = cat(1,SW_A_R,A_R(G_R(i-1):Cycle_points_R(i)));
end

max_SW_A_L = max(SW_A_L);
max_ST_A_L = max(ST_A_L);
max_SW_A_R = max(SW_A_R);
max_ST_A_R = max(ST_A_R);


F_K_L = max(K_L) - min(K_L);
F_K_R = max(K_R) - min(K_R);
F_H_L = max(H_L) - min(H_L);
F_H_R = max(H_R) - min(H_R);


%% %%%%%%%%%%%%%%%%%%%  Index  %%%%%%%%%%%%%%%%%%%

 %Left Foot
 
if max_SW_A_L >(-7) & max_SW_A_L<5 & max_ST_A_L>6 & max_ST_A_L<18 & F_K_L>43 & F_K_L<58 & F_H_L>37 & F_H_L<51
    disp('***   Left Foot : Group 1   ***');
elseif max_SW_A_L >(-27) & max_SW_A_L<(-5) & max_ST_A_L>(-17) & max_ST_A_L<3 & F_K_L>50 & F_K_L<70 & F_H_L>40 & F_H_L<52
    disp('***   Left Foot : Group 2   ***');
elseif max_SW_A_L >(-29) & max_SW_A_L<(-13) & max_ST_A_L>(-18) & max_ST_A_L<6 & F_K_L>29 & F_K_L<45 & F_H_L>36 & F_H_L<56
    disp('***   Left Foot : Group 3   ***');
elseif max_SW_A_L >(-24) & max_SW_A_L<(-4) & max_ST_A_L>(-22) & max_ST_A_L<6 & F_K_L>21 & F_K_L<45 & F_H_L>25 & F_H_L<33
    disp('***   Left Foot : Group 4   ***');
else
    disp('***  Left Foot : Absent Label   ***');
end


 %Right Foot

 if max_SW_A_R >(-7) & max_SW_A_R<5 & max_ST_A_R>6 & max_ST_A_R<18 & F_K_R>43 & F_K_R<58 & F_H_R>37 & F_H_R<51
    disp('***  Right Foot : Group 1   ***');
elseif max_SW_A_R >(-27) & max_SW_A_R<(-5) & max_ST_A_R>(-17) & max_ST_A_R<3 & F_K_R>50 & F_K_R<70 & F_H_R>40 & F_H_R<52
    disp('***  Right Foot : Group 2   ***');
elseif max_SW_A_R >(-29) & max_SW_A_R<(-13) & max_ST_A_R>(-18) & max_ST_A_R<6 & F_K_R>29 & F_K_R<45 & F_H_R>36 & F_H_R<56
    disp('***  Right Foot : Group 3   ***');
elseif max_SW_A_R >(-24) & max_SW_A_R<(-4) & max_ST_A_R>(-22) & max_ST_A_R<6 & F_K_R>21 & F_K_R<45 & F_H_R>25 & F_H_R<33
    disp('***  Right Foot : Group 4   ***');
else
    disp('***  Right Foot : Absent Label   ***');
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%   Table   %%%%%%%%%%%%%%%%%%%%5

if max_SW_A_R >(-7) & max_SW_A_R<5
    RG1_1 = 'yes';
    RG1_2 = 'no';
    RG1_3 = 'no';
    RG1_4 = 'no';
elseif max_SW_A_R >(-27) & max_SW_A_R<(-5)
    RG1_1 = 'no';
    RG1_2 = 'yes';
    RG1_3 = 'no';
    RG1_4 = 'no';
elseif max_SW_A_R >(-29) & max_SW_A_R<(-13)
    RG1_1 = 'no';
    RG1_2 = 'no';
    RG1_3 = 'yes';
    RG1_4 = 'no';
elseif max_SW_A_R >(-24) & max_SW_A_R<(-4)
    RG1_1 = 'no';
    RG1_2 = 'no';
    RG1_3 = 'no';
    RG1_4 = 'yes';
else
    RG1_1 = 'no';
    RG1_2 = 'no';
    RG1_3 = 'no';
    RG1_4 = 'no';
end

if max_ST_A_R>6 & max_ST_A_R<18
    RG2_1 = 'yes';
    RG2_2 = 'no';
    RG2_3 = 'no';
    RG2_4 = 'no';
elseif max_ST_A_R>(-17) & max_ST_A_R<3
    RG2_1 = 'no';
    RG2_2 = 'yes';
    RG2_3 = 'no';
    RG2_4 = 'no';
elseif max_ST_A_R>(-18) & max_ST_A_R<6
    RG2_1 = 'no';
    RG2_2 = 'no';
    RG2_3 = 'yes';
    RG2_4 = 'no';
elseif max_ST_A_R>(-22) & max_ST_A_R<6
    RG2_1 = 'no';
    RG2_2 = 'no';
    RG2_3 = 'no';
    RG2_4 = 'yes';
else
    RG2_1 = 'no';
    RG2_2 = 'no';
    RG2_3 = 'no';
    RG2_4 = 'no';
end

if F_K_R>43 & F_K_R<58
    RG3_1 = 'yes';
    RG3_2 = 'no';
    RG3_3 = 'no';
    RG3_4 = 'no';
elseif F_K_R>50 & F_K_R<70
    RG3_1 = 'no';
    RG3_2 = 'yes';
    RG3_3 = 'no';
    RG3_4 = 'no';
elseif F_K_R>29 & F_K_R<45
    RG3_1 = 'no';
    RG3_2 = 'no';
    RG3_3 = 'yes';
    RG3_4 = 'no';
elseif F_K_R>21 & F_K_R<45
    RG3_1 = 'no';
    RG3_2 = 'no';
    RG3_3 = 'no';
    RG3_4 = 'yes';
else
    RG3_1 = 'no';
    RG3_2 = 'no';
    RG3_3 = 'no';
    RG3_4 = 'no';
end

if F_H_R>37 & F_H_R<51
    RG4_1 = 'yes';
    RG4_2 = 'no';
    RG4_3 = 'no';
    RG4_4 = 'no';
elseif F_H_R>40 & F_H_R<52
    RG4_1 = 'no';
    RG4_2 = 'yes';
    RG4_3 = 'no';
    RG4_4 = 'no';
elseif F_H_R>36 & F_H_R<56
    RG4_1 = 'no';
    RG4_2 = 'no';
    RG4_3 = 'yes';
    RG4_4 = 'no';
elseif F_H_R>25 & F_H_R<33
    RG4_1 = 'no';
    RG4_2 = 'no';
    RG4_3 = 'no';
    RG4_4 = 'yes';
else
    RG4_1 = 'no';
    RG4_2 = 'no';
    RG4_3 = 'no';
    RG4_4 = 'no';
end


Rot_R_joints = {'Max DF of Right Ankle in swing phase';'Max DF of Right Ankle in stance phase';'total F&E of Right Knee';'total F&E of Right Hip'};

Group_1_R = {RG1_1;RG1_2;RG1_3;RG1_4};
Group_2_R = {RG2_1;RG2_2;RG2_3;RG2_4};
Group_3_R = {RG3_1;RG3_2;RG3_3;RG3_4};
Group_4_R = {RG4_1;RG4_2;RG4_3;RG4_4};

T_R = table(Rot_R_joints,Group_1_R,Group_2_R,Group_3_R,Group_4_R)




if max_SW_A_L >(-7) & max_SW_A_L<5
    LG1_1 = 'yes';
    LG1_2 = 'no';
    LG1_3 = 'no';
    LG1_4 = 'no';
elseif max_SW_A_L >(-27) & max_SW_A_L<(-5)
    LG1_1 = 'no';
    LG1_2 = 'yes';
    LG1_3 = 'no';
    LG1_4 = 'no';
elseif max_SW_A_L >(-29) & max_SW_A_L<(-13)
    LG1_1 = 'no';
    LG1_2 = 'no';
    LG1_3 = 'yes';
    LG1_4 = 'no';
elseif max_SW_A_L >(-24) & max_SW_A_L<(-4)
    LG1_1 = 'no';
    LG1_2 = 'no';
    LG1_3 = 'no';
    LG1_4 = 'yes';
else
    LG1_1 = 'no';
    LG1_2 = 'no';
    LG1_3 = 'no';
    LG1_4 = 'no';
end

if max_ST_A_L>6 & max_ST_A_L<18
    LG2_1 = 'yes';
    LG2_2 = 'no';
    LG2_3 = 'no';
    LG2_4 = 'no';
elseif max_ST_A_L>(-17) & max_ST_A_L<3
    LG2_1 = 'no';
    LG2_2 = 'yes';
    LG2_3 = 'no';
    LG2_4 = 'no';
elseif max_ST_A_L>(-18) & max_ST_A_L<6
    LG2_1 = 'no';
    LG2_2 = 'no';
    LG2_3 = 'yes';
    LG2_4 = 'no';
elseif max_ST_A_L>(-22) & max_ST_A_L<6
    LG2_1 = 'no';
    LG2_2 = 'no';
    LG2_3 = 'no';
    LG2_4 = 'yes';
else
    LG2_1 = 'no';
    LG2_2 = 'no';
    LG2_3 = 'no';
    LG2_4 = 'no';
end

if F_K_L>43 & F_K_L<58
    LG3_1 = 'yes';
    LG3_2 = 'no';
    LG3_3 = 'no';
    LG3_4 = 'no';
elseif F_K_L>50 & F_K_L<70
    LG3_1 = 'no';
    LG3_2 = 'yes';
    LG3_3 = 'no';
    LG3_4 = 'no';
elseif F_K_L>29 & F_K_L<45
    LG3_1 = 'no';
    LG3_2 = 'no';
    LG3_3 = 'yes';
    LG3_4 = 'no';
elseif F_K_L>21 & F_K_L<45
    LG3_1 = 'no';
    LG3_2 = 'no';
    LG3_3 = 'no';
    LG3_4 = 'yes';
else
    LG3_1 = 'no';
    LG3_2 = 'no';
    LG3_3 = 'no';
    LG3_4 = 'no';
end

if F_H_L>37 & F_H_L<51
    LG4_1 = 'yes';
    LG4_2 = 'no';
    LG4_3 = 'no';
    LG4_4 = 'no';
elseif F_H_L>40 & F_H_L<52
    LG4_1 = 'no';
    LG4_2 = 'yes';
    LG4_3 = 'no';
    LG4_4 = 'no';
elseif F_H_L>36 & F_H_L<56
    LG4_1 = 'no';
    LG4_2 = 'no';
    LG4_3 = 'yes';
    LG4_4 = 'no';
elseif F_H_L>25 & F_H_L<33
    LG4_1 = 'no';
    LG4_2 = 'no';
    LG4_3 = 'no';
    LG4_4 = 'yes';
else
    LG4_1 = 'no';
    LG4_2 = 'no';
    LG4_3 = 'no';
    LG4_4 = 'no';
end


Rot_L_joints = {'Max DF of Left Ankle in swing phase';'Max DF of Left Ankle in stance phase';'total F&E of Left Knee';'total F&E of Left Hip'};

Group_1_L = {LG1_1;LG1_2;LG1_3;LG1_4};
Group_2_L = {LG2_1;LG2_2;LG2_3;LG2_4};
Group_3_L = {LG3_1;LG3_2;LG3_3;LG3_4};
Group_4_L = {LG4_1;LG4_2;LG4_3;LG4_4};

T_L = table(Rot_L_joints,Group_1_L,Group_2_L,Group_3_L,Group_4_L)






