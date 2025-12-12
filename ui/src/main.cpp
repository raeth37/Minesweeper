#include <iostream>
#include "game/GameManager.h"
#include "game/Board.h"

using namespace minesweeper;

void printBoard(const Board* board) {
    int h = board->height();
    int w = board->width();

    // Print column numbers
    std::cout << "   ";
    for (int c = 0; c < w; ++c) {
        std::cout << c % 10 << " ";
    }
    std::cout << "\n";

    for (int r = 0; r < h; ++r) {
        std::cout << (r % 10) << "  ";  // row label

        for (int c = 0; c < w; ++c) {
            const Cell& cell = board->at({r, c});

            if (!cell.isRevealed()) {
                if (cell.isFlagged())
                    std::cout << "F ";
                else
                    std::cout << "# ";
            }
            else if (cell.isMine()) {
                std::cout << "* ";
            }
            else {
                int n = cell.adjacentMines();
                if (n == 0)
                    std::cout << ". ";   // zeroes look nicer as dots
                else
                    std::cout << n << " ";
            }
        }

        std::cout << "\n";
    }
}


int main() {
    GameManager gm(10, 10, 10);   // width, height, mineCount
    gm.startNewGame();

    std::cout << "=== MINESWEEPER (Console Test) ===\n";

    while (gm.isPlaying()) {
        printBoard(gm.board());

        std::cout << "\nEnter move (L/R row col): ";
        char type;
        int r, c;

        std::cin >> type >> r >> c;

        if (type == 'L' || type == 'l')
            gm.onLeftClick(r, c);
        else if (type == 'R' || type == 'r')
            gm.onRightClick(r, c);

        if (gm.isWon()) {
            printBoard(gm.board());
            std::cout << "\nYOU WON!\n";
            return 0;
        }

        if (gm.isLost()) {
            printBoard(gm.board());
            std::cout << "\nBOOM! YOU HIT A MINE.\n";
            return 0;
        }
    }

    return 0;
}
