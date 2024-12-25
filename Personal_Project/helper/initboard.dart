import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/screens/game_board.dart';

void initBoard() {
  //User selected a piece

  List<List<ChessPiece?>> newBoard = List.generate(
    8,
    (index) => List.generate(8, (index) => null),
  );

  //place random piece in middle to test
  // newBoard[3][3] = ChessPiece(
  //     imagePath: 'lib/images/rook.png',
  //     isWhite: true,
  //     type: ChessPieceType.king);

  //place pawn
  for (int i = 0; i < 8; i++) {
    newBoard[1][i] = ChessPiece(
        imagePath: 'lib/images/pawn.png',
        isWhite: false,
        type: ChessPieceType.pawn);

    newBoard[6][i] = ChessPiece(
        imagePath: 'lib/images/pawn.png',
        isWhite: true,
        type: ChessPieceType.pawn);
  }
  // Place the pieces for white
  newBoard[0][0] = ChessPiece(
      imagePath: 'lib/images/rook.png',
      isWhite: true,
      type: ChessPieceType.rook);
  newBoard[0][1] = ChessPiece(
      imagePath: 'lib/images/knight.png',
      isWhite: true,
      type: ChessPieceType.knight);
  newBoard[0][2] = ChessPiece(
      imagePath: 'lib/images/bishop.png',
      isWhite: true,
      type: ChessPieceType.bishop);
  newBoard[0][3] = ChessPiece(
      imagePath: 'lib/images/queen.png',
      isWhite: true,
      type: ChessPieceType.queen);
  newBoard[0][4] = ChessPiece(
      imagePath: 'lib/images/king.png',
      isWhite: true,
      type: ChessPieceType.king);
  newBoard[0][5] = ChessPiece(
      imagePath: 'lib/images/bishop.png',
      isWhite: true,
      type: ChessPieceType.bishop);
  newBoard[0][6] = ChessPiece(
      imagePath: 'lib/images/knight.png',
      isWhite: true,
      type: ChessPieceType.knight);
  newBoard[0][7] = ChessPiece(
      imagePath: 'lib/images/rook.png',
      isWhite: true,
      type: ChessPieceType.rook);
  for (int i = 0; i < 8; i++) {
    newBoard[1][i] = ChessPiece(
        imagePath: 'lib/images/pawn.png',
        isWhite: true,
        type: ChessPieceType.pawn);
  }

  // Place the pieces for black
  newBoard[7][0] = ChessPiece(
      imagePath: 'lib/images/rook.png',
      isWhite: false,
      type: ChessPieceType.rook);
  newBoard[7][1] = ChessPiece(
      imagePath: 'lib/images/knight.png',
      isWhite: false,
      type: ChessPieceType.knight);
  newBoard[7][2] = ChessPiece(
      imagePath: 'lib/images/bishop.png',
      isWhite: false,
      type: ChessPieceType.bishop);
  newBoard[7][3] = ChessPiece(
      imagePath: 'lib/images/queen.png',
      isWhite: false,
      type: ChessPieceType.queen);
  newBoard[7][4] = ChessPiece(
      imagePath: 'lib/images/king.png',
      isWhite: false,
      type: ChessPieceType.king);
  newBoard[7][5] = ChessPiece(
      imagePath: 'lib/images/bishop.png',
      isWhite: false,
      type: ChessPieceType.bishop);
  newBoard[7][6] = ChessPiece(
      imagePath: 'lib/images/knight.png',
      isWhite: false,
      type: ChessPieceType.knight);
  newBoard[7][7] = ChessPiece(
      imagePath: 'lib/images/rook.png',
      isWhite: false,
      type: ChessPieceType.rook);
  for (int i = 0; i < 8; i++) {
    newBoard[6][i] = ChessPiece(
        imagePath: 'lib/images/pawn.png',
        isWhite: false,
        type: ChessPieceType.pawn);
  }
  board = newBoard;
}
