function data = readfile(source)

% READSCOPE - read file in folder
%
% data = readfile(source)
%
% $parameter:
%
% source  ... a single file name (with wildcards allowed), a directory name or  a cell list of file names
% data    ... a structure with the fields as named in the scope file. Lambda and signal are the actual data fields
%
% $calls: subsequently called functions
%
% $version: 0.0
%
% $author: (c) 2011 Daniele Gerion
%
% $date: 9-July-2011

if nargin < 1
   error('No source file specified.');
end;

[source] = locGetSourceFiles(source);
data = locLoadScope(source);
%-----------------------------------------------------------------------------
function [fNames] = locGetSourceFiles(source)
% translate various input parameter configurations into a list of dir() structures
if ischar(source)
   if all(size(source) > 1)
      error('Source file can not be a string array (use cell array of strings instead)');
   end;
   
   % get dir structure
   fNames = dir(source);
   [p, f, e] = fileparts(source);
   for i = 1 : length(fNames)
      fNames(i).name = fullfile(p, fNames(i).name);
   end;

elseif iscell(source)
   for i = 1 : length(source)
      t = dir(source{i});
	   for i2 = 1 : length(t)
   	   t(i).name = fullfile(p, t(i).name);
   	end;
      
      fNames = [fNames; t];
   end;
else
   error('Invalid source provided (can not be a numerical value)');
end;
%-----------------------------------------------------------------------------
function data = locLoadScope(source)
% load scope files
data = [];
for i = 1 : length(source)
   val = locLoadScopeFile(source(i).name);
   if i == 1
      data = val;
   else
      data(i) = val;
   end;
   
end;
%-----------------------------------------------------------------------------
function data = locLoadScopeFile(source)
% load individual scope file
data = [];
[p, f, e] = fileparts(source);
if isempty(e)
   e = '.e';
end;

source = fullfile(p, [f e]);

if exist(source, 'file') ~= 2
   error(['File not found (check path and name): ' source]);
end;

data.source = source;

fid = fopen(source, 'r');

for i = 1:19
    line = fgetl(fid);
end

% read remaining chunk
s = fread(fid);
fclose(fid);
s(min(find(s == '>')) : end) = [];

s(find(s == 9)) = ',';
s(find(s == 13)) = ';';
s(find(s< 32)) = [];

val = str2num(['[' setstr(s)' ']']);

data.lambda = val(:, 1);
data.adu = val(:, 2);
%-----------------------------------------------------------------------------
