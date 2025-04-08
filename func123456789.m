function [encryptedMessage, decryptedMessage] = func123456789(message, key)
% Encrypts a message using a given key
% Inputs:
%   message: a string message to encrypt
%   key: an 8-bit key represented as a logical array
% Outputs:
%   encryptedMessage: the encrypted message as a string
%   decryptedMessage: the decrypted message as a string

% produce a bitstream with the message encoded
% bitstream contains strings of binary code
bitstream = {};

% the length of the string -- used throughout
l = length(message);

% work through the length of the string
for c = 1:l
    ch = message(c);
    asc = unicode2native(ch);
    newbits = dec2bin(asc, 8);
    bitstream{c} = newbits;
end

% XOR encode here
cipher = {};

for c = 1:l
    s = bitstream{c};
    % convert string to logical array required by bitxor
    snx = logical(s - '0');
    % XOR encryption
    ci = xor(snx, key);
    % convert logical array to string
    cis = char(ci + 48);
    cipher{c} = cis;
end

encryptedMessage = strjoin(cipher, '');

% XOR decode here
% do it again to decode!
decipher = {};

for c = 1:l
    s = cipher{c};
    % convert string to logical array required by bitxor
    snx = logical(s - '0');
    % XOR decryption
    ci = xor(snx, key);
    % convert logical array to string
    cis = char(ci + 48);
    decipher{c} = cis;
end

% convert deciphered bits to characters
decryptedMessage = '';
for c = 1:l
    s = decipher{c};
    n = bin2dec(s);
    ch = char(n);
    decryptedMessage = strcat(decryptedMessage, ch);
end

end
