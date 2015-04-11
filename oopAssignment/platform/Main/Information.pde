Information info = new Information();
class Information {
  int xpos = -1;
  int ypos = 0; 
  
  int Px = (400 / 2) - 25;
  int Py = 500;
  
  int imageWL = 50;
  
  Information() {
  }
  
  void display() {
     image(infoScreen, xpos, ypos);
     
     // display return button
     image(img, Px, Py);
   } 
   
   void update() {
     if(mousePressed) {
        if( (mouseX >= (width / 2) - 25) && (mouseX <= (width / 2) - 25 + imageWL) && (mouseY >= Py) && (mouseY <= Py + imageWL) ) {
          iButton = false;
          informationScreen = false;
          startScreen = true;
        }
     }
   }
}
