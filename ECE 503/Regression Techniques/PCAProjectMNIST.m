clc;
% clear;
close all
PLOT=1;
LOAD = 1;

if LOAD == 1
    load X1600;
    load Te28;
    load Lte28;
end

Length_Test=length(Lte28);
if PLOT == 1
    Img0=X1600(:,1);
    Img0_org=reshape(Img0,28,28);
    figure,imshow(Img0_org);
    
    
    Img1=X1600(:,1601);
    Img1_org=reshape(Img1,28,28);
    figure,imshow(Img1_org);
end


q=29;
num_feature=784;
nj=1600;
ni=10;

mu=zeros(num_feature,ni);
U=zeros(num_feature,q*ni);


for ii=1:ni
    Xi=X1600(:,(ii-1)*nj+1:ii*nj);
    mu_j=mean(Xi,2);
    Xh=Xi-mu_j*ones(1,nj);
    Cj=Xh*Xh';
    
    [Uq,~]=eigs(Cj,q);
    U(:,(ii-1)*q+1:ii*q)=Uq;
    mu(:,ii)=mu_j;
end
t0=cputime;
Predicted_Label = zeros(Length_Test,1);
for jj=1:Length_Test
    Xt=Te28(:,jj);
    e=zeros(1,ni);
    for ii=1:ni
        Cj2=Xt-mu(:,ii);
        fj=U(:,(ii-1)*q+1:ii*q).'*Cj2;
        Xj=U(:,(ii-1)*q+1:ii*q)*fj+mu(:,ii);
        e(ii)=norm(Xt-Xj);
    end
    [~,MinIdx]=min(e);
    Predicted_Label(jj)=MinIdx-1;
end
cpt=cputime-t0;
E=(Lte28 ~= Predicted_Label);
if PLOT == 1
    stem(E);
    xlabel('Number of samples')
    ylabel('ERROR')
end
disp('number of errors')
n_mis=sum(E)
disp('cpu time (s):')
cpt