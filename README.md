sdec2hex
=============

SDEC2HEX Signed integer decimal to hexadecimal conversion

     sdec2hex(x, wordlength)
       x          : signed integer value
       wordlength : number of bits for converted hex format.

Example
--

    sdec2hex(-1, 4) 
    > 'F'

Installation
--

To get library clone from github:

    cd to your lib folder
    git clone https://github.com/Matlab-Toolbox/sdec2hex.git sdec2hex
    
Add function to path:

    %% Add functions to path
    run(['/path_to_package/sdec2hex/load_function.m']);
    
    
    sdec2hex(-1, 4) 
    > 'F'
    
