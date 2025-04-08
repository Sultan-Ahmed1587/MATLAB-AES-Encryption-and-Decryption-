DATAHASH - Hash for Matlab array, struct, cell or file
Hash = DataHash(Data, Opts, ...)
Data: Array of built-in types (U)INT8/16/32/64, SINGLE, DOUBLE (real or complex)
CHAR, LOGICAL, CELL, STRUCT (scalar or array, nested), function_handle.
Options: List of char vectors:
Hashing method: 'SHA-1', 'SHA-256', 'SHA-384', 'SHA-512', 'MD2', 'MD5'.
Output format: 'hex', 'HEX', 'double', 'uint8', 'base64'
Input type:
'array': The contents, type and size of the input [Data] are
considered for the creation of the hash. Nested CELLs
and STRUCT arrays are parsed recursively. Empty arrays of
different type reply different hashs.
'file': [Data] is treated as file name and the hash is calculated
for the files contents.
'bin': [Data] is a numerical, LOGICAL or CHAR array. Only the
binary contents of the array is considered, such that
e.g. empty arrays of different type reply the same hash.
'ascii': Same as 'bin', but only the 8-bit ASCII part of the 16-bit
Matlab CHARs is considered.
Hash: String or numeric vector.
EXAMPLES:
Default: MD5, hex:
DataHash([]) % 7de5637fd217d0e44e0082f4d79b3e73

SHA-1, Base64:
S.a = uint8([]);
S.b = {{1:10}, struct('q', uint64(415))};
DataHash(S, 'base64', 'SHA-1') % ZMe4eUAp0G9TDrvSW0/Qc0gQ9/A

Comparison with standard hash programs using ASCII strings:
DataHash('abc', 'SHA-256', 'ascii')

Michael Kleder's "Compute Hash" works similar, but does not accept structs, cells or files:
http://www.mathworks.com/matlabcentral/fileexchange/8944

"GetMD5" is 2 to 100 times faster, but it replies only MD5 hashes and a C-compiler is required:
http://www.mathworks.com/matlabcentral/fileexchange/25921

Tested: Matlab 7.7, 7.8, 7.13, 8.6, 9.1, 9.5, Win7&10/64, Java: 1.3, 1.6, 1.7

Bugreports and enhancement requests are welcome. Feel free to ask me about a version for Matlab 6.5.

PS. MD5 and SHA1 hash values are "broken": You can construct a data set, which has a specific hash. But to check the integrity of files or to to recognize a set of variables, both methods are reliable.

Cite As
Jan (2022). DataHash (https://www.mathworks.com/matlabcentral/fileexchange/31272-datahash), MATLAB Central File Exchange. Retrieved July 10, 2022.