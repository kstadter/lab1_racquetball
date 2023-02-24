  float circlex;
  float circley;
  
  float xAdd;
  float yAdd;
  
  int paddley;
  
  int paddleLength;
  int paddleHeight;
  
  int GAP;
  
  int ballR;
  int ballG;
  int ballB;
  
  int colorCount;
  
  int rcount;
  int bcount;
  int gcount;
  
  int randoX;
  int randoY;
  
  int rectCenter;
  
  boolean play;
  boolean easy;
  boolean medium;
  boolean hard;
  
  boolean gameOver;
  boolean playAgain;
  boolean startScreen;
  boolean exit;
  
  int count = 0;
  int high; 
  boolean counter = false;
  int endscore;
  
  boolean prettyColor=true;//change this assignment to change the color
  //mode for the ball
  
  boolean noBackground;

void setup(){
  size(800,800);
  GAP=30;
  paddley=height-GAP;
  paddleLength=150;
  paddleHeight=30;
  
  strokeWeight(0);
  
  startScreen=true;
  noBackground=false;
}

//set value of playAgain to true when the mouse is clicked
void mousePressed(){
  if (play){
    noBackground=true;
  }
  //if the play again button is pressed  
  if (gameOver==true && (((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/2)+(height/8)-(height/32) && (mouseY<=(height/2)+(height/8)+(height/32))))) {
    startScreen=true;
    
    //make every other boolean false
    gameOver=false;
    play=false;
    easy=false;
    medium=false;
    hard=false;
    playAgain=false;
    exit = false;
  // if the exit button is pressed
  }else if (gameOver==true && ((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/2)+(height/4)-(height/32) && (mouseY<=(height/2)+(height/4)+(height/32)))){
    exit=true;
  //if the easy button is pressed
  }else if(startScreen==true && ((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/3)-height/32 && (mouseY<=(height/3)+(height/32)))){
    easy=true;
  //if the medium button is pressed
  }else if((startScreen==true) && ((mouseX<=(height/2+height/8)) && (mouseX>=height/2-height/8)) && ((mouseY>= (height/3+height/6)-height/32) && (mouseY<=height/3+height/6+height/32))){
    medium=true;
  //if the hard button is pressed
  }else if((startScreen==true) && ((mouseX<=(height/2+height/8))&&(mouseX>=height/2-height/8)) && ((mouseY>=(height/3+height/3)-height/32) && (mouseY<=(height/3+height/3)+height/32))){
    hard=true;
  }else{
    easy=false;
    medium=false;
    hard=false;
    playAgain=false;
    exit = false;
  }
}

void mouseReleased(){
  noBackground=false;
}

void keyPressed(){
  if (gameOver){
    startScreen=true;
    
    gameOver=false;
    play=false;
    easy=false;
    medium=false;
    hard=false;
    playAgain=false;
    exit = false;
  }
}

void draw(){
  
//start screen
  if (startScreen){
    start2(startScreen);
    count = 0;
  }
  
 if (play){
   counter=true;
 }
 
 if (gameOver){
   counter=false;
 }
 
//play screen
  playFunction(play);
  
} //end draw 
