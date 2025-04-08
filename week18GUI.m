prompt = 'Tap 1 to run week 13 Classic Cipher\nTap 2 to run week 14 one way pad\nTap 3 to run week 15 bit-wise xor cipher\nTap 4 to run week 16 DES block cipher\nTap 5 to run week 17 bit wise stream cipher\nTap 6 to run week 19 Keyed hashing\nYou chose Number:';
choice = input(prompt);
if choice == 1
output = 'Tap 1'

week13()

elseif choice == 2
output = 'Tap 2.'

p = input("What file do you wish to use:", 's');

encrypt_decrypt_file(p);


elseif choice == 3
output = 'Tap 3'

Call()

elseif choice == 4
output = 'Tap 4'

p = input("What file do you wish to use:", 's');

RC(p, 'KAREEM');

elseif choice == 5
   
p = input("What file do you wish to use:", 's');

DataHash("readme.txt, SHA-256 ,file")

elseif choice == 6


plainTextInput = input("What file do you wish to use:", 's');


[outputCipher,authTag] = GCM_AE('44a74c1a57da2bf6d6838956cdca13f1b67cc6ad87d459bff544784083868171','4392367e62ef9aa706e3e801',plainTextInput,'additional unencrypted instructions')

else
output = 'You have entered the wrong number please try again:'

end


