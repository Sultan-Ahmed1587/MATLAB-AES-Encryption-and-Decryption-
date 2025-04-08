function jsentence = encode_message(message, key)
% produce a bitstream with the message encoded
% bitstream contains strings of binary code
bitstream = {};

% the length of the message -- used throughout
l = length(message);

% work through the length of the message
for c = 1:l
   
    ch = message(c);
    asc = unicode2native(ch);
    
    newbits = dec2bin(asc,8);
    bitstream{c} = newbits;
    
end

% XOR encode here
cipher = {};

for c = 1:l
   
    s = bitstream{c};
   
    % convert string to logical array required by bitxor
    snx = logical(s-'0');
    
    % XOR the logical arrays for the current character and the key
    ci = xor(snx, key); % fix 1: replace "bitarr" with "key"
    
    % convert logical array to string
    cis = char(ci + 48);
    cipher{c} = cis;
   
end

% XOR decode here
decipher = {};

for c = 1:l
   
    s = cipher{c};

    % convert string to logical array required by bitxor
    snx = logical(s-'0');

    % XOR the logical arrays for the current character and the key
    ci = xor(snx, key); % fix 2: replace "bitarr" with "key"

    % convert logical array to string
    cis = char(ci + 48);
    decipher{c} = cis;
end

% Convert the binary strings back to characters
sentence = {};

for c = 1:l
   
    s = decipher{c};
    n = bin2dec(s);
    ch = char(n);

    sentence{c} = ch;
end

% Join the characters into a single string and return it
jsentence = strjoin(sentence,''); 

end
