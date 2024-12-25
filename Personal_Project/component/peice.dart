enum ChessPieceType { pawn, rook, knight, bishop, queen, king }

class ChessPiece {
  final String imagePath;
  final bool isWhite;
  final ChessPieceType type;
  bool hasMoved;

  ChessPiece({
    required this.imagePath,
    required this.isWhite,
    required this.type,
    this.hasMoved = false,
  });
}
