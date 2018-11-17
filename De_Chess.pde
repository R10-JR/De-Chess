import java.util.*;
import java.io.*;

Pieces[][] board;
String selection = "main";
boolean playWithAI = false;

void setup(){
  background(0);
  size(1000,700);
  setupBoard();
}

void draw(){
/*Menu section*/
  if(selection.equals("main")){
   image(loadImage("/assets/menuBackground.jpg"), 0, 0, width, height);
   title();
   fill(255);
   menu();
   menuHover();
  }else if(selection.equals("rules")){
    loadRules();
    returnToMenu();
  }else if(selection.equals("AI")){
    loadGame();
    playWithAI = true;
    selection = "game";
  }else if(selection.equals("reference")){
    loadReference();
    returnToMenu();
  }
  /*Game section*/
  else if(selection.equals("game")){
    
  }
}

/**--- Menu --**/

/**/
void title(){
  fill(212,179,88);
  textFont(loadFont("TimesNewRomanPS-BoldMT-50.vlw"), 50);
  noStroke();
  text("De Chess", 200,100);
}

/*creates text to navigate the menu*/
void menu(){
 textSize(36);
 text("Player vs Player",200,200);
 text("Player vs AI",200,300);
 text("Rules",200,400);  
 text("Reference",200,500);  
}

/*creates a box when you hover over the text*/
void menuHover(){
  rectMode(CORNER);
  noFill();
  stroke(255);
  if(mouseX>=200 && mouseY>=170 && mouseY<210){
    rect(200,170,250,40);
  }
  if(mouseX>=200 && mouseY>=270 && mouseY<310){
    rect(200,270,200,40);
  }
  if(mouseX>=200 && mouseY>=370 && mouseY<=410){
    rect(200,370,200,40);
  }
  if(mouseX>=200 && mouseY>=470 && mouseY<=510){
    rect(200,470,200,40);
  }
}
void returnToMenu(){
  rectMode(CORNER);
  noFill();
  stroke(255);
  if(mouseX>=225 && mouseY>=640 && mouseY<=680){
    rect(225,640,250,40);
  }
}

/*loads rules of chess*/
void loadRules(){
  image(loadImage("/assets/menuBackground.jpg"), 0, 0, width, height);
  fill(255);
  noStroke();
  image(loadImage("/assets/rulezChess.jpg"),100,100,500,500);
  text("Return to Menu",225,670);
}

/*loads references for the project*/
void loadReference(){
  image(loadImage("/assets/menuBackground.jpg"), 0, 0, width, height);
  fill(255);
  noStroke();
  textSize(36);
  text("https://chessedaz.com/",0,36);
  text("     - Background Use",0,36*2);
  text("https://en.wikipedia.org/wiki/Chess_piece",0,36*5);
  text("                                    - 2D Chess Pieces",0,36*6);
  text("Return to Menu",225,670);
}

/**--- MAIN GAME ---**/
boolean isPlayersTurn = true;
String selectedPiece, player;
int selectedRow, selectedCol;

/*creates and displays the new board*/
void loadGame(){
  background(205,133,0);
  fill(255);
  strokeWeight(3);
  stroke(0);
  GameSetup();
  setupBoard();
  for(int row=0;row<=7;row++){
    for(int col=0;col<=7;col++){
      if(board[row][col] != null) board[row][col].show();
    }
  }
}

/*sets up new board with all pieces*/
void setupBoard(){
  board = new Pieces[8][8];
  for(int col=0;col<=7;col++){
    board[1][col] = new Pieces("pawn","opponent",1,col);
  }
  board[0][0] = new Pieces("rook","opponent",0,0);
  board[0][7] = new Pieces("rook","opponent",0,7);
  board[0][1] = new Pieces("knight","opponent",0,1);
  board[0][6] = new Pieces("knight","opponent",0,6);
  board[0][2] = new Pieces("bishop","opponent",0,2);
  board[0][5] = new Pieces("bishop","opponent",0,5);
  board[0][4] = new Pieces("king","opponent",0,4);
  board[0][3] = new Pieces("queen","opponent",0,3);
  for(int col=0;col<=7;col++){
    board[6][col] = new Pieces("pawn","player",6,col);
  }
  board[7][0] = new Pieces("rook","player",7,0);
  board[7][7] = new Pieces("rook","player",7,7);
  board[7][1] = new Pieces("knight","player",7,1);
  board[7][6] = new Pieces("knight","player",7,6);
  board[7][2] = new Pieces("bishop","player",7,2);
  board[7][5] = new Pieces("bishop","player",7,5);
  board[7][4] = new Pieces("king","player",7,4);
  board[7][3] = new Pieces("queen","player",7,3);
} 

void reDraw(){
  background(205,133,0);
  fill(255);
  strokeWeight(3);
  stroke(0);
  GameSetup();
  for(int row=0;row<=7;row++){
    for(int col=0;col<=7;col++){
      if(board[row][col] != null) board[row][col].show();
    }
  }
}

/*--Mouse Method--*/
int savedCol, savedRow;
/*mouse method for all areas of project*/
void mousePressed(){
/*Menu section*/
  if(selection.equals("main")){
    if(mouseX>=200 && mouseY>=170 && mouseY<210){
      selection = "game";
      loadGame();
    }
    if(mouseX>=200 && mouseY>=270 && mouseY<310){
      selection = "AI";
      loadRules();
    }
    if(mouseX>=200 && mouseY>=370 && mouseY<=410){
      selection = "rules";
      loadReference();
    }
    if(mouseX>=200 && mouseY>=470 && mouseY<=510){
      selection = "reference";
      loadReference();
    }
  }else if(!selection.equals("game")){
    if(mouseX>=225 && mouseY>=640 && mouseY<=680){
      selection = "main";
    }
  }
  /*Game section*/
  if(selection.equals("game")){
    /*chess game interaction*/
    savedCol = Math.abs(Math.round((iBoardX-mouseX)/SQsize));
    savedRow = Math.abs(Math.round((iBoardY-mouseY)/SQsize));
  }
}
void mouseReleased(){
  int col = Math.abs(Math.round((iBoardX-mouseX)/SQsize));
  int row = Math.abs(Math.round((iBoardY-mouseY)/SQsize));
  if(savedCol<8 && savedCol>=0 && savedRow<8 && savedRow >= 0 && col<8 && col>=0 && row<8 && row >= 0 && selection.equals("game")){
    if(savedCol==col&&savedRow==row) return;
    Pieces p = board[savedRow][savedCol];
    if(p == null) return;
    if((p.playertype().equals("player") && isPlayersTurn != true)||(p.playertype().equals("opponent") && isPlayersTurn != false)) return;
    if(p.isLegal(savedCol,savedRow,col,row)){
      board[savedRow][savedCol]=null; 
      board[row][col]=p;
      p.move(row, col);
      reDraw();
      isPlayersTurn = !isPlayersTurn;
    }
  }
  if(isPlayersTurn == false && playWithAI == true){
    int i=0;
    while(i<1000000000){ i++;}
    if(i>=1000000000){
      AI();
      for(int r=0;r<8;r++){
      for(int c=0;c<8;c++){
        Pieces p = board[r][c];
          if(p!=null){
            p.move(r,c);
          }
        }
      }
      reDraw();
      isPlayersTurn = !isPlayersTurn;
    }
  }
  boolean wKing = false, bKing =false;
  for(int r=0;r<8;r++){
    for(int c=0;c<8;c++){
      if(board[r][c]!=null){
        if (board[r][c].chessType().equals("king") && board[r][c].playertype().equals("player")) wKing = true;
        else if (board[r][c].chessType().equals("king") && board[r][c].playertype().equals("opponent")) bKing = true;
      }
    }
  }
  if(wKing==false||bKing==false){
    GameOver();
  }
}
