function [residual, g1, g2, g3] = NKmod_disc_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(9, 1);
T36 = params(7)*params(9)/(params(9)^2+params(10));
lhs =y(4);
rhs =(-params(7))*y(7)+y(13);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =params(2)*y(14)+params(9)*(y(4)-y(5))+y(11);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(4)-y(5);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(12)+y(11)*T36;
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(8)-y(14);
residual(5)= lhs-rhs;
lhs =y(12);
rhs =(y(5)-y(1))/params(7);
residual(6)= lhs-rhs;
lhs =y(5);
rhs =y(9)*(1+params(8))/(params(7)+params(8));
residual(7)= lhs-rhs;
lhs =y(9);
rhs =params(3)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =params(4)*y(3)+x(it_, 2);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 16);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,13)=(-1);
  g1(1,7)=params(7);
  g1(2,4)=(-params(9));
  g1(2,5)=params(9);
  g1(2,6)=1;
  g1(2,14)=(-params(2));
  g1(2,11)=(-1);
  g1(3,4)=(-1);
  g1(3,5)=1;
  g1(3,10)=1;
  g1(4,8)=1;
  g1(4,11)=(-T36);
  g1(4,12)=(-1);
  g1(5,14)=1;
  g1(5,7)=1;
  g1(5,8)=(-1);
  g1(6,1)=(-((-1)/params(7)));
  g1(6,5)=(-(1/params(7)));
  g1(6,12)=1;
  g1(7,5)=1;
  g1(7,9)=(-((1+params(8))/(params(7)+params(8))));
  g1(8,2)=(-params(3));
  g1(8,9)=1;
  g1(8,15)=(-1);
  g1(9,3)=(-params(4));
  g1(9,11)=1;
  g1(9,16)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,256);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,4096);
end
end
end
end
