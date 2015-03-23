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
    for(int i = 0; i < plat.size(); i ++) {
    if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+15 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
    { 
      if(spaceMan.pos.x + 30 <= plat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
        playerOn = true;
        controls = false;
        onPlatform = false; 
      }              
    }
    
    if(playerOn == true) {
      beginPlatform--;
      plat.get(i).PlatformX--;
      spaceMan.pos.x--;
      
      if(beginPlatform + beginPlatformWidth < 0) {
        bPlatform = false; 
      }
      
      if(plat.get(i).PlatformX <= 20) {
        create_new_platform();
        plat.get(i).PlatformX = 20;
        controls = true; 
        playerOn = false;
      }
    } 
  }
  }
  
  void playerhitdetection2()  {
    for(int i = 0; i < new_plat.size(); i ++) {
    if((spaceMan.pos.x+50 >= new_plat.get(i).PlatformX) && (spaceMan.pos.x+15 < new_plat.get(i).PlatformX + new_plat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= new_plat.get(i).PlatformY))
    {
      if(spaceMan.pos.x + 30 <= new_plat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
      }              
    }
    }
  }
}
