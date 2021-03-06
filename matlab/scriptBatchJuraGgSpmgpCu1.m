clear
clc
rand('twister', 1e6)
randn('state', 1e6)
addToolboxes(0,1)
file = 'Cu';
numActive =[50 100 200 500 600];
nlf = 1;
numFolds = 10;
iters = 1000;
options = multigpOptions('pitc');
options.kernType = 'gg';
options.optimiser = 'scg';
options.nlf = 1;
options.initialInducingPositionMethod = 'kmeansHeterotopic';
options.isArd = 1;
options.fixInducing = 0;
[maerror, elapsed_time] = demSpmgpJuraBatch(file, options, numActive, iters, numFolds);
save('scriptBatchJuraGgSpmgpCu1', 'maerror', 'elapsed_time')
