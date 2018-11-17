class Pieces {
  final int fixedRow, fixedCol;
  int rowPiece, colPiece, moves=0;
  String chessPiece, playerType;
  
  Pieces (String cType, String pType, int row, int col) {
    chessPiece = cType;
    playerType = pType;
    fixedRow = row;
    fixedCol = col;
    rowPiece = row;
    colPiece = col;
  }

  float Xpiece=200, Ypiece=40;
  void show() {
    if (playerType.equals("opponent")) {
      if (chessPiece.equals("pawn")) {
        image(loadImage("/assets/bPawn.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("rook")) {
        image(loadImage("/assets/bRook.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("queen")) {
        image(loadImage("/assets/bQueen.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("knight")) {
        image(loadImage("/assets/bKnight.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("bishop")) {
        image(loadImage("/assets/bBishop.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("king")) {
        image(loadImage("/assets/bKing.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      }
    } else {
      if (chessPiece.equals("pawn")) {
        image(loadImage("/assets/wPawn.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("rook")) {
        image(loadImage("/assets/wRook.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("queen")) {
        image(loadImage("/assets/wQueen.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("knight")) {
        image(loadImage("/assets/wKnight.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("bishop")) {
        image(loadImage("/assets/wBishop.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      } else if (chessPiece.equals("king")) {
        image(loadImage("/assets/wKing.png"), Xpiece+(SQsize*colPiece), Ypiece+(SQsize*rowPiece), SQsize, SQsize);
      }
    }
  }
  
  double scoreRow(){
    if(playerType.equals("opponent")){
      if(rowPiece==0) return 0;
      else if(rowPiece==1) return 0;
      else if(rowPiece==2) return 1;
      else if(rowPiece==3) return 2;
      else if(rowPiece==4) return 3;
      else if(rowPiece==5) return 4;
      else if(rowPiece==6) return 5;
      else return 6;
    }else{
      if(rowPiece==0) return 6;
      else if(rowPiece==1) return 5;
      else if(rowPiece==2) return 4;
      else if(rowPiece==3) return 3;
      else if(rowPiece==4) return 2;
      else if(rowPiece==5) return 1;
      else if(rowPiece==6) return 0;
      else return 0;
    }
  }
  
  double scoreCol(){
      if(rowPiece==0) return 0;
      else if(rowPiece==1) return 4;
      else if(rowPiece==2) return 0;
      else if(rowPiece==3) return 6;
      else if(rowPiece==4) return 6;
      else if(rowPiece==5) return 0;
      else if(rowPiece==6) return 4;
      else return 0;
  }
  
  int getFixedRow(){return fixedRow;}
  
  int getFixedCol(){return fixedCol;}
  
  void move(int row, int col) {
    rowPiece = row;
    colPiece = col;
  }

  String playertype() {
    return playerType;
  }
  
  String chessType(){
    return chessPiece;
  }
  
  boolean isLegal(int iCol, int iRow, int col, int row) {
    if (col<8&&col>=0&&row<8&&row>=0){
      if (board[iRow][iCol].playertype() == null) return false;
      //Pawn
      if (chessPiece.equals("pawn")){
        return Pawn(iCol,iRow,col,row,fixedCol,fixedRow);
      }
      //knight
      else if (chessPiece.equals("knight")){
        return Knight(iCol,iRow,col,row);
      }
      //rook
      else if(chessPiece.equals("rook")){
        return Rook(iCol,iRow,col,row);
      }
      //bishop
      else if(chessPiece.equals("bishop")){
        return Bishop(iCol,iRow,col,row);
      }
      //Queen
      else if(chessPiece.equals("queen")){
        return Queen(iCol,iRow,col,row);
      }
      //king
      else if(chessPiece.equals("king")){
         return King(iCol,iRow,col,row);
      }
      else{
        return false;
      }
    }
    else return false;
  }
}
