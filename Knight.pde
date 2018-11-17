boolean Knight(int iCol, int iRow, int col, int row){
  if(((abs(iRow-row)==1 && abs(iCol-col)==2) || (abs(iRow-row)==2 && abs(iCol-col)==1)) && board[row][col]==null
  ){
    return true;
  }else{
    if(((abs(iRow-row)==1 && abs(iCol-col)==2) || (abs(iRow-row)==2 && abs(iCol-col)==1)) && !board[row][col].playertype().equals(board[iRow][iCol].playertype())
    ){
      return true;
    }else{
      return false;
    }
  }
}
