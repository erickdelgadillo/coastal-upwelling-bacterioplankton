function paths = coastal_setup(workflow)
%COASTAL_SETUP Configure external inputs for the historical MATLAB workflows.
%   PATHS = COASTAL_SETUP('temporal') reads COASTAL_UPWELLING_DATA_DIR,
%   adds third-party functions to the MATLAB path, and changes the current
%   folder to the selected external input directory.

if nargin < 1
    workflow = 'temporal';
end

repoRoot = fileparts(mfilename('fullpath'));
dataRoot = getenv('COASTAL_UPWELLING_DATA_DIR');

if isempty(dataRoot)
    configFile = fullfile(repoRoot, '.Renviron');
    if isfile(configFile)
        configText = fileread(configFile);
        match = regexp(configText, ...
            '(?m)^COASTAL_UPWELLING_DATA_DIR=(.*)$', 'tokens', 'once');
        if ~isempty(match)
            dataRoot = strtrim(match{1});
        end
    end
end

if isempty(dataRoot) || ~isfolder(dataRoot)
    error(['Coastal data directory not found. Set ', ...
        'COASTAL_UPWELLING_DATA_DIR in .Renviron or the environment.']);
end

inputDir = fullfile(dataRoot, 'matlab', workflow);
if ~isfolder(inputDir)
    error('MATLAB input directory not found: %s', inputDir);
end

addpath(fullfile(repoRoot, 'third_party'));
cd(inputDir);

paths = struct( ...
    'repo_root', repoRoot, ...
    'data_root', dataRoot, ...
    'input_dir', inputDir);
end
