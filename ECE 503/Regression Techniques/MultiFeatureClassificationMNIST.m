clc
clear
close all


load X1600.mat;
load Te28.mat;
load Lte28.mat

Xtr = Te28;
Ytr = Lte28.';


Xte = X1600;



one=ones(1,10000);
one=one.';
Xtr=Xtr.';

Xcap=[Xtr,one];

Xtemp=Xcap.'*Xcap;

I=eye(785);

Xtemp2=Xtemp+0.01*I;

Xinverse=inv(Xtemp2);

Xtemp3=Xinverse*Xcap.';

WandB=Xtemp3*Ytr.';

Wstar1= WandB(1:784,1);
%Wstar2=WandB(1:8,2);
Bstar1=WandB(785,1);
%Bstar2=WandB(9,2);



%Testing
Ypre1=Wstar1.'*Xte+Bstar1;
%Ypre2=Wstar2.'*Xte+Bstar2;

Ypre=ceil(Ypre1(:,1:10000));

mis_class1=0;
for i=1:10000
    if Ypre(:,i)~=Ytr(:,i)
        mis_class1=mis_class1+1;
    end
end 
        
mis_class1

error=norm(Ytr-Ypre,'fro');
e=norm(Ytr,'fro');

error_relative=error/e

figure, plot(Ypre,'r-');
hold on;
plot(Ytr(1,:),'b-');
legend('Prediction','True');
title('For Breast Cancer');
