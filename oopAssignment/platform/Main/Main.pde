ArrayList<Platform> plat = new ArrayList<Platform>();
ArrayList<Platform> newPlat = new ArrayList<Platform>(100);

boolean controls = true;
boolean start_screen = false;
boolean playing_screen = true;
boolean boxes = true;
boolean bPlatform = true;
boolean onPlatform = false;
boolean playerOn = false;
boolean new_platform = false;
boolean startWidth = true;
boolean startPlatformX = true;
boolean playerScore = true;
boolean platformYheight = false;

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
       println(spaceMan.pos.x +20);
       println(plat.get(i).PlatformX + plat.get(i).PlatformWidth);
       
       plat.get(i).display(); 
       if(bPlatform == true) {
         plat.get(i).beginingPlatform();
       }
       plat.get(i).PlayerHitDetection();
    }
    
//    if(new_platform = true) {
//    for(int i = 0; i < new_plat.size(); i ++) {
//       new_plat.get(i).display(); 
//       new_plat.get(i).playerhitdetection2();
//    }
//    }
    
    pscore.display();
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

//void create_new_platform() {
//   int num_platform = 100; 
//    for(int i = 0; i < num_platform; i ++) { 
//   int PlatformWidth = (int)random(30, 120);
//   int PlatformX = width + 50;
//   int PlatformY = height -100;
//   new_plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));  
//  }
//}

