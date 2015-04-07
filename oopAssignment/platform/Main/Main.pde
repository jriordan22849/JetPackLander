PImage img, img2, title;

ArrayList<Platform> plat = new ArrayList<Platform>();
ArrayList<Platform> newPlat = new ArrayList<Platform>(100);
ArrayList<Background> stars = new ArrayList<Background>(100);

boolean controls = true;

boolean startScreen = true;
boolean playing_screen = false;
boolean endScreen = false;

boolean boxes = true;

boolean bPlatform = true;
boolean onPlatform = false;
boolean playerOn = false;
boolean checkPos = true;
boolean new_platform = false;
boolean startWidth = true;
boolean startPlatformX = true;
boolean playerScore = true;
boolean platformYheight = false;
boolean scoreToDisplay = false;

boolean playButton = false;
boolean leaderboardButton = false;
boolean infoButton = false;

boolean speedVar = true;
boolean pButton = false;
boolean iButton = false;
boolean lButton = false;
int PScore = 0;

// high score array;
int[] data; 

void setup() {
  size(400, 600);
  background(0);
  // load images 
  img = loadImage("HomeButton.png");
  img2 = loadImage("PlayAgain.png");
  title = loadImage("namePic.png");
  // load text file as a string
  String[] highScore = loadStrings("data.txt");
  data = int(split(highScore[0],','));
  createPlatform();
  createStars();
}

void draw() {
  
  if(startScreen == true) {
    for(int i = 0; i < plat.size(); i ++) {
       //background(150);
       // draws background
       bGround.display1();
       
       // draws stars
       if(bGround.backgroundNumber <= 2) {
         for(int j = 0; j < stars.size(); j ++) {
           stars.get(j).drawStars(); 
         }
       }
       
       
       spaceMan.update();
       spaceMan.display();
       
       println(spaceMan.pos.x +20);
       println(plat.get(i).PlatformX + plat.get(i).PlatformWidth);
       
       plat.get(i).display(); 
       
       if(bPlatform == true) {
         plat.get(i).beginingPlatform();
       }
       plat.get(i).PlayerHitDetection();
    }
    
    if(endScreen == true) { 
    }
    else {
      if(scoreToDisplay == true) {
        pscore.display();
      }
    }
    
    if(playButton == false && leaderboardButton == false && infoButton == false && endScreen == false) {
      controls = false;
      start.display();
      start.update(); 
    }
  }
    if(endScreen == true) {
      controls = false;
      startScreen = false;
      end.display();
    }
}

void createPlatform() {
 
 int num_platform = 1; 
 int space = 0;
 int bPlatformWidth;
 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformWidth = (int)random(30, 61);
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
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
   newPlat.add(new Platform(bPlatformWidth));
   startWidth = false;
 }

}

 void createStars() {
    int numStars = 20;
    int starWL = 2;
    
    for(int i = 0; i < numStars; i ++) {
      int starX = (int)random(0, 600);
      int starY = (int)random(0, 400);
      stars.add(new Background(starX, starY, starWL));
    }
 }


