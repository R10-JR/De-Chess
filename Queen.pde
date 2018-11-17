boolean Queen(int iCol, int iRow, int col, int row){
  if(row==iRow){
    return checkCol(iCol,iRow,col,row);
  }else if(col==iCol){
    return checkRow(iCol,iRow,col,row);
  }else{
    int iR=-1, iC=-1, eR=-1, eC=-1;
    if(iRow<row){
      iR=iRow+1;
      eR=row;
    }else if(iRow>row){
      iR=row+1;
      eR=iRow;
    }      
    if(iCol<col){
      iC=iCol+1;
      eC=col;
    }else if(iCol>col){
      iC=col+1;
      eC=iCol;
    }      
    if(iR==-1||iC==-1||eR==-1||eC==-1) {return false;}
    while(iR<eR && iC<eC){
      if(board[iR][iC]!=null){
        return false;
      }
      iR++;iC++;
    }    
    if(board[row][col]==null){
      return checkHorizontal(iCol,iRow,col,row);
    }else if(board[iRow][iCol].playertype().equals(board[row][col].playertype())){
      return false; 
    }else{
      return true;
    }
  }
}
