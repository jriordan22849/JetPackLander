class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  // begining Platform
  int beginPlatform = 20;
  int beginPlatformWidth;

  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
 
  void display() {
    fill(255);
    stroke(255);
    rect(PlatformX, PlatformY, PlatformWidth, 100); 
  } 
  
  void beginingPlatform() {
      fill(255);
      stroke(255);
      rect(beginPlatform, PlatformY, 30, height - 150);
  }
  
  void PlayerHitDetection() {
      for(int i = 0; i < plat.size(); i ++) {
        println("x",PlatformX);
        println("playerX", spaceMan.pos.x);
        println("y",PlatformY);
         println("playerY", pos.y);
         if(dist(PlatformX, PlatformY-90, spaceMan.pos.x , spaceMan.pos.y ) < 20)
         {
           background(140);
         } 
      }
  }
}
