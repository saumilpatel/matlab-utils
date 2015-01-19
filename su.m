function su(user, pw)
% Switch DataJoint user.
%   su user pw
%
% AE 2012-08-17

if nargin < 2
    pw = input(sprintf('Password for user %s: ', user), 's');
end
setenv('DJ_USER', user)
setenv('DJ_PASS', pw)
clear functions
dj.conn
fprintf('\nSwitched to DJ user %s.\n\n', user)
