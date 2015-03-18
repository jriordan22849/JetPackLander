ArrayList<Platform> plat = new ArrayList<Platform>();

boolean start_screen = false;
boolean playing_screen = true;
boolean boxes = true;

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
      plat.get(i).display(); 
       spaceMan.update();
       spaceMan.display();
    }
  }
}

void createPlatform() {
 int num_platform = 1; 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformX = (int)random(200, 400);
   int PlatformY = height -100;
   int PlatformWidth = (int)random(30,121);
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
 }
 
}
