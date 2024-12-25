//get the castling move for the king
import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/screens/game_board.dart';

List<List<int>> calculateCastalingMoves(int row, int col, ChessPiece king) {
  List<List<int>> validMoves = [];
  if (king.isWhite && row == 0 && col == 4) {
    // White king side castling
    if (board[0][7]?.type == ChessPieceType.rook &&
        board[0][7]?.isWhite == true &&
        board[0][6] == null &&
        board[0][5] == null) {
      validMoves.add([0, 6]);
    }

    // White queen side castling
    if (board[0][0]?.type == ChessPieceType.rook &&
        board[0][0]?.isWhite == true &&
        board[0][1] == null &&
        board[0][2] == null &&
        board[0][3] == null) {
      validMoves.add([0, 2]);
    }
  } else if (!king.isWhite && row == 7 && col == 4) {
    // Black king side castling
    if (board[7][7]?.type == ChessPieceType.rook &&
        board[7][7]?.isWhite == false &&
        board[7][6] == null &&
        board[7][5] == null) {
      validMoves.add([7, 6]);
    }

    // Black queen side castling
    if (board[7][0]?.type == ChessPieceType.rook &&
        board[7][0]?.isWhite == false &&
        board[7][1] == null &&
        board[7][2] == null &&
        board[7][3] == null) {
      validMoves.add([7, 2]);
    }
  }
  return validMoves;
}
