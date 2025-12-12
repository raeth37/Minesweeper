import 'dart:ffi';
import 'dart:io';

typedef GameNewNative = Pointer<Void> Function(Int32, Int32, Int32, Uint64);
typedef GameNewDart = Pointer<Void> Function(int, int, int, int);

typedef GameFreeNative = Void Function(Pointer<Void>);
typedef GameFreeDart = void Function(Pointer<Void>);

typedef GameClickNative = Void Function(Pointer<Void>, Int32, Int32);
typedef GameClickDart = void Function(Pointer<Void>, int, int);

typedef CellIntNative = Int32 Function(Pointer<Void>, Int32, Int32);
typedef CellIntDart = int Function(Pointer<Void>, int, int);

class MinesweeperFFI {
  late DynamicLibrary _lib;

  late GameNewDart _gameNew;
  late GameFreeDart _gameFree;
  late GameClickDart _onLeftClick;
  late GameClickDart _onRightClick;
  late CellIntDart _cellIsMine;
  late CellIntDart _cellIsRevealed;
  late CellIntDart _cellIsFlagged;
  late CellIntDart _cellAdjacent;

  MinesweeperFFI() {
    if (Platform.isMacOS) {
      _lib = DynamicLibrary.open('macos/Frameworks/ffi_wrapper.dylib');
    } else {
      throw UnsupportedError('Only macOS is supported');
    }

    _gameNew = _lib.lookupFunction<GameNewNative, GameNewDart>('game_new');
    _gameFree = _lib.lookupFunction<GameFreeNative, GameFreeDart>('game_free');
    _onLeftClick = _lib.lookupFunction<GameClickNative, GameClickDart>('game_on_left_click');
    _onRightClick = _lib.lookupFunction<GameClickNative, GameClickDart>('game_on_right_click');
    _cellIsMine = _lib.lookupFunction<CellIntNative, CellIntDart>('cell_is_mine');
    _cellIsRevealed = _lib.lookupFunction<CellIntNative, CellIntDart>('cell_is_revealed');
    _cellIsFlagged = _lib.lookupFunction<CellIntNative, CellIntDart>('cell_is_flagged');
    _cellAdjacent = _lib.lookupFunction<CellIntNative, CellIntDart>('cell_adjacent');
  }

  Pointer<Void> newGame(int width, int height, int mines, int seed) => _gameNew(width, height, mines, seed);
  
  void freeGame(Pointer<Void> game) => _gameFree(game);
  void leftClick(Pointer<Void> game, int x, int y) => _onLeftClick(game, x, y);
  void rightClick(Pointer<Void> game, int x, int y) => _onRightClick(game, x, y);

  bool isMine(Pointer<Void> game, int x, int y) => _cellIsMine(game, x, y) != 0;
  bool isRevealed(Pointer<Void> game, int x, int y) => _cellIsRevealed(game, x, y) != 0;
  bool isFlagged(Pointer<Void> game, int x, int y) => _cellIsFlagged(game, x, y) != 0;

  int adjacent(Pointer<Void> game, int x, int y) => _cellAdjacent(game, x, y);
}
