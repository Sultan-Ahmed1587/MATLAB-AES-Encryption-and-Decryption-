function [ENC,DEC] = Call(plaintext,ciphertext)
%CALL Summary of this function goes here
%   Detailed explanation goes here

KEY = keygen

prompt = 'user input?';
plaintext = input(prompt, 's');

prompt = 'Enter the number 1 if you want to encrypt your code: ';
choice = input(prompt);
if choice == 1
output = 'You entered 1';

ENC = DES(plaintext, KEY, 'ENC');

fprintf("This is the encrypted version");

ENC

else
output = 'Invalid input, You didnt input 1';
end




prompt = 'Enter the number 2 if you want to decrypt your code: ';
choice = input(prompt);
if choice == 2
output = 'You entered 2';

DEC = DES(ENC, KEY, 'DEC');

fprintf("This is the decrypted version"); 

DEC

else
output = 'Invalid input, You didnt input 2';
end
end



