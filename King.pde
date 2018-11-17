boolean King(int iCol, int iRow, int col, int row){
  if(abs(iCol-col)==-1||abs(iRow-row)==1){
    if(board[row][col]!=null){
      if(board[row][col].playertype().equals(board[iRow][iCol].playertype())){
        return false;
      }else{
        return true; 
      }
    }else{
      return true;
    }
  }else{
    return false;
  }
}
