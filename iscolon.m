function b = iscolon(x)
% Returns true if and only if x is the color character (':')

b = ischar(x) && isscalar(x) && x == ':';
