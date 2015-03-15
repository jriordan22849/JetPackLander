package ie.dit;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

@SuppressWarnings("serial")
public class p_sketch extends PApplet {

ArrayList<Platform> plat = new ArrayList<Platform>();

boolean start_screen = true;
boolean playing_screen = false;
boolean boxes = true;

public void setup() {
  size(400, 600);
  background(0);
  
  createPlatform();
}

public void draw() {
  
  if(start_screen == true && boxes == true) {
    background(0);
    start.display();
    start.update(); 
  }
  if(playing_screen == true)
  {
    for(int i = 0; i < plat.size(); i ++) {
       plat.get(i).display(); 
    }
  }
}

public void createPlatform() {
 int num_platform = 1; 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformX = (int)random(200, 600);
   int PlatformY = height - 150;
   int PlatformWidth = (int)random(30,121);
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
 }
 
}
class Platform {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;

  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
 
  public void display() {
    fill(255);
    stroke(255);
    rect(PlatformX, PlatformY, PlatformWidth, 100); 
  } 
}
Start_Screen start = new Start_Screen();
class Start_Screen
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "p_sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
