function g = g_logistic(w,D)
X = D(1:31,:);
y = D(32, :)';
N = length(y);
g = zeros(31,1);
for i = 1:N
    xi = X(:,i);
    ei = exp(-y(i)*(w(:)'*xi));
    ci = -y(i)*ei/(1+ei);
    gi = ci*xi;
    g = g + gi;
end
g = g/N;