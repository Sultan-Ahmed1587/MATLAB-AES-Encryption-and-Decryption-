keyin = input('Enter the encryption key: ','s');


% read image in 

% A = imread('pac.png');


% image(A)

% whos("A")

fileID = fopen('pac.png','r');
B = fread(fileID);
fclose(fileID);

% whos("B")

idx = 1;

for n = 1 : length(B)

    % disp(B(n));

    B(n) = bitxor(B(n), double(keyin(idx)));

    idx = idx + 1;

    if idx > length(keyin)
        idx = 1;
    end

end

fileID = fopen('pac_enc.png','w');
fwrite(fileID, B, "uint8");
fclose(fileID);




