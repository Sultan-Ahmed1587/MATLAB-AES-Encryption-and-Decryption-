function encrypt_decrypt_file(filename)
    % Read in the input file
    fid = fopen(filename, 'r');
    text = fread(fid, '*char')';
    fclose(fid);

    % Encrypt the text
    cipher = randi(26, 1, length(text));
    text_num = double(text);
    final_text = text_num + cipher;
    coded_text = char(final_text);

    % Save the encrypted text to a new file
    [~, name, ext] = fileparts(filename);
    encrypted_filename = [name, '_encrypted', ext];
    fid = fopen(encrypted_filename, 'w');
    fwrite(fid, coded_text);
    fclose(fid);

    % Decrypt the text
    encoded_num = double(coded_text);
    decoded_num = encoded_num - cipher;
    decoded_text = char(decoded_num);

    % Save the decrypted text to a new file
    decrypted_filename = [name, '_decrypted', ext];
    fid = fopen(decrypted_filename, 'w');
    fwrite(fid, decoded_text);
    fclose(fid);
end
