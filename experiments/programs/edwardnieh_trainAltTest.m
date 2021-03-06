function regiment = edwardnieh_trainAltTest(numDataSync, varargin)

 if nargin < 1
    numDataSync = [];
  end

  regiment  = runCohortExperiment ( 'C:\Data\edward\PoissonTowers_AltTest' ... dataPath
                                  , 'PoissonBlocksRebootAltTest'                     ... experName
                                  , 'cohortAltTest'                             ... cohortName
                                  , numDataSync                           ... numDataSync
                                  , varargin{:}                           ...
                                  );
    
end
