function [mazes, criteria, globalSettings, vr] = PoissonPatchesA1(vr)

  %________________________________________ 1 _________ 2 _________ 3 _________ 4 _________ 5 _________ 6 _________ 7 _________ 8 _________ 9 _________ 10 _________ 11 _________ 12 _______________
  mazes     = struct( 'lStart'          , {5         , 30        , 30        , 30        , 30        , 30        , 30        , 30        , 30         , 30         , 30         , 30         }   ...
                    , 'lCue'            , {45        , 100       , 200       , 300       , 350       , 350       , 300       , 250       , 250        , 250        , 250        , 250        }   ...
                    , 'lMemory'         , {10        , 20        , 20        , 20        , 50        , 50        , 100       , 150       , 150        , 150        , 150        , 150        }   ...
                    , 'tri_turnHint'    , {true      , true      , true      , true      , true      , false     , false     , false     , false      , false      , false      , false      }   ...
                    , 'cueDuration'     , {nan       , nan       , nan       , nan       , nan       , nan       , nan       , nan       , nan        , nan        , inf        , 0.2        }   ... seconds
                    , 'cueProbability'  , {inf       , inf       , inf       , inf       , inf       , inf       , inf       , inf       , 2.5        , 1.2        , 1.2        , 1.2        }   ...
                    , 'cueDensityPerM'  , {1         , 2         , 2         , 2.5       , 2.5       , 2.5       , 2.5       , 2.5       , 3          , 3.5        , 3.5        , 3.5        }   ...
                    );                                                                                                                                                                       
  criteria  = struct( 'numTrials'       , {20        , 80        , 100       , 100       , 100       , 100       , 100       , 100       , 100        , 100        , 100        , 100        }   ...
                    , 'numTrialsPerMin' , {3         , 3         , 3         , 3         , 3         , 3         , 3         , 3         , 3          , 3          , 3          , 3          }   ...
                    , 'warmupNTrials'   , {[]        , []        , []        , []        , []        , 40        , 40        , 40        , [10  ,15  ], [10  ,15  ], [10  ,15  ], [10  ,15  ]}   ...
                    , 'numSessions'     , {0         , 0         , 0         , 0         , 2         , 1         , 1         , 3         , 2          , 2          , 1          , 1          }   ...
                    , 'performance'     , {0         , 0         , 0.6       , 0.6       , 0.8       , 0.8       , 0.8       , 0.8       , 0.75       , 0.7        , 0.7        , 0.65       }   ...
                    , 'maxBias'         , {inf       , 0.2       , 0.2       , 0.2       , 0.1       , 0.1       , 0.1       , 0.1       , 0.15       , 0.15       , 0.15       , 0.15       }   ...
                    , 'warmupMaze'      , {[]        , []        , []        , []        , []        , 5         , 5         , 5         , [5   ,8   ], [5   ,8   ], [5   ,8   ], [5   ,8   ]}   ...
                    , 'warmupPerform'   , {[]        , []        , []        , []        , []        , 0.8       , 0.8       , 0.8       , [0.85,0.8 ], [0.85,0.8 ], [0.85,0.8 ], [0.85,0.8 ]}   ...
                    , 'warmupBias'      , {[]        , []        , []        , []        , []        , 0.1       , 0.1       , 0.1       , [0.1 ,0.1 ], [0.1 ,0.1 ], [0.1 ,0.1 ], [0.1 ,0.1 ]}   ...
                    , 'warmupMotor'     , {[]        , []        , []        , []        , []        , 0         , 0         , 0         , [0.75,0.75], [0.75,0.75], [0.75,0.75], [0.75,0.75]}   ...
                    );

  globalSettings          = {'cueMinSeparation', 16, 'cueVisibleAt', 6, 'yCue', 8};
  vr.numMazesInProtocol   = numel(mazes);
  vr.stimulusGenerator    = @PoissonStimulusTrain;
  vr.stimulusParameters   = {'cueVisibleAt', 'cueDensityPerM', 'cueProbability', 'nCueSlots', 'cueMinSeparation', 'panSessionTrials'};
  vr.inheritedVariables   = {'cueDuration', 'lCue', 'lMemory'};

  
  if nargout < 1
    figure; plot([mazes.lStart] + [mazes.lCue] + [mazes.lMemory], 'linewidth',1.5); xlabel('Shaping step'); ylabel('Maze length (cm)'); grid on;
    hold on; plot([mazes.lMemory], 'linewidth',1.5); legend({'total', 'memory'}, 'Location', 'east'); grid on;
    figure; plot([mazes.lMemory] ./ [mazes.lCue], 'linewidth',1.5); xlabel('Shaping step'); ylabel('L(memory) / L(cue)'); grid on;
    figure; plot([mazes.cueDensityPerM], 'linewidth',1.5); set(gca,'ylim',[0 6.5]); xlabel('Shaping step'); ylabel('Tower density (count/m)'); grid on;
    hold on; plot([mazes.cueDensityPerM] .* (1 - 1./(1 + exp([mazes.cueProbability]))), 'linewidth',1.5);
    hold on; plot([1 numel(mazes)], [1 1].*(100/globalSettings{2}), 'linewidth',1.5, 'linestyle','--');
    legend({'\rho_{L} + \rho_{R}', '\rho_{salient}', '(maximum)'}, 'location', 'southeast');
  end

end