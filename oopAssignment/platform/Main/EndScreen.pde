
EndScreen end = new EndScreen();
class EndScreen extends SpaceMan
{
   int Ex = (width / 2 + 80);
   int Ey = 75;
   int hScore;
   
   // box variables; 
   float posX = 66.6;
   float posY = 120; // 600 / 5
   float posWidth = 133.3 * 2;
   float posHeight = 250;
   
   float imageY = 600 / 1.55;
   float imageX1 = 80;
   float imageX2 = 270;
   int picSize = 50;
   
   float scoreX = 400 / 2.666666;
   float scoreY = 600 / 3.52;
   
   void display() {
     controls = false;
     textSize(40);
     fill(255);
     text("GAME OVER!", Ex, Ey);
     
     // display box for player results and best score
     fill(255);
     stroke(#A0A0A0);
     strokeWeight(20);
     rect(posX, posY, posWidth, posHeight, 5);
     strokeWeight(1);
     
     textSize(30);
     fill(0);
     
     // player score during the game
     text("SCORE", scoreX, scoreY);
     text(PScore, scoreX + 35, scoreY + 50);
     
     // best score read in from file
     text("BEST SCORE", scoreX - 35, scoreY + 120);
     
     for(int i = 0; i < data.length; i ++) {
        for(int j = 0; j < data.length; j ++) {
          if(data[i] >= data[j]) {
             hScore = data[i];
          }
        } 
     }
     if(PScore >= 10 || hScore >= 10) {
         textSize(25);
     }
     if(PScore >= hScore) {
       String stringPScore = str(PScore);
       String[] list = split(stringPScore, ' ');
       saveStrings("data.txt", list);
       text(PScore, scoreX + 35, scoreY + 120 + 50);
     }
     else if(hScore > PScore) {
       text(hScore, scoreX + 35, scoreY + 120 + 50);
     }
     
     
     // display the home and play button to user.
     image(img, imageX1, imageY);
     image(img2, imageX2, imageY);
     
     if(mousePressed) {
        // home button if clicked 
        if( (mouseX >= imageX1) && (mouseX <= imageX1 + picSize) && (mouseY >= imageY) && (mouseY <= imageY + picSize) ) { 
           endScreen = false;
           startScreen = true;
           controls = true;
           PScore = 0;
        }
        
        // play again button if clicked.
        if( (mouseX >= imageX2) && (mouseX <= imageX2 + picSize) && (mouseY >= imageY) && (mouseY <= imageY + picSize) ) {
          
        }
     }
     
   } 
}
