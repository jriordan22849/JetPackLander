StartScreen start = new StartScreen();
class StartScreen
{
  int posX = 50;
  int posY = 0;
  int posWidth = 50;
  int posLength = 300;
  int speed = 0;
  int vSpeed = 0;
  
  public void display() {
    image(title, (width / 2)   - 70, posY - 300 + speed);
    textSize(40);
    // First box - Play button display
    fill(#ADADAD);
    stroke(#FF0808);
    rect(posX , posY - 200 + speed, posLength, posWidth, 5); 
    
    fill(255);
    text("Play", (width / 2) - 40 , posY + speed - 160);
    
    // second box on main menu - leaderboard 
    fill(#ADADAD);
    rect(posX , posY - 100 + speed, posLength, posWidth, 5); 
    
    fill(255);
    text("Leaderboard", (width / 2) - 120 , posY + speed - 60);
    
    // third box on main menu - information 
    fill(#ADADAD);
    rect(posX , posY + speed, posLength, posWidth, 5);
    
    fill(255);
    text("Information", (width / 2) - 120 , posY + speed + 40);
    
    // First box on main menu - high lighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 200) && (mouseY <= posY - 200 + posWidth) ) {
      fill(0);
      text("Play", (width / 2) - 40 , posY + speed - 160);
    }
    
    // second box on main menu - highlighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 100) && (mouseY <= posY - 100 + posWidth) ) {
      fill(0);
      text("Leaderboard", (width / 2) - 120 , posY + speed - 60);
    }
    
    // third box on main mneu - highlighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY) && (mouseY <= posY + posWidth) ) {
      fill(0);
      text("Information", (width / 2) - 120 , posY + speed + 40);
    }
  }
  
  public void update() {
    if(speedVar == true) {
      speed += 4;
    }
    if(posY + speed > 350) {
      speed = 0;
      posY = 350;
      speedVar = false;
    }  
    if(pButton == true) {
      speed -= 4;
      controls = true;
      if(posY + speed <= - 50) {
        playButton = true;
        scoreToDisplay = true;
      } 
    }
    
    if(lButton == true) {
      vSpeed -= 4;
      leaderboardButton = true;
      if(posX + posLength + vSpeed <= -50) {
        leaderboardButton = true;
        vSpeed = 0;
      } 
    }
    
    if(iButton == true) {
      informationScreen = true;
      vSpeed += 4;
      if(posX <= - width + 50) {
        informationScreen = true;
        vSpeed = 0;
      } 
    }
     
    if(lButton == false && iButton == false && leaderboardButton == false && startScreen == true) {
       vSpeed = 0; 
    }
    if(mousePressed) {
      if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 200) && (mouseY <= posY - 200 + posWidth) ) {
        pButton = true;
      }
      if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 100) && (mouseY <= posY - 100 + posWidth) ) {
        lButton = true;
      }
      if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY) && (mouseY <= posY + posWidth) ) {
        iButton = true;
      }
    }
  }
}
