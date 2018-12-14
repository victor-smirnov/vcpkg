project(LibBacktrace)
cmake_minimum_required(VERSION 3.10)

add_custom_target(
  configure-libbacktrace
  ${SHELL_EXECUTABLE} ./configure --prefix=${CMAKE_CURRENT_SOURCE_DIR}/dist
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

include_directories(.)

set(SRCS alloc.c backtrace.c  dwarf.c   edtest2.c  fileline.c  mmapio.c    pecoff.c  print.c  simple.c  state.c  testlib.c  unknown.c  ztest.c)
set(SRCS ${SRCS} atomic.c  btest.c      edtest.c   elf.c       mmap.c      nounwind.c  posix.c   read.c   sort.c    stest.c  ttest.c backtrace.h backtrace-supported.h)


add_definitions(-DSRCDIR="${CMAKE_CURRENT_SOURCE_DIR}")

add_library(backtrace ${SRCS})
add_dependencies(backtrace configure-libbacktrace)

install(
  TARGETS backtrace
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
)
