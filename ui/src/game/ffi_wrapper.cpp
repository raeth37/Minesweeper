#include "GameManager.h"

using namespace minesweeper;

extern "C" {
    GameManager* game_new(int w, int h, int mines, uint64_t seed) {
        return new GameManager(w, h, mines, seed);
    }

    void game_delete(GameManager* g) {
        delete g;
    }

    void game_on_left_click(GameManager* g, int row, int col) {
        g -> onLeftClick(row, col);
    }

    void game_on_right_click(GameManager* g, int row, int col) {
        g -> onRightClick(row, col);
    }

    int game_state(GameManager* g) {
        return static_cast<int>(g -> state());
    }

    int cell_is_mine(GameManager* g, int r, int c) {
        return g -> board() -> at({r, c}).isMine();
    }
    int cell_is_revealed(GameManager* g, int r, int c) {
        return g -> board() -> at({r, c}).isRevealed();
    }
    int cell_is_flagged(GameManager* g, int r, int c) {
        return g -> board() -> at({r, c}).isFlagged();
    }
    int cell_adjacent(GameManager* g, int r, int c) {
        return g -> board() -> at({r, c}).adjacentMines();
    }
}
