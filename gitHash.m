function hash = gitHash(name)
% Return git hash of repository.
%   hash = gitHash(name) returns the git hash of the repository that
%   contains the given folder oder function. The methods automatically
%   traverses up the path to find the main folder of the git repository
%   (i.e. it also works if the function is somewhere in a subdirectory).
%
% AE 2012-07-13

hash = '';
path = which(name);
seps = strfind(path, filesep);
for i = sort(seps, 'descend')
    gitFolder = fullfile(path(1 : i), '.git');
    if exist(gitFolder, 'file')
        try
            fid = fopen(fullfile(gitFolder, 'HEAD'), 'r');
            hash = fgetl(fid);
            fclose(fid);
            if strncmpi('ref:', hash, 4)
                ref = textscan(hash, 'ref: %s');
                fid = fopen(fullfile(gitFolder, ref{1}{1}), 'r');
                hash = fgetl(fid);
                fclose(fid);
            end
        catch err
            warning('gitHash:fileError', 'Error reading git hash: %s', err.message)
            hash = '';
        end
        break
    end
end

