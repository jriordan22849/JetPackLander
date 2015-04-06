Background bGround = new Background();

class Background {
  
  int starX;
  int starY;
  int starWL;
  int backgroundNumber = (int)random(0,3);;
  
  // width and height for circle
  int wl = 300;
  
  // sun variables
  int sunX = 300;
  int sunY = 100;
  int sunWL = 100;
  int numLines = 5;
  int spacing = 0;
  
  
  Background(int starX, int starY, int starWL) {
    this.starX = starX;
    this.starY = starY;
    this.starWL = starWL;
  }
  
  Background() {
  }
  
  // displays stars from the an arraylist which have random x and y co-ordinates
  void drawStars() {
    fill(255);
    stroke(255);
    for(int i = 0; i < stars.size(); i ++) {
       ellipse(stars.get(i).starX, stars.get(i).starY, stars.get(i).starWL, stars.get(i).starWL);
    }
  }
  
  
  // display different background despending on the background number.
  void display1() {
      background(#7C7A7A);
          println("background number " + backgroundNumber);
      if(backgroundNumber == 0) {
        // draw moon
        fill(#E3E3E3);
        stroke(#E3E3E3);
        ellipse(width / 2, height / 3, wl, wl);
      }
      if(backgroundNumber == 1) {
        // draw half moon
        fill(#7C7A7A);
        stroke(#E3E3E3);
        
        fill(#E3E3E3);
        ellipse(width / 2, height / 3, wl, wl);
        
        fill(#7C7A7A);
        stroke(#7C7A7A);
        ellipse(width / 3, height / 3, wl, wl);

      }
      
      if(backgroundNumber == 2) {
        // draw half moon
        background(#47CEFC);
        
        fill(#F9FA44);
        stroke(#F9FA44);
        ellipse(sunX, sunY, sunWL, sunWL);
        
//        for(int i = 0; i < numLines; i ++) {
//        int z = 30;
//        float x1 = sunX + (sunWL / 2) * cos(20);
//        float y1 = sunY + (sunWL / 2) * sin(20);
//        float x2 = x1 + z * cos(20);
//        float y2 = y1 + z *sin(20);
//        line(x1,y1,x2,y2); 
//
//        }
      }
  }
}
