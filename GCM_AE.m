function [outputCipher,authTag] = GCM_AE(secretKey,iv,plainTextInput,aad)
%
% Algorithm for the Authentiated Encryption Function
% Galois Counter Mode (GCM) Block Cipher uses AES-128,192,256 based in key
% length. Implimentation based on NIST Special Publication 800-38D.
% Inputs: secretKey - hexidecimal (128,192, or 256 bits), iv -
% initialization vector (random 96-bit hexidecimal), plainTextInput -
% plaintext message of input that needs to be encrypted, aad - additional
% authenticated data (plaintext string).  Outputs: outputCipher - 
% hexidecimal encrypted Cipher, authTag - authentication tag (hexidecimal).
% IT IS ESSENTIAL THAT THE INITIALIZATION VECTOR BE DIFFERENT FOR EACH
% ENCRYPTION USING THE SAME SECRET KEY. INITIALIZATION VECTOR GENERATION
% CAN BE INCORPORATED INTO THE CODE AND SHOULD FOLLOW NIST GUIDELINES.
%
% David Hill
% Version 1.0.0
% Date: 1 December 2021
%

H=Cipher(secretKey,zeros(1,128));%Hash subkey
t=96;%authentication tag bit-length (fixed for this code)
iv=dec2bin(hex2dec(reshape(iv,2,[])'),8)';
iv=iv(:)'-'0';%binary array
p=dec2bin(double(plainTextInput)',8)';
p=p(:)'-'0';%binary array
a=dec2bin(double(aad)',8)';
a=a(:)'-'0';%binary array
J=[iv,zeros(1,31),1];
C=GCTR(secretKey,inc(32,J),p);
u=128*ceil(length(C)/128)-length(C);
v=128*ceil(length(a)/128)-length(a);
S=ghash([a,zeros(1,v),C,zeros(1,u),dec2bin(length(a),64)-'0',dec2bin(length(C),64)-'0'],H);
T=GCTR(secretKey,J,S);
T=T(1:t);
T=num2str(T);
T=T(T~=' ');
T=dec2hex(bin2dec(reshape(T,8,[])'))';
authTag=lower(T(:))';%convert T to hex
C=num2str(C);
C=C(C~=' ');
C=dec2hex(bin2dec(reshape(C,8,[])'))';
outputCipher=lower(C(:))';%convert C to hex

disp(['Encrypted cipher: ' outputCipher])
disp(['Authentication tag: ' authTag])