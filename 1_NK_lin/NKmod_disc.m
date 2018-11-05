%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'NKmod_disc';
M_.dynare_version = '4.5.6';
oo_.dynare_version = '4.5.6';
options_.dynare_version = '4.5.6';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('NKmod_disc.log');
M_.exo_names = 'ea';
M_.exo_names_tex = 'ea';
M_.exo_names_long = 'ea';
M_.exo_names = char(M_.exo_names, 'epi');
M_.exo_names_tex = char(M_.exo_names_tex, 'epi');
M_.exo_names_long = char(M_.exo_names_long, 'epi');
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'yn');
M_.endo_names_tex = char(M_.endo_names_tex, 'yn');
M_.endo_names_long = char(M_.endo_names_long, 'yn');
M_.endo_names = char(M_.endo_names, 'pi');
M_.endo_names_tex = char(M_.endo_names_tex, 'pi');
M_.endo_names_long = char(M_.endo_names_long, 'pi');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'x');
M_.endo_names_tex = char(M_.endo_names_tex, 'x');
M_.endo_names_long = char(M_.endo_names_long, 'x');
M_.endo_names = char(M_.endo_names, 'u');
M_.endo_names_tex = char(M_.endo_names_tex, 'u');
M_.endo_names_long = char(M_.endo_names_long, 'u');
M_.endo_names = char(M_.endo_names, 'rn');
M_.endo_names_tex = char(M_.endo_names_tex, 'rn');
M_.endo_names_long = char(M_.endo_names_long, 'rn');
M_.endo_partitions = struct();
M_.param_names = 'theta';
M_.param_names_tex = 'theta';
M_.param_names_long = 'theta';
M_.param_names = char(M_.param_names, 'beta');
M_.param_names_tex = char(M_.param_names_tex, 'beta');
M_.param_names_long = char(M_.param_names_long, 'beta');
M_.param_names = char(M_.param_names, 'rhoa');
M_.param_names_tex = char(M_.param_names_tex, 'rhoa');
M_.param_names_long = char(M_.param_names_long, 'rhoa');
M_.param_names = char(M_.param_names, 'rhopi');
M_.param_names_tex = char(M_.param_names_tex, 'rhopi');
M_.param_names_long = char(M_.param_names_long, 'rhopi');
M_.param_names = char(M_.param_names, 'sigmaa');
M_.param_names_tex = char(M_.param_names_tex, 'sigmaa');
M_.param_names_long = char(M_.param_names_long, 'sigmaa');
M_.param_names = char(M_.param_names, 'sigmapi');
M_.param_names_tex = char(M_.param_names_tex, 'sigmapi');
M_.param_names_long = char(M_.param_names_long, 'sigmapi');
M_.param_names = char(M_.param_names, 'gamma');
M_.param_names_tex = char(M_.param_names_tex, 'gamma');
M_.param_names_long = char(M_.param_names_long, 'gamma');
M_.param_names = char(M_.param_names, 'gamma_n');
M_.param_names_tex = char(M_.param_names_tex, 'gamma\_n');
M_.param_names_long = char(M_.param_names_long, 'gamma_n');
M_.param_names = char(M_.param_names, 'kappa');
M_.param_names_tex = char(M_.param_names_tex, 'kappa');
M_.param_names_long = char(M_.param_names_long, 'kappa');
M_.param_names = char(M_.param_names, 'lambda');
M_.param_names_tex = char(M_.param_names_tex, 'lambda');
M_.param_names_long = char(M_.param_names_long, 'lambda');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.endo_nbr = 9;
M_.param_nbr = 10;
M_.orig_endo_nbr = 9;
M_.aux_vars = [];
M_.Sigma_e = zeros(2, 2);
M_.Correlation_matrix = eye(2, 2);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('NKmod_disc_static');
erase_compiled_function('NKmod_disc_dynamic');
M_.orig_eq_nbr = 9;
M_.eq_nbr = 9;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 4 13;
 1 5 0;
 0 6 14;
 0 7 0;
 0 8 0;
 2 9 0;
 0 10 0;
 3 11 0;
 0 12 0;]';
M_.nstatic = 4;
M_.nfwrd   = 2;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 3;
M_.ndynamic   = 5;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = NaN(10, 1);
M_.NNZDerivatives = [28; 0; -1];
M_.params( 1 ) = 0.2;
theta = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 3 ) = 0.95;
rhoa = M_.params( 3 );
M_.params( 4 ) = 0;
rhopi = M_.params( 4 );
rhomp = 0.5;
M_.params( 7 ) = 3;
gamma = M_.params( 7 );
M_.params( 8 ) = 2;
gamma_n = M_.params( 8 );
M_.params( 9 ) = (1-M_.params(2)*M_.params(1))*(1-M_.params(2))*(M_.params(7)+M_.params(8))/M_.params(1);
kappa = M_.params( 9 );
M_.params( 5 ) = 1;
sigmaa = M_.params( 5 );
M_.params( 6 ) = 1;
sigmapi = M_.params( 6 );
M_.params( 10 ) = 0.5;
lambda = M_.params( 10 );
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(5)^2;
M_.Sigma_e(2, 2) = M_.params(6)^2;
var_list_ = char();
info = stoch_simul(var_list_);
save('NKmod_disc_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('NKmod_disc_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('NKmod_disc_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('NKmod_disc_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('NKmod_disc_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('NKmod_disc_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('NKmod_disc_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
