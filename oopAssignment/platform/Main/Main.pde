ArrayList<Platform> plat = new ArrayList<Platform>();
ArrayList<Platform> newPlat = new ArrayList<Platform>(100);

boolean controls = true;

boolean start_screen = true;
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
  
  // load text file as a string
  String[] highScore = loadStrings("data.txt");
  data = int(split(highScore[0],','));
  createPlatform();
}

void draw() {
  
  if(start_screen == true) {
    for(int i = 0; i < plat.size(); i ++) {
       background(200);
       
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
      pscore.display();
    }
    
    if(playButton == false && leaderboardButton == false && infoButton == false && endScreen == false) {
      controls = false;
      start.display();
      start.update(); 
    }
  }
    if(endScreen == true) {
      controls = false;
      start_screen = false;
      end.display();
    }
}

void createPlatform() {
 
 int num_platform = 1; 
 int space = 0;
 int bPlatformWidth;
 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformWidth = (int)random(30, 120);
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


