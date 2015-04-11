leaderBoard lBoard = new leaderBoard();
class leaderBoard {
  
  float lx = 66.6;
  int ly = 100;
  int boxLy = 150;
  float boxWL = 133.3 * 2;
  
  int hScore;
  int tSize = 60;
  
  int imageWL = 50;
   
  
  leaderBoard()  {
  }
  
   void display() {  
      bGround.display1();
      
       for(int i = 0; i < plat.size(); i ++) {
         // draws background
         bGround.display1();
       
         // draws stars if the background number is less than or equal to 1,
         // as they are the space backgrounds
         if(bGround.backgroundNumber <= 1) {
           for(int j = 0; j < stars.size(); j ++) {
             stars.get(j).drawStars(); 
           }
         }
       
         // calls spaceman function to draw and update the display of the character
         spaceMan.update();
         spaceMan.display();
       
         // Displays the platform
         plat.get(i).display(); 
         
       if(bPlatform == true) {
         plat.get(i).beginingPlatform();
       }
     }
     
//     fill(255);
//     text("Leaderboard", lx + 5,ly);
     
     fill(255);
     stroke(#A0A0A0);
     strokeWeight(20);
     rect(lx, boxLy, boxWL, boxWL);
     strokeWeight(1);
     
     textSize(30);
     fill(0);
     text("Best Score:", lx * 2 - 10, ly * 2);
     
     textSize(tSize);
     fill(#FF1A1A);
     
     
     for(int i = 0; i < data.length; i ++) {
        for(int j = 0; j < data.length; j ++) {
          if(data[i] >= data[j]) {
             hScore = data[i];
          }
        } 
     }
     
    if(hScore > PScore) {
      if(hScore >= 10) {
       text(hScore, (width / 2.58), ly * 3);
      }
      
      if(hScore < 10) {
        text(hScore, (width / 2.28), ly * 3);
      }
      //leaderboard image
      image(leaderBoardImage, (width / 2) - 150, ly - 50);
      
      
      // home button image
      image(homeButtonImage, (width / 2) - 25, ly * 3.5);
     }
   }
     
     void update() {
//      if( (mouseX >= 175) && (mouseX <= 175 + 50 ) && (mouseY >= 350) && (mouseY <= 350 + 50) ) {
//         background(0);
//      }
      
      if(mousePressed) {
      if( (mouseX >= (width / 2) - 25) && (mouseX <= (width / 2) - 25 + imageWL) && (mouseY >= ly *3.5) && (mouseY <= (ly * 3.5) + imageWL) ) {
        leaderboardButton = false;
        lButton = false;
        speedVar = false;
        startScreen = true;

      }
      } 
     }
   }
   
