class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  int PlatformWidth1;
  int PlatformX1;
  int PlatformY1;
  int beginPlatformWidth;
  int bPlatformWidth;
  
  // begining Platform
  int beginPlatform = 20;
  
  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
  
  Platform(int bPlatformWidth) {
    this.bPlatformWidth = bPlatformWidth;
  } 
 
 
  void display() {
    fill(255);
    stroke(255);

    if(startPlatformX == true) {
      PlatformWidth = 30;
      startPlatformX = false;
    }
    rect(PlatformX, PlatformY, PlatformWidth, 100, 5); 
  } 
  
  void beginingPlatform() {
      
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
      rect(beginPlatform, PlatformY, beginPlatformWidth, height - 150, 5);
      println(beginPlatformWidth);
  }
  
  void PlayerHitDetection() {
    for(int i = 0; i < plat.size(); i ++) {
    if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+15 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
    { 
      if(spaceMan.pos.x + 30 <= plat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
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
      beginPlatform--;
      plat.get(i).PlatformX--;
      spaceMan.pos.x--;
            
      if(plat.get(i).PlatformX <= 20) {
          createPlatform();
          startWidth = false;
          beginPlatform = 20;
          controls = true; 
          playerScore = true;
          playerOn = false;
          plat.remove(i);
      }
    } 
  }
  }
  
  void playerhitdetection2()  {
    for(int i = 0; i < newPlat.size(); i ++) {
    if((spaceMan.pos.x+50 >= newPlat.get(i).PlatformX) && (spaceMan.pos.x+15 < newPlat.get(i).PlatformX + newPlat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= newPlat.get(i).PlatformY))
    {
      if(spaceMan.pos.x + 30 <= newPlat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
      }              
    }
    }
  }
}
