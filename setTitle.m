function setTitle(title)
% Set Matlab Comand window title.
%   setTitle(title) sets the command window title to the given string. If
%   the environment variable WHOAMI is set, title is appended to it.
%
% AE 2013-05-08

who = getenv('WHOAMI');
if ~isempty(who)
    title = sprintf('%s | %s', who, title);
end
jDesktop = com.mathworks.mde.desk.MLDesktop.getInstance;
cmdWin = jDesktop.getClient('Command Window');
if ~isempty(cmdWin)
    cmdWin.getTopLevelAncestor.setTitle(title);
end
