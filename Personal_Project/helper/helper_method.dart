import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/helper/realValidate.dart';

import '../screens/game_board.dart';

bool isWhite(int index) {
  int x = index ~/ 8; // this gives us the division of the interger ex row
  int y = index % 8; // this gives us the remainder ex column

  //alternate colors for each sqare
  bool isWhite = (x + y) % 2 == 0;
  return isWhite;
}

//to know if the peice is in the board
bool isInboard(int row, int col) {
  return row >= 0 && row < 8 && col >= 0 && col < 8;
}

bool iskingCheck(bool isWhiteKing) {
  List<int> kingPosition = isWhiteKing ? whiteKingPosition : blackKingPosition;

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      ChessPiece? piece = board[i][j];
      if (piece == null || piece.isWhite == isWhiteKing) continue;

      List<List<int>> pieceValidMoves =
          calculateRealValidMoves(i, j, piece, false);

      if (pieceValidMoves.any(
          (move) => move[0] == kingPosition[0] && move[1] == kingPosition[1])) {
        return true;
      }
    }
  }
  return false;
}

bool SimulationMoveIsSafe(
    ChessPiece piece, int startRow, int startCol, int endRow, int endCol) {
  ChessPiece? originalDestinationPiece = board[endRow][endCol];
  List<int>? originalKingPosition;

  if (piece.type == ChessPieceType.king) {
    originalKingPosition =
        piece.isWhite ? whiteKingPosition : blackKingPosition;

    if (piece.isWhite) {
      whiteKingPosition = [endRow, endCol];
    } else {
      blackKingPosition = [endRow, endCol];
    }
  }

  board[endRow][endCol] = piece;
  board[startRow][startCol] = null;

  bool kingInCheck = iskingCheck(piece.isWhite);

  // Restore board
  board[startRow][startCol] = piece;
  board[endRow][endCol] = originalDestinationPiece;

  if (piece.type == ChessPieceType.king) {
    if (piece.isWhite) {
      whiteKingPosition = originalKingPosition!;
    } else {
      blackKingPosition = originalKingPosition!;
    }
  }

  return !kingInCheck;
}

//is it checkmate
bool isCheckMate(bool isWhiteKing) {
  //if the king is not in check then it is not checkmate
  if (!iskingCheck(isWhiteKing)) {
    return false;
  }
  //if there at least one move that the king can make to get out of check then it is not checkmate
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      //skip empty squares
      if (board[i][j] == null || board[i][j]!.isWhite != isWhiteKing) {
        continue;
      }

      List<List<int>> pieceValidMoves =
          calculateRealValidMoves(i, j, board[i][j], true);
      // if this piece has any valid move, then it is not checkmate
      if (pieceValidMoves.isNotEmpty) {
        return false;
      }
    }
  }
  //if the king is in check and there is no valid move to get out of check then it is checkmate
  return true;
}
