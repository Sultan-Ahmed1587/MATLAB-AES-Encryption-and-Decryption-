keyin = input('Enter the decryption key: ','s');


fileID = fopen('pac_enc.png','r');
B = fread(fileID);
fclose(fileID);

idx = 1;

for n = 1 : length(B)

    % disp(B(n));

    B(n) = bitxor(B(n), double(keyin(idx)));

    idx = idx + 1;

    if idx > length(keyin)
        idx = 1;
    end

end

fileID = fopen('pac_dec.png','w');
fwrite(fileID, B, "uint8");
fclose(fileID);




