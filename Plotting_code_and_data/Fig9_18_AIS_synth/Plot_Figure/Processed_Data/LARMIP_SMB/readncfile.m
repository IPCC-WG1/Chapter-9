% readncfile(fname)
% To use this script, you must set fname to equal the filename
A=ncinfo(fname);

for ll=1:length(A.Variables(:))
eval([A.Variables(ll).Name,'=ncread(fname,A.Variables(ll).Name);']);
end

for kk=1:length(A.Groups(:))
  for ll=1:length(A.Groups.Variables(:))
    slash='/';
    eval([A.Groups(kk).Variables(ll).Name,'=ncread(fname,[A.Groups(kk).Name,slash,A.Groups(kk).Variables(ll).Name]);']);
    clear slash;
  end
end

clear A kk ll;