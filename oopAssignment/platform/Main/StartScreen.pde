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
    // First box - Play button display
    fill(#FF8B8B);
    stroke(#FF0808);
    rect(posX + vSpeed, posY - 200 + speed, posLength, posWidth, 5); 
    
    fill(255);
    text("Play", (width / 2) - 40 + vSpeed, posY + speed - 160);
    
    // second box on main menu - leaderboard 
    fill(#FF8B8B);
    rect(posX + vSpeed, posY - 100 + speed, posLength, posWidth, 5); 
    
    fill(255);
    text("Leaderboard", (width / 2) - 120 + vSpeed, posY + speed - 60);
    
    // third box on main menu - information 
    fill(#FF8B8B);
    rect(posX + vSpeed, posY + speed, posLength, posWidth, 5);
    
    fill(255);
    text("Information", (width / 2) - 120 + vSpeed, posY + speed + 40);
    
    // First box on main menu - high lighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 200) && (mouseY <= posY - 200 + posWidth) ) {
      fill(#FF0808);
      text("Play", (width / 2) - 40 + vSpeed, posY + speed - 160);
    }
    
    // second box on main menu - highlighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY - 100) && (mouseY <= posY - 100 + posWidth) ) {
      fill(#FF0808);
      text("Leaderboard", (width / 2) - 120 + vSpeed, posY + speed - 60);
    }
    
    // third box on main mneu - highlighted
    if( (mouseX >= posX) && (mouseX <= posX + posLength) && (mouseY >= posY) && (mouseY <= posY + posWidth) ) {
      fill(#FF0808);
      text("Information", (width / 2) - 120 + vSpeed, posY + speed + 40);
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
      if(posY + speed <= - 50) {
        playButton = true;
      } 
    }
    if(lButton == true) {
      vSpeed -= 4;
      if(posX + posLength <= - 50) {
        leaderboardButton = true;
      } 
    }
    
    if(iButton == true) {
      vSpeed += 4;
      if(posX <= - width + 50) {
        infoButton = true;
      } 
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
