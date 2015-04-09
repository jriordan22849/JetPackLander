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
    pSpeed -= 4;
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
      if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+20 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
      && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
      { 
 
        if(spaceMan.pos.x + 50 <= plat.get(i).PlatformX + (PlatformWidth)) {
        //if(spaceMan.pos.x>= plat.get(i).PlatformX ){
          spaceMan.pos.x ++;
        
        if(playerScore == true) {
          PScore++;
          playerScore = false;
        }
        playerOn = true;
        controls = false;
        onPlatform = false; 
      } 
      
      else if(spaceMan.pos.x + 20 <= plat.get(i).PlatformX + (PlatformWidth)) { //left side of platform
        //if(spaceMan.pos.x>= plat.get(i).PlatformX ){
          spaceMan.pos.x -= 2;

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
        beginPlatform -= 4;
        plat.get(i).PlatformX -= 4;
        spaceMan.pos.x -= 4;
 
        if(plat.get(i).PlatformX <= 20) {
          createPlatform();
          startWidth = false;
          beginPlatform = 20;
          PlatformY = height - 100;
          controls = true; 
          playerScore = true;
          checkPos = true;
          playerOn = false;
          plat.remove(i);
        }
      }
      if( (spaceMan.pos.x + 20 < plat.get(i).PlatformX) && (spaceMan.pos.x + 20 > beginPlatform + beginPlatformWidth)
      && (spaceMan.pos.y + 100 >= plat.get(i).PlatformY)) {
         if(playerOn == false && spaceMan.pos.y + 100 >= plat.get(i).PlatformY) {
            endScreen = true;
            end.display();
         }
      }
      
      if( (spaceMan.pos.x + 20 > plat.get(i).PlatformX + plat.get(i).PlatformWidth) && (spaceMan.pos.x + 20 > beginPlatform + beginPlatformWidth)
      && (spaceMan.pos.y + 100 >= plat.get(i).PlatformY)) {
         if(playerOn == false && spaceMan.pos.y + 100 >= plat.get(i).PlatformY) {
           endScreen = true; 
           end.display();
         }
      }
    }// end of for loop
  }
}
