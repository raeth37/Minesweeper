cmake_minimum_required(VERSION 3.10)
project(Minesweeper)

set(CMAKE_CXX_STANDARD 17)

file(GLOB_RECURSE SOURCES
    "src/main.cpp"
    "src/game/*.cpp"
    "include/game/*.cpp"
)

add_executable(minesweeper ${SOURCES})

target_include_directories(minesweeper PRIVATE
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR}/include/game
)
