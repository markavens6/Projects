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


X_hat_new=[Xtr;ones(1,480)];
X_hat_new=X_hat_new.';
W_hat= pinv(X_hat_new.'*X_hat_new)*X_hat_new.'*Ytr';
for i=1:30
    Wstar(i)=W_hat(i,:);
end

Bstar=W_hat(31,:);   
Yfinal1= Wstar*Xte+Bstar;

Ypre=sign(Yfinal1);

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
