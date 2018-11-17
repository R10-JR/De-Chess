boolean Rook(int iCol, int iRow, int col, int row){
  if(row==iRow){
     return checkCol(iCol,iRow,col,row);
  }else if(col==iCol){
    return checkRow(iCol,iRow,col,row);
  }else{
    return false  ;
  }
}

boolean checkCol(int iCol, int iRow, int col, int row){
  if(iCol>col){
    for(int c=col+1;c<iCol;c++){
      if(board[row][c]!=null){
        return false;
      }
    }
  }else if(iCol<col){
    for(int c=iCol+1;c<col;c++){
      if(board[row][c]!=null){
        return false;
      }
    }
  }else{
    return false;
  }
  //check if selected piece is the same or not to target
  if(board[row][col]==null){
    return true;
  }else if(board[iRow][iCol].playertype().equals(board[row][col].playertype())){
    return false;
  }else{
    return true;
  }
}
  
boolean checkRow(int iCol, int iRow, int col, int row){
  if(iRow>row){
    for(int r=row+1;r<iRow;r++){
      if(board[r][col]!=null){
        return false;
      }
    }
  }else if(iRow<row){
    for(int r=iRow+1;r<row;r++){
      if(board[r][col]!=null){
        return false;
      }
    }
  }else{
    return false;
  }
  //check if selected piece is the same or not to target
  if(board[row][col]==null){
    return true;
  }else if(board[iRow][iCol].playertype().equals(board[row][col].playertype())){
    return false;
  }else{
     return true;
  }
}
