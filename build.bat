
call suitesparse.bat

rmdir /S /Q build
mkdir build
cd build
cmake .. -G Ninja -DSuiteSparse_DIR=%SuiteSparse_DIR% -DLAPACK_DIR=%LAPACK_DIR%
ninja

cholmod-test.exe
