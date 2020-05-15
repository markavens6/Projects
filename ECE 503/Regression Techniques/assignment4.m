load D_bc_te.mat
load D_bc_tr.mat

train = D_bc_tr;
test = D_bc_te;

X_train = train(1:30, :);
Y_train = train(31, :);

X_test = test(1:30, :);
Y_test = test(31, :);
for i = 1:30
 xi = X_train(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 X_train(i,:) = (xi - mi)/vi;
end
X_train = [X_train; ones(1, 480); Y_train];
for i = 1:30
 xi = X_test(i,:);
 mi = mean(xi);
 vi = sqrt(var(xi));
 X_test(i,:) = (xi - mi)/vi;
end
X_test = [X_test; ones(1, 89)];
w = zeros(31,1);
[xs,fs,k, xs1, xs2, xs3] = grad_desc('f_logistic', 'g_logistic', w, 1e-2, X_train);
[fp1, fn1] = classify(X_test, Y_test, xs1);
[fp2, fn2] = classify(X_test, Y_test, xs2);
[fp3, fn3] = classify(X_test, Y_test, xs3);

disp('for k = 5');
fp1
fn1

disp('for k = 12');
fp2
fn2

disp('for k = 75');
fp3
fn3

function [fp, fn] = classify(X_test,Y_test, xs)
    result = zeros(89, 1);
    fp = 0;
    fn = 0;
    for i = 1:89
        y = xs' * X_test(:, i);
        if y > 0
            result(i) = 1;
        else
            result(i) = -1;
        end
        if result(i) == 1 && result(i) ~= Y_test(i)
            fn = fn + 1;
        end
        if result(i) == -1 && result(i) ~= Y_test(i)
            fp = fp + 1;
        end
    end
end


