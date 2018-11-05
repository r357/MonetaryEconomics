
/*
* ------------------------------------------------------------------------
 A simple New Keynesian model with Calvo pricing in log-linear form

* ------------------------------------------------------------------------
*/

// ======================================================================//
//                  Part One: PREAMBLE                                   //
// Commands: var, varexo, parameters                                     //
// ======================================================================//


// Define endogenous variables. Note that the list should include also 
// those exogenous processes that have an AR structure.
var y yn pi r i a amp x xi chi rn;

// Define exoegnous variables. These are essentially the names of shocks to
// exogenous processes.
varexo ea emp exi echi;

// Define the names of parameters. Below the "parameters" command assign 
// values to each parameter.
parameters theta beta rhoa rhomp sigmaa sigmamp gamma gamma_n phi_pi phi_x 
kappa psi rhoxi sigmaxi epsilon rhochi sigmachi;

theta = 0.2;
beta  = 0.99;
rhoa  = 0.95;
rhomp = 0.8;
rhoxi = 0.5;
gamma = 3;
gamma_n = 2;
phi_pi = 1.5;
phi_x = 0.5;
kappa = (1-beta*theta)*(1-theta)*(gamma+gamma_n)/theta;
epsilon = 11; //Implies a 10% equilibrium mark-up
psi = (1-beta*theta)*(1-beta)/((epsilon-1)*theta);
sigmaa   = 1;
sigmamp   = 1;
sigmaxi = 1;
rhochi = 0.6;
sigmachi = 1;

// ======================================================================//
//              Part Two: DEFINITION OF MODEL EQUATIONS                  //
// Commands: model, shocks                                               //
// ======================================================================//

model(linear);

//y = -1/gamma*(r+chi(+1)-chi) + y(+1);
x = -1/gamma*(r-rn) + x(+1);
pi = beta*pi(+1)+kappa*x+psi*xi;
i =  phi_pi*pi+phi_x*(y-yn)+amp;
r=i-pi(+1); 
yn =a*(1+gamma_n)/(gamma+gamma_n)+1/(gamma+gamma_n)*(chi+xi); // CHECK!!!!
rn = gamma_n/(gamma+gamma_n)*((1-rhochi)*chi+(1-rhoxi)*xi) - gamma*(1-rhoa)*(1+gamma_n)/(gamma+gamma_n)*a; //Definition of the natural rate of interest
a = rhoa*a(-1)+ea;
amp = rhomp*amp(-1)+emp;
x = y - yn;
xi = rhoxi*xi(-1)+exi;
chi = rhochi*chi(-1)+echi;
end;



// ======================================================================//
//          Part Three: Specification of variances of shocks             //
// ======================================================================//
 
shocks;
var ea = sigmaa^2;
var emp = sigmamp^2;
var exi = sigmaxi^2;
var echi = sigmachi^2;
end;

// ======================================================================//
//                    Part Four: MODEL SOLUTION                          //
// Commands: stoch_simul, ...                                            //
// ======================================================================//

check; // Check the Blanchard-Kahn condition


stoch_simul; // Solves and simulates the model. 


