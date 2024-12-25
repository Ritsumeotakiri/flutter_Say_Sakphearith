import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/helper/calculateCastling.dart';
import 'package:chesstwo/helper/helper_method.dart';
import 'package:chesstwo/helper/rawValidate.dart';

List<List<int>> calculateRealValidMoves(
    int row, int col, ChessPiece? piece, bool checkSimulation) {
  List<List<int>> realValidMoves = [];
  List<List<int>> candidateMoves = calculateRawValidMoves(row, col, piece);

  for (var move in candidateMoves) {
    int endRow = move[0];
    int endCol = move[1];

    // Only simulate if `checkSimulation` is true
    if (checkSimulation) {
      if (SimulationMoveIsSafe(piece!, row, col, endRow, endCol)) {
        realValidMoves.add([endRow, endCol]);
      }
    } else {
      realValidMoves.add([endRow, endCol]);
    }
  }
  //add castling move for the king
  if (piece?.type == ChessPieceType.king) {
    realValidMoves.addAll(calculateCastalingMoves(row, col, piece!));
  }

  return realValidMoves;
}
