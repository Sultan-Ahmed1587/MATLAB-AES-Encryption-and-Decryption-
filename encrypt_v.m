clear all
clc

keyin = input('Enter the encryption key: ','s');

%convert string to array of cell char vectors
ct = cellstr(keyin(:));

fileID = fopen('pac.png','r');
B = fread(fileID);
fclose(fileID);

ln = size(keyin,2);
fsize = size(B,1);

% if mod(fsize, ln) == 0 no reminder
sz = int16((fsize/ln)); % nearest whole
rm = mod(fsize,ln); % fraction of string left over
fracstr = keyin(1:rm);

sxm = repmat(keyin,1,sz);
sxm = strcat(sxm,fracstr);

A = double(char(sxm))';

% used to have to reshape for col/rows but now use apostrophe ' to
% transpose
%A = reshape(A,8172,1);

B = bitxor(B, A,'uint8');

fileID = fopen('pac_enc.png','w');
fwrite(fileID, B, "uint8");
fclose(fileID);
