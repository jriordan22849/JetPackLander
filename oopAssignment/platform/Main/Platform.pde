class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  int PlatformWidth1;
  int PlatformX1;
  int PlatformY1;
  
  // begining Platform
  int beginPlatform = 20;
  int beginPlatformWidth = 30;

  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
 
  void display() {
    fill(255);
    stroke(255);
    rect(PlatformX, PlatformY, PlatformWidth, 100, 5); 
  } 
  
  void beginingPlatform() {
      fill(255);
      stroke(255);
      rect(beginPlatform, PlatformY, beginPlatformWidth, height - 150, 5);
  }
  
  void PlayerHitDetection() {
    if((spaceMan.pos.x+50 >= PlatformX) && (spaceMan.pos.x+15 < PlatformX+PlatformWidth) && (spaceMan.pos.y+100 >= PlatformY))
    {
      if(onPlatform == true) {      
        PScore += 1;
        playerOn = true;
        controls = false;
        onPlatform = false;    
      }  
      
      if(spaceMan.pos.x + 30 <= PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
      }             
    }
    
    if(playerOn == true) {
      beginPlatform--;
      PlatformX--;
      spaceMan.pos.x--;
      
      if(PlatformX <= 20) {
        PlatformX = 20;
        controls = true; 
        playerOn = false;
      }
    } 
  }
}
