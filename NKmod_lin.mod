
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
var y yn pi r i a amp;

// Define exoegnous variables. These are essentially the names of shocks to
// exogenous processes.
varexo ea emp;

// Define the names of parameters. Below the "parameters" command, assign 
// values to each parameter.
parameters theta beta rhoa rhomp sigmaa sigmamp gamma gamma_n phi_pi phi_x 
kappa;

theta = 0.2;
beta  = 0.99;
rhoa  = 0.95;
rhomp = 0.4;
gamma = 3;
gamma_n = 2;
phi_pi = 1.5;
phi_x = 0.5;
kappa = (1-beta*theta)*(1-beta)*(gamma+gamma_n)/theta;
sigmaa   = 1;
sigmamp   = 1;

// ======================================================================//
//              Part Two: DEFINITION OF MODEL EQUATIONS                  //
// Commands: model, shocks                                               //
// ======================================================================//

model(linear);

y = -gamma*r + y(+1);
pi = beta*pi(+1)+kappa*(y-yn);
i =  phi_pi*pi+phi_x*(y-yn)+amp;
r=i-pi(+1); 
yn =a*(1+gamma_n)/(gamma+gamma_n);
a = rhoa*a(-1)+ea;
amp = rhomp*amp(-1)+emp;
end;



// ======================================================================//
//          Part Three: Specification of variances of shocks             //
// ======================================================================//
 
shocks;
var ea = sigmaa^2;
var emp = sigmamp^2;
end;

// ======================================================================//
//                    Part Four: MODEL SOLUTION                          //
// Commands: stoch_simul, ...                                            //
// ======================================================================//

check; // Check the Blanchard-Kahn condition


stoch_simul; // Solves and simulates the model. 


