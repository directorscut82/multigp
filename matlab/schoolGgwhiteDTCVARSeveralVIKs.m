% Runs the SCHOOL DATA EXPERIMENT with DTCVAR and GGWHITE kernel. One
% inducing kernel per inducing input.

% MULTIGP


clear
clc
rand('twister', 1e7)
randn('state', 1e7)

dataSetName = 'schoolData2';
% Configuration of options
options = multigpOptions('dtcvar'); 
options.kernType = 'ggwhite';
options.optimiser = 'scg';
options.nlf = 1;
options.initialInducingPositionMethod =  'kmeansHeterotopic';
options.beta = 1e-3;
options.noiseOpt = 1;
options.tieOptions.selectMethod = 'nofree';
options.isArd = true;
options.fixInducing = false;
options.nVIKs = 1;

numActive = [5 20 50];


display = 0;
iters = 500;
totFolds = 10;

[totalError, elapsed_time_train] =  schoolSparseCoreDTCVAR(dataSetName, options, ... 
       numActive, display, iters, totFolds);
   
save('schoolGgwhiteDTCVARSeveralVIKs.mat')   
