project(LibBacktrace)
cmake_minimum_required(VERSION 3.10)

add_custom_target(
  configure-libbacktrace
  ${SHELL_EXECUTABLE} ./configure --disable-shared --with-pic --prefix=${CMAKE_CURRENT_SOURCE_DIR}/dist
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

add_custom_target(
  backtrace
  make install
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

include_directories(.)

set(SRCS alloc.c backtrace.c  dwarf.c fileline.c  mmapio.c    pecoff.c  print.c  simple.c  state.c  testlib.c)
set(SRCS ${SRCS} atomic.c elf.c       mmap.c      nounwind.c  posix.c   read.c   sort.c backtrace.h backtrace-supported.h)


add_definitions(-DSRCDIR="${CMAKE_CURRENT_SOURCE_DIR}")
add_definitions(-DHAVE_CONFIG_H)
add_definitions(-funwind-tables)
add_definitions(-frandom-seed=elf.lo)
add_definitions(-W -Wall)
add_definitions(-Wwrite-strings)
add_definitions(-Wstrict-prototypes)
add_definitions(-Wmissing-prototypes)
add_definitions(-Wold-style-definition) 
add_definitions(-Wmissing-format-attribute)
add_definitions(-Wcast-qual)


add_library(backtrace-nolink ${SRCS})
add_dependencies(backtrace-nolink configure-libbacktrace backtrace)

install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/dist/lib/ DESTINATION lib
)
