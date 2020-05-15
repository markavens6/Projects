% To implement the gradient descent algorithm.
% Example: [xs,fs,k] = grad_desc('f_rosen','g_rosen',[0; 2],1e-9);
function [xs_g,fs,k,xs1, xs2, xs3] = grad_desc(fname,gname,x0,epsi, D)
format compact
format long
k = 1;
xk = x0;
gk = feval(gname,xk, D);
dk = -gk;
ak = bt_lsearch2019(xk,dk,fname,gname, D);
adk = ak*dk;
er = norm(adk);
while er >= epsi
  xk = xk + adk;
  gk = feval(gname,xk, D);
  dk = -gk;
  ak = bt_lsearch2019(xk,dk,fname,gname, D);
  adk = ak*dk;
  er = norm(adk);
  if k == 10
      xs1 = xk + adk;
  end
  if k == 50
      xs2 = xk + adk;
  end
  if k == 95
      xs3 = xk + adk;
  end
  k = k + 1;
end
disp('solution:')
xs_g = xk + adk;
disp('objective function at solution point:')
fs = feval(fname,xs_g, D)
format short
disp('number of iterations performed:')
k