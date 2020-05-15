clc
clear
close all



load X1600.mat
load Te28.mat
A= X1600(:,1:1600);
B= X1600(:,1601:3200);
C= X1600(:,3201:4800);
D= X1600(:,4801:6400);
E= X1600(:,6401:8000);
F= X1600(:,8001:9600);
G=X1600(:,9601:11200);
H=X1600(:,11201:12800);
I=X1600(:,12801:14400);
J=X1600(:,14401:16000);
te1=Te28(:,1:1000);
te2=Te28(:,1001:2000);
te3=Te28(:,2001:3000);
te4=Te28(:,3001:4000);
te5=Te28(:,4001:5000);
te6=Te28(:,5001:6000);
te7=Te28(:,6001:7000);
te8=Te28(:,7001:8000);
te9=Te28(:,8001:9000);
te10=Te28(:,9001:10000);



%%Class 1
y = [ones(1600,1); -ones(14400,1)];
All_comb=[B,C,D,E,F,G,H,I,J];
X_hat=[A,All_comb];
X_hat_new=[X_hat;ones(1,16000)];
X_hat_new=X_hat_new.';
W_hat= pinv(X_hat_new.'*X_hat_new)*X_hat_new.'*y
for i=1:784
    Wstar(i)=W_hat(i,:);
end

Bstar=W_hat(785,:);   
Yfinal1= Wstar*te1+Bstar;

%%Class 2

y2 = [ones(1600,1); -ones(14400,1)];
All_comb2=[A,C,D,E,F,G,H,I,J];
X_hat2=[B,All_comb2];
X_hat2_new=[X_hat2;ones(1,16000)];
X_hat2_new=X_hat2_new.';
W_hat2= pinv(X_hat2_new.'*X_hat2_new)*X_hat2_new.'*y2


for i=1:784
    Wstar2(i)=W_hat2(i,:);
end

Bstar2=W_hat2(785,:);   
Yfinal2= Wstar2*te2+Bstar2;

%%Class 3
y3 = [ones(1600,1); -ones(14400,1)];
All_comb3=[A,B,D,E,F,G,H,I,J];
X_hat3=[C,All_comb3];
X_hat3_new=[X_hat3;ones(1,16000)];
X_hat3_new=X_hat3_new.';
W_hat3= pinv(X_hat3_new.'*X_hat3_new)*X_hat3_new.'*y3



for i=1:784
    Wstar3(i)=W_hat3(i,:);
end

Bstar3=W_hat3(785,:);  

Yfinal3= Wstar3*te3+Bstar3;


%%Class 4
y4 = [ones(1600,1); -ones(14400,1)];
All_comb4=[A,B,C,E,F,G,H,I,J];
X_hat4=[D,All_comb4];
X_hat4_new=[X_hat4;ones(1,16000)];
X_hat4_new=X_hat4_new.';
W_hat4= pinv(X_hat4_new.'*X_hat4_new)*X_hat4_new.'*y4



for i=1:784
    Wstar4(i)=W_hat4(i,:);
end

Bstar4=W_hat4(785,:);  

Yfinal4= Wstar4*te4+Bstar4;


%%Class 5
y5 = [ones(1600,1); -ones(14400,1)];
All_comb5=[A,B,C,D,F,G,H,I,J];
X_hat5=[E,All_comb5];
X_hat5_new=[X_hat5;ones(1,16000)];
X_hat5_new=X_hat5_new.';
W_hat5= pinv(X_hat5_new.'*X_hat5_new)*X_hat5_new.'*y5



for i=1:784
    Wstar5(i)=W_hat5(i,:);
end

Bstar5=W_hat5(785,:);  

Yfinal5= Wstar5*te5+Bstar5;

%%Class 6
y6 = [ones(1600,1); -ones(14400,1)];
All_comb6=[A,B,C,D,E,G,H,I,J];
X_hat6=[F,All_comb6];
X_hat6_new=[X_hat6;ones(1,16000)];
X_hat6_new=X_hat6_new.';
W_hat6= pinv(X_hat6_new.'*X_hat6_new)*X_hat6_new.'*y6



for i=1:784
    Wstar6(i)=W_hat6(i,:);
end

Bstar6=W_hat6(785,:);  

Yfinal6= Wstar6*te6+Bstar6;


%%Class 7
y7 = [ones(1600,1); -ones(14400,1)];
All_comb7=[A,B,C,D,E,F,H,I,J];
X_hat7=[G,All_comb7];
X_hat7_new=[X_hat7;ones(1,16000)];
X_hat7_new=X_hat7_new.';
W_hat7= pinv(X_hat7_new.'*X_hat7_new)*X_hat7_new.'*y7



for i=1:784
    Wstar7(i)=W_hat7(i,:);
end

Bstar7=W_hat7(785,:);  

Yfinal7= Wstar7*te7+Bstar7;


%%Class 8
y8 = [ones(1600,1); -ones(14400,1)];
All_comb8=[A,B,C,D,E,F,G,I,J];
X_hat8=[H,All_comb8];
X_hat8_new=[X_hat8;ones(1,16000)];
X_hat8_new=X_hat8_new.';
W_hat8= pinv(X_hat8_new.'*X_hat8_new)*X_hat8_new.'*y8



for i=1:784
    Wstar8(i)=W_hat8(i,:);
end

Bstar8=W_hat8(785,:);  

Yfinal8= Wstar8*te8+Bstar8;


%%Class 9
y9 = [ones(1600,1); -ones(14400,1)];
All_comb9=[A,B,C,D,E,F,G,H,J];
X_hat9=[I,All_comb9];
X_hat9_new=[X_hat9;ones(1,16000)];
X_hat9_new=X_hat9_new.';
W_hat9= pinv(X_hat9_new.'*X_hat9_new)*X_hat9_new.'*y9



for i=1:784
    Wstar9(i)=W_hat9(i,:);
end

Bstar9=W_hat9(785,:);  

Yfinal9= Wstar9*te9+Bstar9;

%%Class 10
y10 = [ones(1600,1); -ones(14400,1)];
All_comb10=[A,B,C,D,E,F,G,H,I];
X_hat10=[J,All_comb10];
X_hat10_new=[X_hat10;ones(1,16000)];
X_hat10_new=X_hat10_new.';
W_hat10= pinv(X_hat10_new.'*X_hat10_new)*X_hat10_new.'*y10



for i=1:784
    Wstar10(i)=W_hat10(i,:);
end

Bstar10=W_hat10(785,:);  

Yfinal10= Wstar10*te10+Bstar10;


Wstar=Wstar.';
Wstar2=Wstar2.';
Wstar3=Wstar3.';
Wstar4=Wstar4.';
Wstar5=Wstar5.';
Wstar6=Wstar6.';
Wstar7=Wstar7.';
Wstar8=Wstar8.';
Wstar9=Wstar9.';
Wstar10=Wstar10.';

Ws = [Wstar Wstar2 Wstar3 Wstar4 Wstar5 Wstar6 Wstar7 Wstar8 Wstar9 Wstar10];

bs = [Bstar Bstar2 Bstar3 Bstar4 Bstar5 Bstar6 Bstar7 Bstar8 Bstar9 Bstar10]';

ECheck = zeros(10,10000);

Xte = [te1 te2 te3 te4 te5 te6 te7 te8 te9 te10];

 

%Step 0

miss_class = 0;

yk = zeros(1,10000);

yk(1:1000) = 1+zeros(1,1000);

yk(1001:2000) = 2+zeros(1,1000);

yk(2001:3000) = 3+zeros(1,1000);

yk(3001:4000) = 4+zeros(1,1000);

yk(4001:5000) = 5+zeros(1,1000);

yk(5001:6000) = 6+zeros(1,1000);

yk(6001:7000) = 7+zeros(1,1000);

yk(7001:8000) = 8+zeros(1,1000);

yk(8001:9000) = 9+zeros(1,1000);

yk(9001:10000) = 10+zeros(1,1000);

 

%Step 1

for i= 1:10000

Xi = Xte(:,i);

fi = Ws'*Xi+bs;

[~,ind] = max(fi);

   

    if ind~=yk(i)

        miss_class = miss_class+1;

    end

   

    ECheck(ind,i) =1;

end

 

 

disp('Number of miss class:')

miss_class

disp('Error Rate:')

miss_class/10000

 

%Step 2

 

E1 = ECheck(:,1:1000);

c1 = sum(E1')';

E2 = ECheck(:,1001:2000);

c2 = sum(E2')';

E3 = ECheck(:,2001:3000);

c3 = sum(E3')';

E4 = ECheck(:,3001:4000);

c4 = sum(E4')';

E5 = ECheck(:,4001:5000);

c5 = sum(E5')';

E6 = ECheck(:,5001:6000);

c6 = sum(E6')';

E7 = ECheck(:,6001:7000);

c7 = sum(E7')';

E8 = ECheck(:,7001:8000);

c8 = sum(E8')';

E9 = ECheck(:,8001:9000);

c9 = sum(E9')';
 
E10 = ECheck(:,9001:10000);

c10 = sum(E10')';

% Confusion matrix

C1 = [c1 c2 c3 c4 c5 c6 c7 c8 c9 c10]






