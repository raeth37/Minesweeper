cmake_minimum_required(VERSION 3.10)
project(minesweeper_lib)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

add_library(minesweeper SHARED
    game/Board.cpp
    game/GameManager.cpp
    game/ffi_wrapper.cpp
)

target_include_directories(minesweeper PRIVATE game)
