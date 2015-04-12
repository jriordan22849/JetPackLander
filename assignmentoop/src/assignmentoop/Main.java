package assignmentoop;
import processing.core.*;
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {
	
Information info = new Information(this);
StartScreen start = new StartScreen(this);
SpaceMan spaceMan = new SpaceMan(this);
PlayerScore pscore = new PlayerScore(this);
leaderBoard lBoard = new leaderBoard();
Background bGround = new Background();
EndScreen end = new EndScreen();

static PImage img;
PImage img2;
static PImage title;
PImage tree;
PImage homeButtonImage;
PImage leaderBoardImage;
static PImage infoScreen;

ArrayList<Platform> plat = new ArrayList<Platform>();
ArrayList<Platform> newPlat = new ArrayList<Platform>(100);
ArrayList<Background> stars = new ArrayList<Background>(100);

static boolean controls = true;

static boolean startScreen = true;
boolean playingScreen = false;
static boolean informationScreen = false;
boolean endScreen = false;

boolean boxes = true;
boolean click = true;

boolean bPlatform = true;
boolean onPlatform = false;
boolean playerOn = false;
boolean checkPos = true;
boolean new_platform = false;
boolean startWidth = true;
boolean startPlatformX = true;
boolean playerScore = true;
boolean platformYheight = false;
static boolean scoreToDisplay = false;

static boolean playButton = false;
static boolean leaderboardButton = false;
boolean infoButton = false;

static boolean speedVar = true;
static boolean pButton = false;
static boolean iButton = false;
static boolean lButton = false;

static int PScore = 0;

// high score array;
int[] data; 

public void setup() {
  size(400, 600);
  background(0);
  
  // load images 
  img = loadImage("HomeButton.png");
  img2 = loadImage("PlayAgain.png");
  title = loadImage("namePic.png");
  tree = loadImage("tree.png");
  homeButtonImage = loadImage("HomeButton.png");
  leaderBoardImage = loadImage("leaderboardImage.png");
  infoScreen = loadImage("infoScreen.png");
  
  // load text file as a string
  String[] highScore = loadStrings("data.txt");
  data = PApplet.parseInt(split(highScore[0],','));
  
  createPlatform();
  createStars();
}

public void draw() {
  
  if(startScreen == true) {
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
       plat.get(i).PlayerHitDetection();
    }
      
    // Main mneu booleans to start the game
    if(playButton == false && leaderboardButton == false && infoButton == false && endScreen == false) {
      controls = false;
      start.display();
      start.update(); 
    }
    
    if(leaderboardButton == true) {
      controls = false;
      lBoard.display();
      lBoard.update();
    }
    
    if(informationScreen == true) {
       controls = false;
       info.display(); 
       info.update();
    }
    
 
  }
  
     // if end screen is true, dont display the score.
    // score is only displayed once the main menu is gone.
    if(endScreen == true) {
      controls = false;
      startScreen = true;
      spaceMan.pos.x = 0;
      end.display();
    }
    else {
      if(scoreToDisplay == true) {
        pscore.display();
      }
    }
  
}

// Creates platform using adding a random x and width to each platform
// the platform is then added to an arrayList
public void createPlatform() {
 
 int num_platform = 1; 
 int space = 0;
 int bPlatformWidth;
 
 for(int i = 0; i < num_platform; i ++) { 
   
   int PlatformWidth = (int)random(30, 41);
   
   if(startWidth == true) {
     bPlatformWidth = 30; 
   }
   else {
     bPlatformWidth = PlatformWidth;
   }
   
   int PlatformX = (int)random(200, width - PlatformWidth);
   int PlatformY = height;
   
   if(platformYheight == true) {
     PlatformY = height - 100;
   }
   // Add to arrayList
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
   newPlat.add(new Platform(bPlatformWidth));
   startWidth = false;
 }

}

// Function to create Stars in the background
// Random x and y positions are giving.
 public void createStars() {
    int numStars = 20;
    int starWL = 2;
    
    for(int i = 0; i < numStars; i ++) {
      int starX = (int)random(0, 600);
      int starY = (int)random(0, 400);
      stars.add(new Background(starX, starY, starWL));
    }
 }


class Background {
  
  int starX;
  int starY;
  int starWL;
  int backgroundNumber = (int)random(0,3);;
  
  // width and height for circle
  int wl = 300;
  
  // sun variables
  int sunX = 300;
  int sunY = 100;
  int sunWL = 100;
  int numLines = 5;
  int spacing = 0;
  
  
  Background(int starX, int starY, int starWL) {
    this.starX = starX;
    this.starY = starY;
    this.starWL = starWL;
  }
  
  Background() {
  }
  
  // displays stars from the an arraylist which have random x and y co-ordinates
  public void drawStars() {
    fill(255);
    stroke(255);
    for(int i = 0; i < stars.size(); i ++) {
       ellipse(stars.get(i).starX, stars.get(i).starY, stars.get(i).starWL, stars.get(i).starWL);       
    }
  }
  
  
  // display different background despending on the background number.
  public void display1() {
      background(0xff7C7A7A);
      if(backgroundNumber == 0) {
        // draw moon
        fill(0xffE3E3E3);
        stroke(0xff747474);
        strokeWeight(10);
        ellipse(width / 2, height / 3, wl, wl);
        strokeWeight(1);
      }
      if(backgroundNumber == 1) {
        // draw half moon
        fill(0xff7C7A7A);
        stroke(0xffE3E3E3);
        
        fill(0xffE3E3E3);
        ellipse(width / 2, height / 3, wl, wl);
        
        fill(0xff7C7A7A);
        stroke(0xff7C7A7A);
        ellipse(width / 3, height / 3, wl, wl);

      }
      
      if(backgroundNumber == 2) {
        // draw half moon
        background(0xff7E7E7E);
        image(tree, -40, 0);
      }
  }
}


class EndScreen extends SpaceMan
{
   int Ex = (width / 2 + 80);
   int Ey = 75;
   int hScore;
   
   // box variables; 
   float posX = 66.6f;
   float posY = 120; // 600 / 5
   float posWidth = 133.3f * 2;
   float posHeight = 250;
   
   float imageY = 600 / 1.55f;
   float imageX1 = 80;
   float imageX2 = (400 / 2) - 25;
   int picSize = 50;
   
   float scoreX = 400 / 2.666666f;
   float scoreY = 600 / 3.52f;
   
   public void display() {
     controls = false;
     textSize(40);
     fill(255);
     text("GAME OVER!", Ex, Ey);
     
     // display box for player results and best score
     fill(255);
     stroke(0xffA0A0A0);
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
    	 hScore = data[i];
     }
     if(PScore >= 10 || hScore >= 10) {
         textSize(30);
     }
     if(PScore >= hScore) {
       String stringPScore = str(PScore);
       String[] list = split(stringPScore, ' ');
       saveStrings("data.txt", list);
       text(PScore, scoreX + 35, scoreY + 120 + 50);
     }
     else if(hScore > PScore) {
       textSize(30);
       text(hScore, scoreX + 35, scoreY + 120 + 50);
     }
     
     
     // display the play button to user.
     image(img2, imageX2, imageY);
     
     if(mousePressed) {
        
        // play again button if clicked.
        if( (mouseX >= imageX2) && (mouseX <= imageX2 + picSize) && (mouseY >= imageY) && (mouseY <= imageY + picSize) ) {
           endScreen = false;
           startScreen = true;
           controls = true;
           PScore = 0;
        }
     }
     
   } 
}




class leaderBoard {
  
  float lx = 66.6f;
  int ly = 100;
  int boxLy = 150;
  float boxWL = 133.3f * 2;
  
  int hScore;
  int tSize = 60;
  
  int imageWL = 50;
   
  
  leaderBoard()  {
  }
  
   public void display() {  
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
     stroke(0xffA0A0A0);
     strokeWeight(20);
     rect(lx, boxLy, boxWL, boxWL);
     strokeWeight(1);
     
     textSize(30);
     fill(0);
     text("Best Score:", lx * 2 - 10, ly * 2.25f);
     
     textSize(tSize);
     fill(0xffFF1A1A);
     
     
     for(int i = 0; i < data.length; i ++) {
        for(int j = 0; j < data.length; j ++) {
          if(data[i] >= data[j]) {
             hScore = data[i];
          }
        } 
     }
     
    if(hScore > PScore) {
      if(hScore >= 10) {
       text(hScore, (width / 2.58f), ly * 3.25f);
      }
      
      if(hScore < 10) {
        text(hScore, (width / 2.28f), ly * 3.25f);
      }
      //leaderboard image
      image(leaderBoardImage, (width / 2) - 150, ly - 50);
      
      
      // home button image
      image(homeButtonImage, (width / 2) - 25, ly * 4.5f);
     }
   }
     
     public void update() {      
      if(mousePressed) {
        if( (mouseX >= (width / 2) - 25) && (mouseX <= (width / 2) - 25 + imageWL) && (mouseY >= ly * 4.5f) && (mouseY <= (ly * 4.5f) + imageWL) ) {
          leaderboardButton = false;
          lButton = false;
          speedVar = false;
          startScreen = true;
        }
      } 
     }
   }
   
class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  int PlatformWidth1;
  int PlatformX1;
  int PlatformY1 = height - 100;
  int beginPlatformWidth;
  int bPlatformWidth;
  
  // begining Platform
  int beginPlatform = 20;
  int pSpeed = 0;
  
  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
  
  Platform(int bPlatformWidth) {
    this.bPlatformWidth = bPlatformWidth;
  } 
 
 
  public void display() {
    fill(255);
    stroke(255);

    if(startPlatformX == true) {
      PlatformWidth = 30;
      PlatformY = height - 100;
      startPlatformX = false;
    }
    rect(PlatformX, PlatformY + pSpeed, PlatformWidth, 100, 5);
    pSpeed -= 4;
    if(PlatformY + pSpeed <= height - 100) {
      pSpeed = 0;
      PlatformY = height - 100; 
    }
   
  } 
  
  public void beginingPlatform() {
      
      for(int i = 0; i < newPlat.size(); i ++) {
        if(i == 0) {
          beginPlatformWidth = newPlat.get(i).bPlatformWidth;
        }

        
        if( i > 1) {
          beginPlatformWidth = newPlat.get(i - 1).bPlatformWidth;
        }
        
      }
     
      fill(255);
      stroke(255);
      rect(beginPlatform, PlatformY1, beginPlatformWidth, height - 150, 5);
  }
  
  public void PlayerHitDetection() {
    for(int i = 0; i < plat.size(); i ++) {
      if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+20 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
      && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
      { 
 
        if(spaceMan.pos.x + 50 <= plat.get(i).PlatformX + (PlatformWidth)) {
        //if(spaceMan.pos.x>= plat.get(i).PlatformX ){
          spaceMan.pos.x ++;
        
        if(playerScore == true) {
          PScore++;
          playerScore = false;
        }
        playerOn = true;
        controls = false;
        onPlatform = false; 
      } 
      
      else if(spaceMan.pos.x + 20 <= plat.get(i).PlatformX + (PlatformWidth)) { //left side of platform
        //if(spaceMan.pos.x>= plat.get(i).PlatformX ){
          spaceMan.pos.x -= 2;

        if(playerScore == true) {
          PScore++;
          playerScore = false;
        }
        playerOn = true;
        controls = false;
        onPlatform = false; 
      }              
    }
    
      if(playerOn == true) {
        beginPlatform -= 4;
        plat.get(i).PlatformX -= 4;
        spaceMan.pos.x -= 4;
 
        if(plat.get(i).PlatformX <= 20) {
          createPlatform();
          startWidth = false;
          beginPlatform = 20;
          PlatformY = height - 100;
          controls = true; 
          playerScore = true;
          checkPos = true;
          playerOn = false;
          plat.remove(i);
        }
      }
      if( (spaceMan.pos.x + 20 < plat.get(i).PlatformX) && (spaceMan.pos.x + 20 > beginPlatform + beginPlatformWidth)
      && (spaceMan.pos.y + 100 >= plat.get(i).PlatformY)) {
         if(playerOn == false && spaceMan.pos.y + 100 >= plat.get(i).PlatformY) {
            endScreen = true;
            end.display();
         }
      }
      
      if( (spaceMan.pos.x + 20 > plat.get(i).PlatformX + plat.get(i).PlatformWidth) && (spaceMan.pos.x + 20 > beginPlatform + beginPlatformWidth)
      && (spaceMan.pos.y + 100 >= plat.get(i).PlatformY)) {
         if(playerOn == false && spaceMan.pos.y + 100 >= plat.get(i).PlatformY) {
           endScreen = true; 
           end.display();
         }
      }
    }// end of for loop
  }
}










}
