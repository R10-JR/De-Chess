Pieces[][] tempBoard;
Map<Double,Pieces[][]> scores;

void AI(){
  tempBoard = new Pieces[8][8];
  scores = new HashMap<Double,Pieces[][]>();
  for(int row=0;row<8;row++){
    for(int col=0;col<8;col++){
      tempBoard[row][col] = board[row][col];
    }
  }
  findAll();
  findMapMax();
}

//find all possibility goes here
void findAll(){
  int row=0, col=0;
  for(int r=0;r<8;r++){
    for(int c=0;c<8;c++){
      if(tempBoard[r][c]!=null){
        if(tempBoard[r][c].playertype().equals("opponent")){
          if(tempBoard[r][c].chessType().equals("knight")){
            row=3;
            col=2;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=3;
            col=-2;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=2;
            col=3;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=-2;
            col=3;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            //-------------------------------------------
            row=-3;
            col=2;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=-3;
            col=-2;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=-2;
            col=-3;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
            row=-2;
            col=-3;
            if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
              tempMove(r,c,row,col);
              MapMoves(r,c);
            }
          }else{
            for(int i=0;i<8;i++){
              row=i;
              col=0;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            for(int i=0;i<8;i++){
              row=-i;
              col=0;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            //-------------------
            for(int i=0;i<8;i++){
              row=0;
              col=i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            for(int i=0;i<8;i++){
              row=0;
              col=-i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            //-------------------
            for(int i=0;i<8;i++){
              row=i;
              col=i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            for(int i=0;i<8;i++){
              row=-i;
              col=i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            //-------------------
            for(int i=0;i<8;i++){
              row=i;
              col=-i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
            for(int i=0;i<8;i++){
              row=-i;
              col=-i;
              if(tempBoard[r][c].isLegal(c,r,col+c,row+r)){
                tempMove(r,c,row,col);
                MapMoves(r,c);
              }
            }
          }
        }
      }
    }
  }
}

void MapMoves(int iRow, int iCol){
  Pieces[][] savedBoard = new Pieces[8][8];
  double score = calculateBoard(iRow,iCol);
  for(int row=0;row<8;row++){
    for(int col=0;col<8;col++){
      savedBoard[row][col] = tempBoard[row][col];
    }
  }
  scores.put(score,savedBoard);
  for(int row=0;row<8;row++){
    for(int col=0;col<8;col++){
      tempBoard[row][col] = board[row][col];
    }
  }
}

void tempMove(int r, int c, int row , int col){
  if(r+row<8 && r+row >= 0 && c+col<8 && c+col>=0 && r<8 && r >= 0 && c < 8 && c > 0 && tempBoard[r][c] != null){
    Pieces p = tempBoard[r][c];
    tempBoard[r][c]=null;
    tempBoard[r+row][c+col]=p;
    p.move(r+row,c+col);
  }
}

double calculateBoard(int iRow, int iCol){
  double score=0;
  for(int row=0;row<=7;row++){
    for(int col=0;col<=7;col++){
      if(tempBoard[row][col] != null){
        score += peiceScore(iRow,iCol,row,col);
      }
    }
  }
  return score;
}
 
double peiceScore(int iRow, int iCol, int r, int c){
  double score=0;
  if(tempBoard[r][c].playertype().equals("player")){
    score = -findMaxScore(iRow,iCol,r,c);  //returns negative number
  }else{
    score = findMaxScore(iRow,iCol,r,c); //returns positive number
  }
  return score;
}

double findMaxScore(int iRow, int iCol, int r, int c){
  double score=0;
  if(tempBoard[r][c].chessType().equals("pawn")){ score += 1 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol();}
  else if(tempBoard[r][c].chessType().equals("knight")){ score += 3 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol();}
  else if(tempBoard[r][c].chessType().equals("bishop")){ score += 3 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol();}
  else if(tempBoard[r][c].chessType().equals("rook")){ score += 5 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol();}
  else if(tempBoard[r][c].chessType().equals("queen")){ score += 9 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol();}
  else if(tempBoard[r][c].chessType().equals("king")){ score += -(10 + tempBoard[r][c].scoreRow() + tempBoard[r][c].scoreCol());}
  return score;
}

void findMapMax(){
  double maxScore = Double.NEGATIVE_INFINITY;
  for(double score : scores.keySet()){
    if(score >= maxScore){
      maxScore = score;
    }
  }
  for(int row=0;row<8;row++){
    for(int col=0;col<8;col++){
      board[row][col]=scores.get(maxScore)[row][col];
    }
  }
}
