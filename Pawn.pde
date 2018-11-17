boolean Pawn(int iCol, int iRow, int col, int row, int fixedCol, int fixedRow){
  if(board[iRow][iCol].playertype().equals("opponent")){
    if(iCol == fixedCol && iRow == fixedRow){
      if(row-iRow==2 && row-iRow>0 && iCol==col && board[row][iCol]==null && board[row-1][iCol] == null
      ){
        return true;
      }else if(row-iRow==1&&(iCol==col||(board[row][col]!=null&&!board[row][col].playertype().equals("opponent")))&&board[row][iCol]==null
      ){
        return true;
      }else{
        return false;
      }
    }else if(row-iRow==1&&(iCol==col||(board[row][col]!=null&&!board[row][col].playertype().equals("opponent")))&&board[row][iCol]==null
    ){
      return true;
    }else{
      return false;
    }
  }else if(board[iRow][iCol].playertype().equals("player")){
    if(iCol == fixedCol && iRow == fixedRow){
      if(iRow-row == 2 && iRow-row > 0 && iCol == col && board[row][iCol] == null && iRow-row == 2 && board[row+1][iCol] == null
      ){
        return true;
      }else if(iRow-row==1 && (iCol==col || (board[row][col]!=null && !board[row][col].playertype().equals("player"))) && board[row][iCol] == null
      ){
        return true;
      } else {
        return false;
      }
    }else{
      if(iRow-row==1 && (iCol==col || (board[row][col]!=null && !board[row][col].playertype().equals("player"))) && board[row][iCol] == null
      ){
        return true;
      } else {
        return false;
      }
    }
  }else return false;
}
