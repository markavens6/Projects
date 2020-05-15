function f = f_logistic(w,D)
X = D(1:31,:);
y = D(32, :)';
N = length(y);
f = 0;
for i = 1:N
    xi = X(:,i);
    fi = log(1+exp(-y(i)*(w(:)'*xi)));
    f = f + fi;
end
f = f/N;