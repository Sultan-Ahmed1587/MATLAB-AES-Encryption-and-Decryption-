function [ res_in_unicode ] = RC(file_path, key)

% read plaintext from the text file
fileID = fopen(file_path,'r');
plaintext = fscanf(fileID,'%c');
fclose(fileID);

%Encryption and Decryption exactly the same, simply swap the plaintext
% for the ciphertext with the same key

%key = 'KAREEM';

Z = uint8(PRGA(KSA(key), size(plaintext,2)));

P = uint8(char(plaintext));

res = bitxor(Z, P);

%printing result in hex and unicode
res_in_hex = mat2str(dec2hex(res,2));
res_in_unicode = char(res);

% write the result to a text file
fileID = fopen('encrypted_week16.txt', 'w');
fprintf(fileID, '%s', res_in_unicode);
fclose(fileID);

end
