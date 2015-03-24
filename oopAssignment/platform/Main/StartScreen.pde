StartScreen start = new StartScreen();
class StartScreen
{
  int posX = 50;
  int posY = 0;
  int posWidth = 300;
  int posLength = 50;
  int speed = 0;
  
  public void display() {
    fill(255,217,90);
    rect(posX, posY - 200 + speed, posWidth, posLength, 5); 
    
    rect(posX, posY - 100 + speed, posWidth, posLength, 5); 
    
    rect(posX, posY + speed, posWidth, posLength, 5); 
 
  }
  
  public void update() {
    speed ++;
    if(posY + speed > 350) {
      speed = 0;
      boxes = false;
    }
    
  }
}
