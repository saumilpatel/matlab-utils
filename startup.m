% Matlab startup script for Tolias lab.
% AE 2007-09-26

addpath(pwd);
warning off MATLAB:dispatcher:ShadowedMEXExtension

% init scripts for anything that should be run on the job distribution system
addpath(getLocalPath('/lab/libraries/initscripts'))

% MySQL Interface
addpath(getLocalPath('/lab/libraries/mym'))
1
% recording management
run(getLocalPath('/lab/libraries/recDB/setPath.m'))

% libraries to read MPI data
% Removed deprecated never used libraries
% addpath(getLocalPath('/lab/libraries/various/mex_adf'))
% addpath(getLocalPath('/lab/libraries/various/mex_tt'))
% addpath(getLocalPath('/lab/libraries/various/mex_dg'))

% HDF5 data access
run(getLocalPath('/lab/libraries/hdf5matlab/setPath.m'))

% clustering: added by MS because without this path, submitDefaultJob
% cannot find path for clustering enqueing functions.
% removed by JC.  Don't add things like this to the global path.  
% I added it to the detection path.
% addpath(getLocalPath('/lab/libraries/clustering'));

% circular statistics
%
% Removed by AE on 2010-02-01 because there is now a 2009 version of the
% circstat toolbox which is partly incompatible with the 2008 version
%
% addpath(getLocalPath('/lab/libraries/matlab/circStat2008/'))
