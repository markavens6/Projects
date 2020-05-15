clc
clear
close all


load D_bc_te.mat;
load D_bc_tr.mat;
initial_cpu_time = cputime;
Xtr = D_bc_tr(1:30,:);
Ytr = D_bc_tr(31,:);


Xte = D_bc_te(1:30,:);
Yte = D_bc_te(31,:);

one=ones(1,480);
one=one.';
Xtr=Xtr.';

Xcap=[Xtr,one];

Xtemp=Xcap.'*Xcap;

I=eye(31);

Xtemp2=Xtemp+0.01*I;

Xinverse=inv(Xtemp2);

Xtemp3=Xinverse*Xcap.';

WandB=Xtemp3*Ytr.';

Wstar1= WandB(1:30,1);

Bstar1=WandB(31,1);





%Testing
Ypre1=Wstar1.'*Xte+Bstar1;


Ypre=sign(Ypre1);
mis_class1=0;
for i=1:89
    if Ypre(:,i)~=Yte(:,i)
        mis_class1=mis_class1+1;
    end
end 
        
mis_class1

error_perc=(mis_class1/length(Yte))*100



error=norm(Yte-Ypre,'fro');
e=norm(Yte,'fro');
error_relative=error/e;

figure, plot(Ypre,'r-');
hold on;
plot(Yte(1,:),'b-');
legend('Prediction','True');
title('For Breast Cancer');
final_cpu_time = cputime; 
AvgCPUtime = (final_cpu_time - initial_cpu_time)



