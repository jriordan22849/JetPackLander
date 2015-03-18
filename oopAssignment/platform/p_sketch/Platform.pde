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
//         if(dist(PlatformX, PlatformY - 100, spaceMan.pos.x, spaceMan.pos.y - PlatformWidth) < PlatformWidth||
//            dist(PlatformX+PlatformWidth, PlatformY - 100, spaceMan.pos.x, spaceMan.pos.y - PlatformWidth)< 1)
         if((spaceMan.pos.x+50 >= PlatformX) && (spaceMan.pos.x+15 < PlatformX+PlatformWidth) && (spaceMan.pos.y+100 >= PlatformY))
         {
           if(onPlatform == true) {
             
             PScore += 1;
             onPlatform = false;
               
           }  
           if(spaceMan.pos.x + 30 <= PlatformX + (3 * PlatformWidth / 5)) {
             spaceMan.pos.x ++; 
           }  
           controls = false;      
           
         } 
      }
  }
}
