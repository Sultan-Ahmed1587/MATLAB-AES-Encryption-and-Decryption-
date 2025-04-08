

function [ res_in_unicode ] = RC1(filename, key)
%function encrypt_decrypt_file(filename)
    % Read in the input file
    fid = fopen(filename, 'r');
    text = fscanf(fileID, '%c');
    fclose(fid);

    % Encrypt the text

    Z = uint8(PRGA(KSA(key), size(plaintext, 2)));
    P = uint8(char(plaintext));
    ciphertext = char(bitxor(Z, P));

    % Save the encrypted text to a new file
    [~, name, ext] = fileparts(filename);
    encrypted_filename = [name, '_encrypted', ext];
    fid = fopen(encrypted_filename, 'w');
    fwrite(fid, ciphertext);
    fclose(fid);

    % Decrypt the text

    Z = uint8(PRGA(KSA(key), size(encrypted_text, 2)));
    C = uint8(char(encrypted_text));
    plaintext = char(bitxor(Z, C));

    % Save the decrypted text to a new file
    decrypted_filename = [name, '_decrypted', ext];
    fid = fopen(decrypted_filename, 'w');
    fwrite(fid, plaintext);
    fclose(fid);
end
