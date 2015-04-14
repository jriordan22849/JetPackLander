Background bGround = new Background();

class Background {
  
  int starX;
  int starY;
  int starWL;
  int backgroundNumber = (int)random(0,4);
  
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
    boolean starGrow = true;
    fill(255);
    stroke(255);
    for(int i = 0; i < stars.size(); i ++) {
       ellipse(stars.get(i).starX, stars.get(i).starY, stars.get(i).starWL, stars.get(i).starWL);       
    }
  }
  
  
  // display different background despending on the background number.
  void display1() {
      background(#7C7A7A);
      
      if(backgroundNumber == 0) {
        // draw moon
        fill(#E3E3E3);
        stroke(#747474);
        strokeWeight(10);
        ellipse(width / 2, height / 3, wl, wl);
        strokeWeight(1);
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
        background(#7E7E7E);
        image(tree, -40, 0);
      }
      
      if(backgroundNumber == 3){
        //Buildings
        int buildX1=40;
        int buildX2=80;
        background(#7E7E7E);
        //Background building
        
        fill(#363535);
        stroke(0);
        rect(10,100,4*width/5,height);
        fill(0);
        stroke(0);
        rect(20,130,width/8,height/12);
        rect(80,130,width/8,height/12);
        rect(140,130,width/8,height/12);
        rect(200,130,width/8,height/12);
        rect(260,130,width/8,height/12);
        
        rect(20,190,width/8,height/12);
        rect(20,250,width/8,height/12);
        rect(20,310,width/8,height/12);
        rect(20,370,width/8,height/12);
        rect(20,430,width/8,height/12);
        rect(20,490,width/8,height/12);
        rect(20,550,width/8,height/12);
        
        rect(260,190,width/8,height/12);
        rect(260,250,width/8,height/12);
        rect(260,310,width/8,height/12);
        rect(260,370,width/8,height/12);
        rect(260,430,width/8,height/12);
        rect(260,490,width/8,height/12);
        rect(260,550,width/8,height/12);
        
        
        //Middleground building
        
        fill(#504E4E);
        stroke(0);
        rect(80,150,width/2,height);
        fill(0);
        stroke(0);
        rect(100,190,width/8,height/12);
        rect(155,190,width/8,height/12);
        rect(210,190,width/8,height/12);
        rect(100,250,width/8,height/12);
        rect(155,250,width/8,height/12);
        rect(210,250,width/8,height/12);
        rect(100,310,width/8,height/12);
        rect(155,310,width/8,height/12);
        rect(210,310,width/8,height/12);
        rect(100,370,width/8,height/12);
        rect(155,370,width/8,height/12);
        rect(210,370,width/8,height/12);
        rect(100,430,width/8,height/12);
        rect(155,430,width/8,height/12);
        rect(210,430,width/8,height/12);
        rect(100,490,width/8,height/12);
        rect(155,490,width/8,height/12);
        rect(210,490,width/8,height/12);
        rect(100,550,width/8,height/12);
        rect(155,550,width/8,height/12);
        rect(210,550,width/8,height/12);
        
        //forground building
        fill(#5F5E5E);
        stroke(0);
        rect(buildX1,250,width/3,height);
        fill(0);
        stroke(0);
        rect(50,290,width/8,height/12);
        rect(110,290,width/8,height/12);
        rect(50,350,width/8,height/12);
        rect(110,350,width/8,height/12);
        rect(50,410,width/8,height/12);
        rect(110,410,width/8,height/12);
        rect(50,470,width/8,height/12);
        rect(110,470,width/8,height/12);
        rect(50,530,width/8,height/12);
        rect(110,530,width/8,height/12);
        
         //forground building
        fill(#5F5E5E);
        stroke(0);
        rect(260,250,width/3,height);
        fill(0);
        stroke(0);
        rect(270,290,width/8,height/12);
        rect(330,290,width/8,height/12);
        rect(270,350,width/8,height/12);
        rect(330,350,width/8,height/12);
        rect(270,410,width/8,height/12);
        rect(330,410,width/8,height/12);
        rect(270,470,width/8,height/12);
        rect(330,470,width/8,height/12);
        rect(270,530,width/8,height/12);
        rect(330,530,width/8,height/12);
      }
        
  }
}
