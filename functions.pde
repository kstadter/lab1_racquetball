
//assign xAdd a random value between 1 and -1
float assignX(int num){
  if (num%2==1){
    xAdd=-1;
  }else{
    xAdd=1;
  }
  
  return xAdd;
}

//assign yAdd a random value between 1 and -1
float assignY(int num){
  if (num%2==1){
    yAdd=-1;
  }else{
    yAdd=1;
  }
  
  return yAdd;
}

//start screen

void start2(boolean k){
  if (k){
    
    /*random values between 1 and 2 to give xAdd and yAdd
    a 50% chance to be 1 or -1*/
    randoX=round(random(0,2));
    randoY=round(random(0,2));
  
    //assign xAdd 1 or -1 randomly
    assignX(randoX);
  
    //assign yAdd 1 or -1 randomly
    assignY(randoY);
  
    
    //background
    background(0);
    
    scoreboard(k, counter);
    
    //PONG
    fill(255);
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(50);
    text("PONG", height/2,height/8);
    
    //game instructions
    fill(255);
    textSize(16);
    text("Use your mouse to move the paddle at the bottom of your screen.", height/2, height/9+height/12);
    text("Bounce the ball off of the paddle to score points.", height/2, height/9+height/9);
    text("Don't let the ball fall off the screen, or you'll lose.", height/2, height/9+height/8+height/72);
    
    //paddle sizes
    rect(height/2,height/3,height/4,height/16);
    fill(0,0,0);
    textSize(20);
    text("easy",height/2,height/3+(height/128));
    fill(255);
    textSize(16);
    text("a small 100px paddle and a slow ball make for a simple challenge", height/2, height/3+height/14);
    
    fill(255);
    rect(height/2,(height/3)+(height/6),height/4,height/16);
    fill(0,0,0);
    textSize(20);
    text("medium", height/2,height/3+height/6+(height/128));
    fill(255);
    textSize(16);
    text("a medium 200px paddle and slightly faster ball make for an intermediate level", height/2, height/3+height/6+height/14);
    
    fill(255);
    rect(height/2,(height/3)+(height/3),height/4,height/16);
    fill(0,0,0);
    textSize(20);
    text("hard", height/2,((height/3)+(height/3))+(height/128));
    fill(255);
    textSize(16);
    text("a large 300px paddle, but the fastest ball, a difficult challenge", height/2, height/3+height/3+height/14);
    
    //if the easy button is hovered over
    if (startScreen &&((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/3)-height/32 && (mouseY<=(height/3)+(height/32)))) {
      cursor(HAND);
      if (easy){
        paddleLength=100;
        play=true;
        circlex=round(random(200,600));
        circley=round(random(200,400));
    }
    //if the medium button is hovered over
    }else if(startScreen &&((mouseX<=(height/2+height/8)) && (mouseX>=height/2-height/8)) && ((mouseY>= (height/3+height/6)-height/32) && (mouseY<=height/3+height/6+height/32))){
      cursor(HAND);
      if(medium){
        paddleLength=200;
        yAdd=yAdd*1.25;
        xAdd=xAdd*1.25;
        play=true;
        circlex=round(random(200,600));
        circley=round(random(200,400));
      }
    //if the hard button is hovered over
    }else if (startScreen && ((mouseX<=(height/2+height/8))&&(mouseX>=height/2-height/8)) && ((mouseY>=(height/3+height/3)-height/32) && (mouseY<=(height/3+height/3)+height/32))) {
      cursor(HAND);
      if (hard){
        paddleLength=300;
        yAdd=yAdd*3;
        xAdd=xAdd*3;
        play=true;
        circlex=round(random(200,600));
        circley=round(random(200,400));
      }
    }
    //if the exit game button is selected
    else if (!(startScreen) && ((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/2)+(height/8)-(height/32) && (mouseY<=(height/2)+(height/8)+(height/32)))){
      cursor(HAND);
      if (exit){
        exit();
      }
    }else{
      cursor(ARROW);
    }
    
    
  }//end of start screen
}//end of start function

//play function

void playFunction(boolean t){
  gameOver=false;
  
  if (t){
  
  cursor(ARROW);
  
  if (!noBackground){
    background(0);
  }
  
  gameOver=false;
  startScreen=false;
 
  
  // paddle
  rectMode(CENTER);
  stroke(255);
  fill(255);
  
  if (mouseX<=paddleLength/2){
    rect(paddleLength/2,paddley-(paddleHeight/2),paddleLength,30);
    rectCenter=paddleLength/2;
  }else if (mouseX>=height-(paddleLength/2)) {
    rect(height-(paddleLength/2), paddley-(paddleHeight/2),paddleLength,30);
    rectCenter=height-(paddleLength/2);
  }else{
    rect(mouseX,paddley-(paddleHeight/2),paddleLength,30);
    rectCenter=mouseX;
  }
   
    
  // ball

  //colors!!!
  
   if (!prettyColor){
     ballR=round(random(255));
     ballG=round(random(255));
     ballB=round(random(255));
   }else if (colorCount==0){
     ballR=round(random(255));
     ballG=round(random(255));
     ballB=round(random(255));
  }else{
    
    //ballR
    if (ballR==75){
      ballR++;
      rcount=0;
    } else if (ballR==255){
      ballR--;
      rcount=1;
    }else if (rcount==1){
      ballR--;
    }else if (rcount==0){
      ballR++;
    }
    
    //ballB
    if (ballB==75){
      ballB++;
      bcount=0;
    } else if (ballB==255){
      ballB--;
      bcount=1;
    }else if (bcount==1){
      ballB--;
    }else if (bcount==0){
      ballB++;
    }
    
    //ballG
    if (ballG==75){
      ballG++;
      gcount=0;
    } else if (ballG==255){
      ballG--;
      gcount=1;
    }else if (gcount==1){
      ballG--;
    }else if (gcount==0){
      ballG++;
    }
   
  } //end colors!!!
  
  scoreboard(t, counter);
  
  stroke(0, 0, 0);
  fill(ballR, ballG, ballB);
  
  //if it hits the wall, bounce back
 if (circlex<=0+25){
    xAdd=xAdd*-1;
  }else if (circlex>=width-25){
    xAdd=xAdd*-1;
  }

//if it hits the ceiling, bounce back
  if (circley<=0+25){
    yAdd=yAdd*-1;
    
//if it hits the paddle, bounce back
  }else if (((circley>=(height-(paddleHeight+GAP+25))) && ((circlex<=(25+rectCenter+paddleLength/2))&&(circlex>=25+rectCenter-paddleLength/2)))){
    yAdd=yAdd*-1;
    countAdd();
    
//if it goes past the paddle, display "GAME OVER" page
  }else if (play &&(circley>=height-(paddleHeight+GAP-25) && ((circlex>=(25+rectCenter+paddleLength/2))||(circlex<=25+rectCenter-paddleLength/2)))){
    counter=false;
    endscore = countAdd();
    circlex = width +100;
    gameOver=true;
  }
  
  end(gameOver);
  
  circle(circlex, circley,50);
  
  circley=circley+yAdd;
  circlex=circlex+xAdd;
  
  colorCount++;

}//end of play
}//end of play function


void end(boolean e){
  if (e){
    
    counter=false;
    scoreboard(e, counter);
    endBoard(gameOver, counter);
    highscore(endscore);
    
    fill(ballR,ballG,ballB);
    
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", height/2,height/2);
    
    rect(height/2,(height/2)+(height/8),height/4,height/16);
    fill(0,0,0);
    textSize(20);
    text("play again!",height/2,((height/2)+(height/8))+(height/128));
    
    fill(ballR,ballG,ballB);
    rect(height/2,(height/2)+(height/4),height/4,height/16);
    fill(0,0,0);
    textSize(20);
    text("exit game", height/2,((height/2)+(height/4))+(height/128));
    
    fill(ballR,ballG,ballB);
    text("or press any key to start over", height/2, (height/2+height/4)+height/8);
    
    xAdd=0;
    yAdd=0;
    
    fill(0);
    
    if (((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/2)+(height/8)-(height/32) && (mouseY<=(height/2)+(height/8)+(height/32)))) {
      cursor(HAND);
    }else if (((mouseX<=(height/2)+(height/8)) && (mouseX>=(height/2)-(height/8))) && (mouseY>=(height/2)+(height/4)-(height/32) && (mouseY<=(height/2)+(height/4)+(height/32)))){
      cursor(HAND);

    }else{
      cursor(ARROW);
    }
  
  if (exit){
        exit();
  }
  }
}//end of end function


int countAdd(){
  if (counter){
    count++;
    
    if (xAdd >0){
      xAdd+=0.5;
    }else if (xAdd<0){
      xAdd-=0.5;
    }
    
    if (yAdd >0){
      yAdd+=0.5;
    }else if (yAdd<0){
      yAdd-=0.5;
    }
  }
  return count;
}

void highscore(int x){
  if (x>high){
    high = x;
  }
  fill(255);
  text("HIGH SCORE: " + high + " points", width/6, height/32);
}

void scoreboard(boolean a, boolean b){
  if (a && b){
    textSize(20);
    fill(255);
    text(count + " points", width-width/12, height/32);
  }
}

void endBoard(boolean a, boolean b){
  if (a && !b){
    fill(255);
    text(endscore + " points", width-width/12, height/32);
  }
}

//void counterCheck(boolean x){
//  if (play){
//    x = true;
//  }
  
//  if (gameOver){
//    x = false;
//  }
//}
 
