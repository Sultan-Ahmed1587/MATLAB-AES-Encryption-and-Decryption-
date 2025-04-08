
% Fix this code where stated! (only two lines to fix to make work 'as-is')
% Then turn into a function that can be called such that
% input = string message and a key
% This will be used later -- you can then further modify closer to the end
function [cipher] = bitgen_tofix1(message, key)
% ...
bitarr = logical(key - '0');

disp(bitarr);
    

% produce a bitstream with the message encoded
% bitstream contains strings of binary code
bitstream = {};

% read input from file
fileID = fopen('input.txt', 'r');
plaintext = fscanf(fileID, '%c');
fclose(fileID);

% the length of the string -- used throughout
l = length(plaintext);

% work through the length of the string
for c = 1:l
   
    ch = plaintext(c);
    asc = unicode2native(ch);
    
    newbits = dec2bin(asc,8);
    bitstream{c} = newbits;
    
    
end

%disp(bitstream);

% Convert a number to a binary logical array
% example, for 129, with 8 bits use:
% m = logical(dec2bin(129, 8) - '0')

% XOR encode here
%

cipher = {};

for c = 1:l
   
    s = bitstream{c};
   
    % convert string to logical array required by bitxor
    snx = logical(s-'0');
    
    % One line to fix here!
    ci = xor(snx,bitarr);
    
    
    % convert logical array to string
    cis = char(ci + 48);
    cipher{c} = cis;
   
end

%ci_sentence = strjoin(cipher,''); 

%disp(ci_sentence);


% XOR decode here
% do it again to decode!

decipher = {};

for c = 1:l
   
    s = cipher{c};

    % convert string to logical array required by bitxor
    snx = logical(s-'0');

    % One line to fix here!
    ci = xor(snx,bitarr);

   
    % convert logical array to string
    % also works as - char(A + int8('0')); (48 is the code for '0')
    cis = char(ci + 48);
    decipher{c} = cis;
end

% de_sentence = strjoin(decipher,''); 

%disp(de_sentence);


sentence = {};

for c = 1:l
   
    s = decipher{c};
    n = bin2dec(s);
    ch = char(n);

    sentence{c} = ch;
end

jsentence = strjoin(sentence,''); 

disp(jsentence);

end