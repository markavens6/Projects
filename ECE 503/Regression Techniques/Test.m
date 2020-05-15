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
y = [ones(1600,1); -ones(3200,1)];
All_comb=[B,C];
X_hat=[A,All_comb];
X_hat_new=[X_hat;ones(1,4800)];
X_hat_new=X_hat_new.';
W_hat= pinv(X_hat_new.'*X_hat_new)*X_hat_new.'*y

for i=1:784
    Wstar(i)=W_hat(i,:);
end

Bstar=W_hat(785,:);   
Yfinal1= Wstar*te1+Bstar;

%%Class 2

y2 = [ones(1600,1); -ones(3200,1)];
All_comb2=[A,C];
X_hat2=[B,All_comb2];
X_hat2_new=[X_hat2;ones(1,4800)];
X_hat2_new=X_hat2_new.';
W_hat2= pinv(X_hat2_new.'*X_hat2_new)*X_hat2_new.'*y2


for i=1:784
    Wstar2(i)=W_hat2(i,:);
end

Bstar2=W_hat2(785,:);   
Yfinal2= Wstar2*te2+Bstar2;

%%Class 3
y3 = [ones(1600,1); -ones(3200,1)];
All_comb3=[A,B];
X_hat3=[C,All_comb3];
X_hat3_new=[X_hat3;ones(1,4800)];
X_hat3_new=X_hat3_new.';
W_hat3= pinv(X_hat3_new.'*X_hat3_new)*X_hat3_new.'*y3




for i=1:784
    Wstar3(i)=W_hat3(i,:);
end

Bstar3=W_hat3(785,:);  

Yfinal3= Wstar3*te3+Bstar3;

Wstar=Wstar.';
Wstar2=Wstar2.';
Wstar3=Wstar3.';

Ws = [Wstar Wstar2 Wstar3];

bs = [Bstar Bstar2 Bstar3]';

E = zeros(3,3000);

Xte = [te1 te2 te3];

 

%Step 0

miss_class = 0;

yk = zeros(1,3000);

yk(1:1000) = 1+zeros(1,1000);

yk(1001:2000) = 2+zeros(1,1000);

yk(2001:3000) = 3+zeros(1,1000);

 

%Step 1

for i= 1:3000

Xi = Xte(:,i);

    fi = Ws'*Xi+bs;

    [~,ind] = max(fi);

   

    if ind~=yk(i)

        miss_class = miss_class+1;

    end

   

    E(ind,i) =1;

end

 

 

disp('Number of miss class:')

miss_class

disp('Error Rate:')

miss_class/3000

 

%Step 2

 

E1 = E(:,1:1000);

c1 = sum(E1')';

E2 = E(:,1001:2000);

c2 = sum(E2')';

E3 = E(:,2001:3000);

c3 = sum(E3')';
 

% Confusion matrix

C = [c1 c2 c3]
