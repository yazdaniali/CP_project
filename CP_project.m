

clear;clc;

disp(' ~~~ Please Select Normal Data File ~~~ ');
pause(2);
[name_norm,path_norm] = uigetfile('*.xlsx');

disp(' ~~~ Please Select Sample Data File ~~~ ');
pause(2);
[name_samp,path_samp] = uigetfile('*.xlsx');

Loc_norm = [path_norm,name_norm];
Loc_samp = [path_samp,name_samp];


%% %%%%%%%%%%%%%%%%%   Normal Data   %%%%%%%%%%%%%%

N1_A = xlsread(Loc_norm,'U4:U104'); %Ankle
N2_A = xlsread(Loc_norm,'T4:T104'); %Ankle

for i=1:101
    N_A(i,1) = (N1_A(i) + N2_A(i))/2;
end

N1_K = xlsread(Loc_norm,'O4:O104'); %Knee
N2_K = xlsread(Loc_norm,'N4:N104'); %Knee

for i=1:101
    N_K(i,1) = (N1_K(i) + N2_K(i))/2;
end

x= 0:100;

%% %%%%%%%%%%%%%%%%%   Sample Data   %%%%%%%%%%%%%%

S = xlsread(Loc_samp);
S(isnan(S))=0;
S_A_L = S(:,1);                 %Left_Ankle
S_A_R = S(:,3);                 %Right_Ankle
S_K_L = S(:,2);                 %Left_Knee
S_K_R = S(:,4);                 %Right_Knee


%% %%%%%%%%%%%%%%%%%   Standard Deviation    %%%%%%%%%%%%%%%

for i=1:101
    SD_A(i)= (N2_A(i) - N1_A(i))/2 ;
    SD_K(i)= (N2_K(i) - N1_K(i))/2 ;
end

%% %%%%%%%%%%%%%%%%%%%   getting cycle    %%%%%%%%%%%

[a,b] = getcycle();
ll=min(length(a) , length(b));

switch ll
    case 2
        SS_A_R_1 = S_A_R(a(1) : a(2));
        SS_K_R_1 = S_K_R(a(1) : a(2));
        SS_A_L_1 = S_A_L(b(1) : b(2));
        SS_K_L_1 = S_K_L(b(1) : b(2));
    case 3
        SS_A_R_1 = S_A_R(a(1) : a(2));
        SS_K_R_1 = S_K_R(a(1) : a(2));
        SS_A_L_1 = S_A_L(b(1) : b(2));
        SS_K_L_1 = S_K_L(b(1) : b(2));
        SS_A_R_2 = S_A_R(a(2) : a(3));
        SS_K_R_2 = S_K_R(a(2) : a(3));
        SS_A_L_2 = S_A_L(b(2) : b(3));
        SS_K_L_2 = S_K_L(b(2) : b(3));
    case 4
        SS_A_R_1 = S_A_R(a(1) : a(2));
        SS_K_R_1 = S_K_R(a(1) : a(2));
        SS_A_L_1 = S_A_L(b(1) : b(2));
        SS_K_L_1 = S_K_L(b(1) : b(2));
        SS_A_R_2 = S_A_R(a(2) : a(3));
        SS_K_R_2 = S_K_R(a(2) : a(3));
        SS_A_L_2 = S_A_L(b(2) : b(3));
        SS_K_L_2 = S_K_L(b(2) : b(3));
        SS_A_R_3 = S_A_R(a(3) : a(4));
        SS_K_R_3 = S_K_R(a(3) : a(4));
        SS_A_L_3 = S_A_L(b(3) : b(4));
        SS_K_L_3 = S_K_L(b(3) : b(4));
end



%% %%%%%%%%%%%%%%% Transition %%%%%%%%%%

switch ll
    case 2
        u1 = length(SS_A_R_1);
        for i=0:100
            p_AR1(i+1) = ((i * (u1-1))/(100)) + 1 ;
        end
        P_AR1 = round(p_AR1);

        u2 = length(SS_K_R_1);
        for i=0:100
            p_KR1(i+1) = ((i * (u2-1))/(100)) + 1 ;
        end
        P_KR1 = round(p_KR1);

        u3 = length(SS_A_L_1);
        for i=0:100
            p_AL1(i+1) = ((i * (u3-1))/(100)) + 1 ;
        end
        P_AL1 = round(p_AL1);

        u4 = length(SS_K_L_1);
        for i=0:100
            p_KL1(i+1) = ((i * (u4-1))/(100)) + 1 ;
        end
        P_KL1 = round(p_KL1);
        
    case 3
        u1 = length(SS_A_R_1);
        for i=0:100
            p_AR1(i+1) = ((i * (u1-1))/(100)) + 1 ;
        end
        P_AR1 = round(p_AR1);

        u2 = length(SS_K_R_1);
        for i=0:100
            p_KR1(i+1) = ((i * (u2-1))/(100)) + 1 ;
        end
        P_KR1 = round(p_KR1);

        u3 = length(SS_A_L_1);
        for i=0:100
            p_AL1(i+1) = ((i * (u3-1))/(100)) + 1 ;
        end
        P_AL1 = round(p_AL1);

        u4 = length(SS_K_L_1);
        for i=0:100
            p_KL1(i+1) = ((i * (u4-1))/(100)) + 1 ;
        end
        P_KL1 = round(p_KL1);

        u5 = length(SS_A_R_2);
        for i=0:100
            p_AR2(i+1) = ((i * (u5-1))/(100)) + 1 ;
        end
        P_AR2 = round(p_AR2);

        u6 = length(SS_K_R_2);
        for i=0:100
            p_KR2(i+1) = ((i * (u6-1))/(100)) + 1 ;
        end
        P_KR2 = round(p_KR2);

        u7 = length(SS_A_L_2);
        for i=0:100
            p_AL2(i+1) = ((i * (u7-1))/(100)) + 1 ;
        end
        P_AL2 = round(p_AL2);

        u8 = length(SS_K_L_2);
        for i=0:100
            p_KL2(i+1) = ((i * (u8-1))/(100)) + 1 ;
        end
        P_KL2 = round(p_KL2);
        
    case 4
        u1 = length(SS_A_R_1);
        for i=0:100
            p_AR1(i+1) = ((i * (u1-1))/(100)) + 1 ;
        end
        P_AR1 = round(p_AR1);

        u2 = length(SS_K_R_1);
        for i=0:100
            p_KR1(i+1) = ((i * (u2-1))/(100)) + 1 ;
        end
        P_KR1 = round(p_KR1);

        u3 = length(SS_A_L_1);
        for i=0:100
            p_AL1(i+1) = ((i * (u3-1))/(100)) + 1 ;
        end
        P_AL1 = round(p_AL1);

        u4 = length(SS_K_L_1);
        for i=0:100
            p_KL1(i+1) = ((i * (u4-1))/(100)) + 1 ;
        end
        P_KL1 = round(p_KL1);

        u5 = length(SS_A_R_2);
        for i=0:100
            p_AR2(i+1) = ((i * (u5-1))/(100)) + 1 ;
        end
        P_AR2 = round(p_AR2);

        u6 = length(SS_K_R_2);
        for i=0:100
            p_KR2(i+1) = ((i * (u6-1))/(100)) + 1 ;
        end
        P_KR2 = round(p_KR2);

        u7 = length(SS_A_L_2);
        for i=0:100
            p_AL2(i+1) = ((i * (u7-1))/(100)) + 1 ;
        end
        P_AL2 = round(p_AL2);

        u8 = length(SS_K_L_2);
        for i=0:100
            p_KL2(i+1) = ((i * (u8-1))/(100)) + 1 ;
        end
        P_KL2 = round(p_KL2);

        u9 = length(SS_A_R_3);
        for i=0:100
            p_AR3(i+1) = ((i * (u9-1))/(100)) + 1 ;
        end
        P_AR3 = round(p_AR3);

        u10 = length(SS_K_R_3);
        for i=0:100
            p_KR3(i+1) = ((i * (u10-1))/(100)) + 1 ;
        end
        P_KR3 = round(p_KR3);

        u11 = length(SS_A_L_3);
        for i=0:100
            p_AL3(i+1) = ((i * (u11-1))/(100)) + 1 ;
        end
        P_AL3 = round(p_AL3);

        u12 = length(SS_K_L_3);
        for i=0:100
            p_KL3(i+1) = ((i * (u12-1))/(100)) + 1 ;
        end
        P_KL3 = round(p_KL3);
end

        
        
        




  %P(i): i شماره ی دیتای متناظر با دیتای نرمال در درصد



%% %%%%%%%%%%%%%%%%%   PFKE Index   %%%%%%%%%%%%%%%

switch ll
    case 2
        AAA = 0;                                        %Left_foot_first cycle
        for i=21:46
            AA1 = ( SS_A_L_1(P_AL1(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA1;
        end
        PFKE_A_L_1 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk1 = ( SS_K_L_1(P_KL1(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk1;
        end
        PFKE_K_L_1 = kkk / 26 ;
        AAAA = 0;                                        %Right_foot_first cycle
        for i=21:46
            AAAAA1 = ( SS_A_R_1(P_AR1(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA1;
        end
        PFKE_A_R_1 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk1 = ( SS_K_R_1(P_KR1(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk1;
        end
        PFKE_K_R_1 = kkkk / 26 ;
    case 3
        
        AAA = 0;                                        %Left_foot_first cycle
        for i=21:46
            AA1 = ( SS_A_L_1(P_AL1(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA1;
        end
        PFKE_A_L_1 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk1 = ( SS_K_L_1(P_KL1(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk1;
        end
        PFKE_K_L_1 = kkk / 26 ;
        AAAA = 0;                                        %Right_foot_first cycle
        for i=21:46
            AAAAA1 = ( SS_A_R_1(P_AR1(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA1;
        end
        PFKE_A_R_1 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk1 = ( SS_K_R_1(P_KR1(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk1;
        end
        PFKE_K_R_1 = kkkk / 26 ;
        
        AAA = 0;                                        %Left_foot_second cycle
        for i=21:46
            AA2 = ( SS_A_L_2(P_AL2(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA2;
        end
        PFKE_A_L_2 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk2 = ( SS_K_L_2(P_KL2(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk2;
        end
        PFKE_K_L_2 = kkk / 26 ;
        
        AAAA = 0;                                        %Right_foot_second cycle
        for i=21:46
            AAAAA2 = ( SS_A_R_2(P_AR2(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA2;
        end
        PFKE_A_R_2 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk2 = ( SS_K_R_2(P_KR2(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk2;
        end
        PFKE_K_R_2 = kkkk / 26 ;
        
        PFKE_A_L_avg = ( PFKE_A_L_1 + PFKE_A_L_2 )/2;
        PFKE_A_R_avg = ( PFKE_A_R_1 + PFKE_A_R_2 )/2;
        PFKE_K_L_avg = ( PFKE_K_L_1 + PFKE_K_L_2 )/2;
        PFKE_K_R_avg = ( PFKE_K_R_1 + PFKE_K_R_2 )/2;
        
    case 4
        AAA = 0;                                        %Left_foot_first cycle
        for i=21:46
            AA1 = ( SS_A_L_1(P_AL1(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA1;
        end
        PFKE_A_L_1 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk1 = ( SS_K_L_1(P_KL1(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk1;
        end
        PFKE_K_L_1 = kkk / 26 ;

        AAA = 0;                                        %Left_foot_second cycle
        for i=21:46
            AA2 = ( SS_A_L_2(P_AL2(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA2;
        end
        PFKE_A_L_2 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk2 = ( SS_K_L_2(P_KL2(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk2;
        end
        PFKE_K_L_2 = kkk / 26 ;

        AAA = 0;                                        %Left_foot_third cycle
        for i=21:46
            AA3 = ( SS_A_L_3(P_AL3(i)) - N_A(i)) / SD_A(i);
            AAA = AAA + AA3;
        end
        PFKE_A_L_3 = AAA / 26 ;

        kkk = 0;
        for i=21:46
            kk3 = ( SS_K_L_3(P_KL3(i)) - N_K(i)) / SD_K(i);
            kkk = kkk + kk3;
        end
        PFKE_K_L_3 = kkk / 26 ;


        AAAA = 0;                                        %Right_foot_first cycle
        for i=21:46
            AAAAA1 = ( SS_A_R_1(P_AR1(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA1;
        end
        PFKE_A_R_1 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk1 = ( SS_K_R_1(P_KR1(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk1;
        end
        PFKE_K_R_1 = kkkk / 26 ;

        AAAA = 0;                                        %Right_foot_second cycle
        for i=21:46
            AAAAA2 = ( SS_A_R_2(P_AR2(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA2;
        end
        PFKE_A_R_2 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk2 = ( SS_K_R_2(P_KR2(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk2;
        end
        PFKE_K_R_2 = kkkk / 26 ;

        AAAA = 0;                                        %Right_foot_third cycle
        for i=21:46
            AAAAA3 = ( SS_A_R_3(P_AR3(i)) - N_A(i)) / SD_A(i);
            AAAA = AAAA + AAAAA3;
        end
        PFKE_A_R_3 = AAAA / 26 ;

        kkkk = 0;
        for i=21:46
            kkkkk3 = ( SS_K_R_3(P_KR3(i)) - N_K(i)) / SD_K(i);
            kkkk = kkkk + kkkkk3;
        end
        PFKE_K_R_3 = kkkk / 26 ;
        
        PFKE_A_L_avg = ( PFKE_A_L_1 + PFKE_A_L_2 + PFKE_A_L_3 )/3;
        PFKE_A_R_avg = ( PFKE_A_R_1 + PFKE_A_R_2 + PFKE_A_R_3 )/3;
        PFKE_K_L_avg = ( PFKE_K_L_1 + PFKE_K_L_2 + PFKE_K_L_3 )/3;
        PFKE_K_R_avg = ( PFKE_K_R_1 + PFKE_K_R_2 + PFKE_K_R_3 )/3;
end

        

%% %%%%%%%%%%%%%%%%  Labeling via Scatter Plot   %%%%%%%%%%%%%%%%%%%%%%%

% if PFKE_A_L < -1 & PFKE_K_L < 1                         %Left foot
%     disp(' *** Left foot : True Equinus *** ')
% elseif PFKE_A_L < -1 & PFKE_K_L > 1
%     disp(' *** Left foot : Jump Gait *** ')
% elseif -1<PFKE_A_L & PFKE_A_L<1 & PFKE_K_L > 1
%     disp(' *** Left foot : Apparent Equinus *** ')
% elseif PFKE_A_L > 1 & PFKE_K_L > 1
%     disp(' *** Left foot : Crouch Gait *** ')
% elseif -1<PFKE_A_L & PFKE_A_L<1 & -1<PFKE_K_L & PFKE_K_L<1
%     disp(' *** Left foot : WNL (Within Normal Limit) *** ')
% else
%     disp(' *** Left foot : Absent Label For Pattern *** ')
% end
% 
% 
% 
% if PFKE_A_R < -1 & PFKE_K_R < 1                               %Right foot
%     disp(' *** Right foot : True Equinus *** ')
% elseif PFKE_A_R < -1 & PFKE_K_R > 1
%     disp(' *** Right foot : Jump Gait *** ')
% elseif -1<PFKE_A_R & PFKE_A_R<1 & PFKE_K_R > 1
%     disp(' *** Right foot : Apparent Equinus *** ')
% elseif PFKE_A_R > 1 & PFKE_K_R > 1
%     disp(' *** Right foot : Crouch Gait *** ')
% elseif -1<PFKE_A_R & PFKE_A_R<1 & -1<PFKE_K_R & PFKE_K_R<1
%     disp(' *** Right foot : WNL (Within Normal Limit) *** ')
% else
%     disp(' *** Right foot : Absent Label For Pattern *** ')
% end
%% 
% for i=1:101
% SW(i,1)=S_K_R(P(i));
% end
% plot(x,SW,'b');
% 
% hold on
% 
% for i=1:101
% SQ(i,1)=S_K_L(P(i));
% end
% plot(x,SQ,'r');


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot(PFKE_A_L_1,PFKE_K_L_1,'r',PFKE_A_L_2,PFKE_K_L_2,'r',PFKE_A_L_3,PFKE_K_L_3,'r',PFKE_A_R_1,PFKE_K_R_1,'r',PFKE_A_R_2,PFKE_K_R_2,'r',PFKE_A_R_3,PFKE_K_R_3,'r');      %left

switch ll
    case 2
        
        
        PFKE_Ankles=[PFKE_A_L_1,PFKE_A_R_1];
        PFKE_Knees=[PFKE_K_L_1,PFKE_K_R_1];
        nn = length(PFKE_Ankles);


        ii={'rs','rp'};

        hold on
        for i=1:nn
            xx = PFKE_Ankles(i);
            yy = PFKE_Knees(i);
            plot(xx,yy,ii{i});
        end

        xlabel('Ankle Score');
        ylabel('Knee Score');
        min_x = min(-15,(floor(min(PFKE_Ankles)) -1));
        max_x = max(15,(ceil(max(PFKE_Ankles)) +1));
        min_y = min(-15,(floor(min(PFKE_Knees)) -1));
        max_y = max(15,(ceil(max(PFKE_Knees)) +1));
        xlim([min_x max_x]);
        ylim([min_y max_y]);

        x1=[1,1];
        y1=[-30,30];
        plot(x1,y1,'c');
        x2=[-30,30];
        y2=[1,1];
        plot(x2,y2,'c');
        x3=[-1,-1];
        y3=[-30,30];
        plot(x3,y3,'c');
        x4=[-1,30];
        y4=[-1,-1];
        plot(x4,y4,'c');
        x5=[-30,30];
        y5=[0,0];
        plot(x5,y5,'k');
        x6=[0,0];
        y6=[-30,30];
        plot(x6,y6,'k');

        legend('Left Foot 1st','Right Foot 1st','','','','','','');
        legend('location','southeast');

        text(-12,7,'Jump');
        text(-12,-7,'True Equinus');
        text(7,7,'crouch');
        text(-0.6,-0.5,'WNL');
        text(-0.6,-5,'Absent Label');
        text(2,-0.9,'Absent Label');
        text(3,-7,'Absent Label');
        uu = text(-0.5,2,'Apparent Equinus');
        uu.Rotation = 90;
        
    case 3
        
        PFKE_Ankles=[PFKE_A_L_1,PFKE_A_L_2,PFKE_A_R_1,PFKE_A_R_2,PFKE_A_L_avg,PFKE_A_R_avg];
        PFKE_Knees=[PFKE_K_L_1,PFKE_K_L_2,PFKE_K_R_1,PFKE_K_R_2,PFKE_K_L_avg,PFKE_K_R_avg];
        nn = length(PFKE_Ankles);


        ii={'rs','bs','rp','bp','md','m+'};

        hold on
        for i=1:nn
            xx = PFKE_Ankles(i);
            yy = PFKE_Knees(i);
            plot(xx,yy,ii{i});
        end

        xlabel('Ankle Score');
        ylabel('Knee Score');
        min_x = min(-15,(floor(min(PFKE_Ankles)) -1));
        max_x = max(15,(ceil(max(PFKE_Ankles)) +1));
        min_y = min(-15,(floor(min(PFKE_Knees)) -1));
        max_y = max(15,(ceil(max(PFKE_Knees)) +1));
        xlim([min_x max_x]);
        ylim([min_y max_y]);

        x1=[1,1];
        y1=[-30,30];
        plot(x1,y1,'c');
        x2=[-30,30];
        y2=[1,1];
        plot(x2,y2,'c');
        x3=[-1,-1];
        y3=[-30,30];
        plot(x3,y3,'c');
        x4=[-1,30];
        y4=[-1,-1];
        plot(x4,y4,'c');
        x5=[-30,30];
        y5=[0,0];
        plot(x5,y5,'k');
        x6=[0,0];
        y6=[-30,30];
        plot(x6,y6,'k');

        legend('Left Foot 1st','Left Foot 2nd','Right Foot 1st','Right Foot 2nd','Left Foot Average','Right Foot Average','','','','','','');
        legend('location','southeast');

        text(-12,7,'Jump');
        text(-12,-7,'True Equinus');
        text(7,7,'crouch');
        text(-0.6,-0.5,'WNL');
        text(-0.6,-5,'Absent Label');
        text(2,-0.9,'Absent Label');
        text(3,-7,'Absent Label');
        uu = text(-0.5,2,'Apparent Equinus');
        uu.Rotation = 90;
    case 4
  
        PFKE_Ankles=[PFKE_A_L_1,PFKE_A_L_2,PFKE_A_L_3,PFKE_A_R_1,PFKE_A_R_2,PFKE_A_R_3,PFKE_A_L_avg,PFKE_A_R_avg];
        PFKE_Knees=[PFKE_K_L_1,PFKE_K_L_2,PFKE_K_L_3,PFKE_K_R_1,PFKE_K_R_2,PFKE_K_R_3,PFKE_K_L_avg,PFKE_K_R_avg];
        nn = length(PFKE_Ankles);


        ii={'rs','bs','gs','rp','bp','gp','md','m+'};

        hold on
        for i=1:nn
            xx = PFKE_Ankles(i);
            yy = PFKE_Knees(i);
            plot(xx,yy,ii{i});
        end

        xlabel('Ankle Score');
        ylabel('Knee Score');
        min_x = min(-15,(floor(min(PFKE_Ankles)) -1));
        max_x = max(15,(ceil(max(PFKE_Ankles)) +1));
        min_y = min(-15,(floor(min(PFKE_Knees)) -1));
        max_y = max(15,(ceil(max(PFKE_Knees)) +1));
        xlim([min_x max_x]);
        ylim([min_y max_y]);

        x1=[1,1];
        y1=[-30,30];
        plot(x1,y1,'c');
        x2=[-30,30];
        y2=[1,1];
        plot(x2,y2,'c');
        x3=[-1,-1];
        y3=[-30,30];
        plot(x3,y3,'c');
        x4=[-1,30];
        y4=[-1,-1];
        plot(x4,y4,'c');
        x5=[-30,30];
        y5=[0,0];
        plot(x5,y5,'k');
        x6=[0,0];
        y6=[-30,30];
        plot(x6,y6,'k');

        legend('Left Foot 1st','Left Foot 2nd','Left Foot 3rd','Right Foot 1st','Right Foot 2nd','Right Foot 3rd','Left Foot Average','Right Foot Average','','','','','','');
        legend('location','southeast');

        text(-12,7,'Jump');
        text(-12,-7,'True Equinus');
        text(7,7,'crouch');
        text(-0.6,-0.5,'WNL');
        text(-0.6,-5,'Absent Label');
        text(2,-0.9,'Absent Label');
        text(3,-7,'Absent Label');
        uu = text(-0.5,2,'Apparent Equinus');
        uu.Rotation = 90;
end

%save('C:\Users\Sibetalaee\Desktop\points\Left\iii','PFKE_A_L_avg','PFKE_K_L_avg');
%save('C:\Users\Sibetalaee\Desktop\points\Right\iii','PFKE_A_R_avg','PFKE_K_R_avg');



