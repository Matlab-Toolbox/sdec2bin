restoredefaultpath; matlabrc % Clear path
clear import; % clear packages to test correct library

%% Add functions to path
run('../../sdec2hex/load_toolbox');

error_count = 0;
pass_count  = 0;

%% Test vectors
  test ={};
  res = 0;
  test(end+1).input =   sdec2bin(  2, 3);   test(end).expect =  {'010'} ;
  test(end+1).input =   sdec2bin(  3, 3);   test(end).expect =  {'011'} ;
  test(end+1).input =   sdec2bin( -1, 3);   test(end).expect =  {'111'} ;
  test(end+1).input =   sdec2bin( -4, 3);   test(end).expect =  {'100'} ;

  test(end+1).input =   sdec2bin(  7, 4);   test(end).expect =  {'0111'} ;
  test(end+1).input =   sdec2bin( -1, 4);   test(end).expect =  {'1111'} ;
  test(end+1).input =   sdec2bin( -8, 4);   test(end).expect =  {'1000'} ;

  %% Test multi hex chracters
  test(end+1).input =   sdec2hex(  2, 6);   test(end).expect =  {'02'} ;
  test(end+1).input =   sdec2hex(  3, 6);   test(end).expect =  {'03'} ;
  test(end+1).input =   sdec2hex( -1, 6);   test(end).expect =  {'3F'} ;
  test(end+1).input =   sdec2hex( -4, 6);   test(end).expect =  {'3C'} ;

  test(end+1).input =   sdec2hex(  7, 8);   test(end).expect =  {'07'} ;
  test(end+1).input =   sdec2hex( -1, 8);   test(end).expect =  {'FF'} ;
  test(end+1).input =   sdec2hex( -8, 8);   test(end).expect =  {'F8'} ;
  
  %%Matrices tests
  test(end+1).input =   sdec2hex( [-1;-1], 4);        test(end).expect =  [{'F';  'F'}] ;
  test(end+1).input =   sdec2hex( [-1, -1], 4);       test(end).expect =  [{'F', 'F'}] ;
  test(end+1).input =   sdec2hex( [1, 2; 3,-1], 4);   test(end).expect =  [{'1', '2'; '3', 'F'}] ;

  %% The tests
  for vector=1:size(test,2)
     if (  ~isequal( test(vector).input, test(vector).expect  ) )
       disp(['sdec2hex() Test ', num2str(vector), ' Failed '])
       disp('Expected')
       disp(test(vector).expect)
       disp('Recieved')
       disp(test(vector).input)
       error_count = error_count + 1;
     else
       pass_count  = pass_count  + 1;
     end
  end


  
  %% Test Status Report
  if error_count > 0
    disp(['Test FAILED : ', num2str(pass_count), ' passes and ',num2str(error_count),' fails'])
  else
    disp(['Test Passed : ', num2str(pass_count), ' checks ran '])
  end
















