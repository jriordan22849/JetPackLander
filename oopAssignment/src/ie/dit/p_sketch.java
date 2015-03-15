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

@SuppressWarnings("unused")
public class p_sketch extends PApplet {

ArrayList<Platform> plat = new ArrayList<Platform>();

public void setup() {
  size(400, 600);
  background(0);
  
  createPlatform();
}

public void draw() {
  for(int i = 0; i < plat.size(); i ++) {
     plat.get(i).display(); 
  }
  
}

public void createPlatform() {
 int num_platform = 1; 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformWidth = (int)random(30,121);
   int PlatformX = (int)random(150, (height - PlatformWidth));
   int PlatformY = height - 150;
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
    rect(PlatformX, PlatformY, PlatformWidth, height); 
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
