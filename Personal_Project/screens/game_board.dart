import 'package:chesstwo/component/deadpiece.dart';
import 'package:chesstwo/component/peice.dart';
import 'package:chesstwo/component/square.dart';
import 'package:chesstwo/helper/helper_method.dart';
import 'package:chesstwo/helper/initboard.dart';
import 'package:chesstwo/helper/realValidate.dart';
import 'package:chesstwo/value/colors.dart';
import 'package:flutter/material.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({
    super.key,
  });

  @override
  State<GameBoard> createState() => _GameBoardState();
}

//2d list represent the board with each position having a piece
late List<List<ChessPiece?>> board;
//the currently selected piece on the chess board/ if none is selected it is null
ChessPiece? selectedPiece;
//the row index of the selected piece
int selectedRow = -1;
//the col index of the selected piece
int selectedCol = -1;

//A list of valid moves for the selected piece
//each move is represented as a list with 2 element of row and col
List<List<int>> validMoves = [];

//a list of white pieces and black pieces that have been taken by the blackplayer
List<ChessPiece> whitePiecesTaken = [];

//a list of white pieces and black pieces that have been taken by the whiteplayer
List<ChessPiece> blackPiecesTaken = [];

//bool to check turn
bool isWhiteTurn = true;

//initial position of king
List<int> whiteKingPosition = [0, 4];
List<int> blackKingPosition = [7, 4];
bool checkStatus = false;

class _GameBoardState extends State<GameBoard> {
  @override
  void initState() {
    super.initState();
    initBoard();
  }

  void selectPiece(int row, int col) {
    setState(() {
      if (board[row][col] != null && board[row][col]!.isWhite == isWhiteTurn) {
        // Select new piece
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
        validMoves = calculateRealValidMoves(row, col, selectedPiece, true);
      } else if (selectedPiece != null) {
        // Check if the selected square is a valid move
        for (var pos in validMoves) {
          if (pos[0] == row && pos[1] == col) {
            movePiece(row, col);
            return;
          }
        }
        // Deselect if invalid move
        selectedPiece = null;
        validMoves = [];
        selectedRow = -1;
        selectedCol = -1;
      }
    });
  }

  void movePiece(int newRow, int newCol) {
    setState(() {
      //check for castling move
      if (selectedPiece!.type == ChessPieceType.king &&
          (newRow == 0 || newRow == 7) &&
          (newCol == 2 || newCol == 6)) {
        // Queen side castling
        if (newCol == 2) {
          if (newRow == 0) {
            board[0][3] = board[0][0];
            board[0][0] = null;
          } else {
            board[7][3] = board[7][0];
            board[7][0] = null;
          }
        }
        // King side castling
        else {
          if (newRow == 0) {
            board[0][5] = board[0][7];
            board[0][7] = null;
          } else {
            board[7][5] = board[7][7];
            board[7][7] = null;
          }
        }
      }

      if (board[newRow][newCol] != null) {
        // Capture the opponent's piece
        ChessPiece capturedPiece = board[newRow][newCol]!;
        if (capturedPiece.isWhite) {
          whitePiecesTaken.add(capturedPiece);
        } else {
          blackPiecesTaken.add(capturedPiece);
        }
      }

      // Update king's position if moving a king
      if (selectedPiece!.type == ChessPieceType.king) {
        if (selectedPiece!.isWhite) {
          whiteKingPosition = [newRow, newCol];
        } else {
          blackKingPosition = [newRow, newCol];
        }
      }

      // Move piece and clear the old square
      board[newRow][newCol] = selectedPiece;
      board[selectedRow][selectedCol] = null;

      // Check for check status
      checkStatus = iskingCheck(!isWhiteTurn);

      // Clear selection and change turn
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      validMoves = [];
    });
    //check for checkmate after the move
    if (isCheckMate(!isWhiteTurn)) {
      //if checkmate then the game is over
      //show dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Checkmate'),
          actions: [
            TextButton(
              onPressed: resetGame,
              child: const Text('play again'),
            ),
          ],
        ),
      );
    }

    //change turn
    isWhiteTurn = !isWhiteTurn;
  }

  //reset the game
  void resetGame() {
    Navigator.pop(context);
    initBoard();
    checkStatus = false;
    whitePiecesTaken.clear();
    blackPiecesTaken.clear();
    isWhiteTurn = true;
    whiteKingPosition = [0, 4];
    blackKingPosition = [7, 4];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: const Center(
            child: Text('Weeboo Chess', style: TextStyle(color: Colors.black))),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: blackPiecesTaken.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (context, index) => DeadPiece(
                    imagePath: blackPiecesTaken[index].imagePath,
                    isWhite: false),
              ),
            ),
            if (checkStatus)
              const Text(
                'Check',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 8 * 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (context, index) {
                  int row = index ~/ 8;
                  int col = index % 8;
                  bool isSelected = selectedRow == row && selectedCol == col;
                  bool isValidMove = validMoves
                      .any((move) => move[0] == row && move[1] == col);

                  return Square(
                    isWhite: isWhite(index),
                    piece: board[row][col],
                    isSelected: isSelected,
                    onTap: () {
                      selectPiece(row, col);
                    },
                    isValidMove: isValidMove,
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: whitePiecesTaken.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemBuilder: (context, index) => DeadPiece(
                    imagePath: whitePiecesTaken[index].imagePath,
                    isWhite: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
