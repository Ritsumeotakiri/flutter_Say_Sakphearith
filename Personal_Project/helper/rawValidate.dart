//calculate raw valid moves for the selected piece
import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/helper/helper_method.dart';
import 'package:chesstwo/screens/game_board.dart';

List<List<int>> calculateRawValidMoves(int row, int col, ChessPiece? piece) {
  List<List<int>> validMoves = [];

  //different direction based on the color of the piece
  int direction = piece!.isWhite ? 1 : -1;

  switch (piece.type) {
    case ChessPieceType.pawn:
      // Check if the pawn can move forward
      if (isInboard(row + direction, col) &&
          board[row + direction][col] == null) {
        validMoves.add([row + direction, col]);
      }

      // Check if the pawn can move diagonally to capture (left)
      if (isInboard(row + direction, col - 1) &&
          board[row + direction][col - 1] != null) {
        if (piece.isWhite && !board[row + direction][col - 1]!.isWhite) {
          // White pawn capturing a black piece
          validMoves.add([row + direction, col - 1]);
        } else if (!piece.isWhite && board[row + direction][col - 1]!.isWhite) {
          // Black pawn capturing a white piece
          validMoves.add([row + direction, col - 1]);
        }
      }

      // Check if the pawn can move diagonally to capture (right)
      if (isInboard(row + direction, col + 1) &&
          board[row + direction][col + 1] != null) {
        if (piece.isWhite && !board[row + direction][col + 1]!.isWhite) {
          // White pawn capturing a black piece
          validMoves.add([row + direction, col + 1]);
        } else if (!piece.isWhite && board[row + direction][col + 1]!.isWhite) {
          // Black pawn capturing a white piece
          validMoves.add([row + direction, col + 1]);
        }
      }

      // Check if the pawn can move 2 steps forward from starting position
      if (piece.isWhite && row == 1 || !piece.isWhite && row == 6) {
        if (isInboard(row + 2 * direction, col) &&
            board[row + 2 * direction][col] == null) {
          validMoves.add([row + 2 * direction, col]);
        }
      }

      break;

    case ChessPieceType.rook:
      //check if the rook can move vertically
      for (int i = row + 1; i < 8; i++) {
        if (board[i][col] == null) {
          validMoves.add([i, col]);
        } else {
          if (board[i][col]!.isWhite != piece.isWhite) {
            validMoves.add([i, col]);
          }
          break;
        }
      }
      for (int i = row - 1; i >= 0; i--) {
        if (board[i][col] == null) {
          validMoves.add([i, col]);
        } else {
          if (board[i][col]!.isWhite != piece.isWhite) {
            validMoves.add([i, col]);
          }
          break;
        }
      }
      //check if the rook can move horizontally
      for (int i = col + 1; i < 8; i++) {
        if (board[row][i] == null) {
          validMoves.add([row, i]);
        } else {
          if (board[row][i]!.isWhite != piece.isWhite) {
            validMoves.add([row, i]);
          }
          break;
        }
      }
      for (int i = col - 1; i >= 0; i--) {
        if (board[row][i] == null) {
          validMoves.add([row, i]);
        } else {
          if (board[row][i]!.isWhite != piece.isWhite) {
            validMoves.add([row, i]);
          }
          break;
        }
      }
    case ChessPieceType.knight:
      var knightMove = [
        [-2, -1], // up 2 left 1
        [-2, 1], // up 2 right 1
        [-1, -2], // up 1 left 2
        [-1, 2], // up 1 rigth 2
        [1, -2], //down 1 left 2
        [1, 2], //down 1 right 2
        [2, 1], //down 2 right 1
        [2, -1], //down 2 left 1
      ];
      for (var move in knightMove) {
        var newRow = row + move[0];
        var newCol = col + move[1];
        if (!isInboard(newRow, newCol)) {
          continue;
        }
        if (board[newRow][newCol] != null) {
          if (board[newRow][newCol]!.isWhite != piece.isWhite) {
            validMoves.add([newRow, newCol]); //capture
          }
          continue;
        }
        validMoves.add([newRow, newCol]);
      }
      break;
    case ChessPieceType.queen:
      //have all direction up down left right
      var directions = [
        [-1, 0], // up
        [1, 0], //down
        [0, -1], // left
        [0, 1], //right
        [-1, -1], //up left
        [-1, 1], // up right
        [1, -1], //down left
        [1, 1], // down right
      ];
      for (var direction in directions) {
        var i = 1;
        while (true) {
          var newRow = row + i * direction[0];
          var newCol = col + i * direction[1];
          if (!isInboard(newRow, newCol)) {
            break;
          }
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              validMoves.add([newRow, newCol]); //capture
            }
            break; //block
          }
          validMoves.add([newRow, newCol]);
          i++;
        }
      }
      break;
    case ChessPieceType.king:
      // all eight direction
      var directions = [
        [-1, 0], // up
        [1, 0], //down
        [0, -1], // left
        [0, 1], //right
        [-1, -1], //up left
        [-1, 1], // up right
        [1, -1], //down left
        [1, 1], // down right
      ];
      for (var direction in directions) {
        var newRow = row + direction[0];
        var newCol = col + direction[1];
        if (!isInboard(newRow, newCol)) {
          continue;
        }
        if (board[newRow][newCol] != null) {
          if (board[newRow][newCol]!.isWhite != piece.isWhite) {
            validMoves.add([newRow, newCol]); //caption
          }
          continue; //blocked
        }
        validMoves.add([newRow, newCol]);
      }
      break;
    case ChessPieceType.bishop:
      // Diagonal directions
      var directions = [
        [-1, -1], // up left
        [-1, 1], // up right
        [1, -1], // down left
        [1, 1], // down right
      ];

      for (var direction in directions) {
        var i = 1;
        while (true) {
          var newRow = row + i * direction[0];
          var newCol = col + i * direction[1];

          // Check if the new position is within the board
          if (!isInboard(newRow, newCol)) {
            break;
          }

          // Check if the position is occupied by a piece
          if (board[newRow][newCol] != null) {
            // Check if it's an opponent's piece
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              validMoves.add([newRow, newCol]); // Capture
            }
            break; // Blocked by any piece
          }

          // Add the valid empty square
          validMoves.add([newRow, newCol]);
          i++;
        }
      }
      break;
    default:
  }
  return validMoves;
}
