boolean Bishop(int iCol, int iRow, int col, int row){
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

boolean checkHorizontal(int iRow, int iCol, int row, int col){
  if(iRow%2 == 1){//odd
    //in black space
    if(iCol%2 == 0){
      if((row%2 == 1 && col%2==0) || (row%2 == 0 && col%2==1))return true;
      else return false;
    }
    //in white space
    else if(iCol%2==1){
      if((row%2 == 1 && col%2==1) || row%2 == 0 && col%2==0)return true;
      else return false;
    }else return false;
  }
  else if(iRow%2 == 0){//even
  //in black space
    if(iCol%2 == 1){
      if((row%2 == 1 && col%2==0) || (row%2 == 0 && col%2==1))return true;
      else return false;
    }
    //in white space
    else if(iCol%2 == 0){
      if((row%2 == 1 && col%2==1) || row%2 == 0 && col%2==0)return true;
      else return false;
    }else return false;
  }else return false;
}
