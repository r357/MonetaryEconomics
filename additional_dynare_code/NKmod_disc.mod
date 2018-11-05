
// A simple New Keynesian model with Calvo pricing in log-linear form 
// Comparison of discretion and commitment

var y yn pi a x u;
varexo ea epi;

parameters theta beta rhoa rhopi sigmaa sigmapi gamma gamma_n kappa lambda;

theta = 0.2;
beta  = 0.99;
rhoa  = 0.95;
rhopi = 0.5;
rhomp = 0.5;
gamma = 3;
gamma_n = 2;
kappa = (1-beta*theta)*(1-beta)*(gamma+gamma_n)/theta;
sigmaa   = 1;
sigmapi = 1;
lambda = 0.5;


model(linear);

pi = beta*pi(+1)+kappa*(y-yn)+u;
x = y-yn;
//x =x(-1) -kappa/lambda*pi;//Commitment
x = -kappa/lambda*pi;//Discretion
yn =a*(1+gamma_n)/(gamma+gamma_n);
a = rhoa*a(-1)+ea;
u = rhopi*u(-1)+epi;
end;

check;
shocks;
var ea = sigmaa^2;
var epi = sigmapi^2;
end;

stoch_simul(nograph);




