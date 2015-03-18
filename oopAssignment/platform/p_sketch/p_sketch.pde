ArrayList<Platform> plat = new ArrayList<Platform>();

boolean start_screen = false;
boolean playing_screen = true;
boolean boxes = true;
boolean bPlatform = true;
boolean onPlatform = true;

int PScore = 0;

void setup() {
  size(400, 600);
  background(0);
  
  createPlatform();
}

void draw() {
  
  if(start_screen == true && boxes == true) {
    background(0);
    start.display();
    start.update(); 
  }
  if(playing_screen == true)
  {
    for(int i = 0; i < plat.size(); i ++) {
       background(200);
       spaceMan.update();
       spaceMan.display();
       
       plat.get(i).display(); 
       if(bPlatform == true) {
         plat.get(i).beginingPlatform();
       }
       plat.get(i).PlayerHitDetection();
    }
    
    pscore.display();
  }
}

void createPlatform() {
 int num_platform = 1; 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformWidth = 30;
   int PlatformX = (int)random(200, width - PlatformWidth);
   int PlatformY = height -100;
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
 }
 
}
