class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  int PlatformWidth1;
  int PlatformX1;
  int PlatformY1 = height - 100;
  int beginPlatformWidth;
  int bPlatformWidth;
  
  // begining Platform
  int beginPlatform = 20;
  int pSpeed = 0;
  
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
      PlatformY = height - 100;
      startPlatformX = false;
    }
    rect(PlatformX, PlatformY + pSpeed, PlatformWidth, 100, 5);
    pSpeed -= 2;
    if(PlatformY + pSpeed <= height - 100) {
      pSpeed = 0;
      PlatformY = height - 100; 
    }
   
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
      rect(beginPlatform, PlatformY1, beginPlatformWidth, height - 150, 5);
      println(beginPlatformWidth);
  }
  
  void PlayerHitDetection() {
    for(int i = 0; i < plat.size(); i ++) {
    if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+15 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
    { 
     // platformYheight = true;
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
      beginPlatform -= 2;
      plat.get(i).PlatformX -= 2;
      spaceMan.pos.x -= 2;
 
            
      if(plat.get(i).PlatformX <= 20) {
          createPlatform();
          startWidth = false;
          beginPlatform = 20;
          PlatformY = height - 100;
          controls = true; 
          playerScore = true;
          playerOn = false;
          plat.remove(i);
      }
    } 
//    for(int j = 0; j < plat.size(); j ++) {
//        plat.get(j).PlatformX--;
//    }
  }
  }
}
