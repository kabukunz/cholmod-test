project(CholmodExample C)

cmake_minimum_required(VERSION 3.1)

include(CheckLanguage)
check_language(Fortran)
if(CMAKE_Fortran_COMPILER)
  enable_language(Fortran)
else()
  # if there are undefined references like "undefined reference to '_gfortran_st_write'"
  # try to install a fortran compiler like gfortran
  message(STATUS "No Fortran support. If there are link errors try installing gfortran (or similar)")
endif()

# ------------------------------------------------------------------
# Detect SuiteSparse libraries:
# Either tell Hunter to provide SuiteSparse for you or manually
# define where SuiteSparse and LAPACK can be found.
# To activate Hunter use the following commandline
# cmake -S . -B _build -DHUNTER_ENABLED=ON
#
# In the manual case, if not found automatically, set SuiteSparse_DIR
# in CMake to the directory containing suitesparse-config.cmake located
# in the installed directory.
# for example use the following command line
# cmake -S . -B _build -DSuiteSparse_DIR=../../_install/lib/cmake/suitesparse-5.1.0
# ------------------------------------------------------------------
# hunter_add_package(SuiteSparse)
find_package(SuiteSparse CONFIG REQUIRED)
# ------------------------------------------------------------------
#   End of SuiteSparse detection
# ------------------------------------------------------------------

# ------------------------------------------------------------------
# Declare an example program:
# ------------------------------------------------------------------
add_executable(cholmod-test cholmod-test.c)
target_link_libraries(cholmod-test PRIVATE SuiteSparse::cholmod)
