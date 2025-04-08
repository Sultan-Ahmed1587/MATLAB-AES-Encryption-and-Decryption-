
function [encrypted_string, decrypted_string] = caesar_cipher()
    prompt = 'Enter a string: ';
    str = input(prompt, 's');
    shift = 3;
    shifted_string = char(double(str) + shift);
    shifted_string(shifted_string > 126) = shifted_string(shifted_string > 126) - 94;
    decrypted_string = char(double(shifted_string) - shift + (double(shifted_string)<32)*94);
    fprintf('Original string: %s\nEncrypted string: %s\nDecrypted string: %s\n', str, shifted_string, decrypted_string);
    encrypted_string = shifted_string;
end

