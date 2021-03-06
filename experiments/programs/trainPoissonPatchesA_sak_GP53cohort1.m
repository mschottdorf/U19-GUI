function regiment = trainPoissonPatchesA_sak_GP53cohort1(numDataSync, varargin)

  if nargin < 1
    numDataSync = [];
  end

  regiment  = runCohortExperiment ( 'C:\Data\sakoay\PoissonPatchesAGP53_1'  ... dataPath
                                  , 'Poisson Patches Shaping A'             ... experName
                                  , 'GP53cohort1'                           ... cohortName
                                  , numDataSync                             ... numDataSync
                                  , varargin{:}                             ...
                                  );
    
end
