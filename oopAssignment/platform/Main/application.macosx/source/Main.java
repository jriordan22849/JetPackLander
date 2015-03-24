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

public class Main extends PApplet {

ArrayList<Platform> plat = new ArrayList<Platform>();
ArrayList<Platform> newPlat = new ArrayList<Platform>(100);

boolean controls = true;
boolean start_screen = false;
boolean playing_screen = true;
boolean boxes = true;
boolean bPlatform = true;
boolean onPlatform = false;
boolean playerOn = false;
boolean new_platform = false;
boolean startWidth = true;

int PScore = 0;

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
       background(200);
       spaceMan.update();
       spaceMan.display();
       
       plat.get(i).display(); 
       if(bPlatform == true) {
         plat.get(i).beginingPlatform();
       }
       plat.get(i).PlayerHitDetection();
    }
    
//    if(new_platform = true) {
//    for(int i = 0; i < new_plat.size(); i ++) {
//       new_plat.get(i).display(); 
//       new_plat.get(i).playerhitdetection2();
//    }
//    }
    
    pscore.display();
  }
  
}

public void createPlatform() {
 
 int num_platform = 1; 
 int space = 0;
 int bPlatformWidth;
 
 for(int i = 0; i < num_platform; i ++) { 
   int PlatformWidth = (int)random(30, 120);
   if(startWidth == true) {
     bPlatformWidth = 30; 
   }
   else {
     bPlatformWidth = PlatformWidth;
   }
   int PlatformX = (int)random(200, width - PlatformWidth);
   int PlatformY = height - 100;
   plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));
   newPlat.add(new Platform(bPlatformWidth));
   startWidth = false;
 }
 

 
}

//void create_new_platform() {
//   int num_platform = 100; 
//    for(int i = 0; i < num_platform; i ++) { 
//   int PlatformWidth = (int)random(30, 120);
//   int PlatformX = width + 50;
//   int PlatformY = height -100;
//   new_plat.add(new Platform(PlatformX, PlatformY, PlatformWidth));  
//  }
//}

class Platform extends SpaceMan {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;
  
  int PlatformWidth1;
  int PlatformX1;
  int PlatformY1;
  int beginPlatformWidth;
  int bPlatformWidth;
  
  // begining Platform
  int beginPlatform = 20;
  
  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
  
  Platform(int bPlatformWidth) {
    this.bPlatformWidth = bPlatformWidth;
  } 
 
 
  public void display() {
    fill(255);
    stroke(255);
    rect(PlatformX, PlatformY, PlatformWidth, 100, 5); 
  } 
  
  public void beginingPlatform() {
      
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
      rect(beginPlatform, PlatformY, beginPlatformWidth, height - 150, 5);
      println(beginPlatformWidth);
  }
  
  public void PlayerHitDetection() {
    for(int i = 0; i < plat.size(); i ++) {
    if((spaceMan.pos.x+50 >= plat.get(i).PlatformX) && (spaceMan.pos.x+15 < plat.get(i).PlatformX + plat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= plat.get(i).PlatformY))
    { 
      if(spaceMan.pos.x + 30 <= plat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
        playerOn = true;
        controls = false;
        onPlatform = false; 
      }              
    }
    
    if(playerOn == true) {
      beginPlatform--;
      plat.get(i).PlatformX--;
      spaceMan.pos.x--;
            
      if(plat.get(i).PlatformX <= 20) {
          createPlatform();
          startWidth = false;
          beginPlatform = 20;
          controls = true; 
          playerOn = false;
          plat.remove(i);
      }
    } 
  }
  }
  
  public void playerhitdetection2()  {
    for(int i = 0; i < newPlat.size(); i ++) {
    if((spaceMan.pos.x+50 >= newPlat.get(i).PlatformX) && (spaceMan.pos.x+15 < newPlat.get(i).PlatformX + newPlat.get(i).PlatformWidth)
    && (spaceMan.pos.y+100 >= newPlat.get(i).PlatformY))
    {
      if(spaceMan.pos.x + 30 <= newPlat.get(i).PlatformX + (3 * PlatformWidth / 5)) {
        spaceMan.pos.x ++; 
      }              
    }
    }
  }
}
PlayerScore pscore = new PlayerScore();
class PlayerScore {
  int textsize = 40;
  int textY = 100;
  
  public void display() {
    // Displays the score and lives of the player in the top left hand corner of the screen
    fill(255);
    // Displays Score in the center
    textSize(40);
    text(PScore, (width / 2) - textsize / 2, textY);
  }
}
SpaceMan spaceMan = new SpaceMan();
class SpaceMan
{
  PVector pos;
  float speed;
  float boost;
  
  SpaceMan()
  {
    pos = new PVector(0, 410);
    speed = 4;
    
  }  

  public void update()
  {
    keyPressed(); 
  }

  public void display()
  {
      fill(0);
      
      ellipse(pos.x+30 ,pos.y+30, 20 ,20);    //head
      rect(pos.x+20    ,pos.y+40, 20 ,25,5);  //body
      strokeWeight(9);
      stroke(0);
      line(pos.x+25,pos.y+60,pos.x+23,pos.y+80); //left leg
      line(pos.x+30,pos.y+60,pos.x+40,pos.y+80); //right leg
      strokeWeight(1);
      stroke(255);
      
      rect(pos.x+18,pos.y+80,15,10,4);             //left foot
      rect(pos.x+35,pos.y+80,15,10,4);             //right foot
      ellipse(pos.x+15,pos.y+40,10,10);           //jet pack top
      rect(pos.x+10,pos.y+40,10,22);              //jet pack
      
      rect(pos.x+10,pos.y+25,40,2);               //hat rim
      rect(pos.x+20,pos.y+15,20,10);               //hat top
      
      
  }
  public void keyReleased() 
        {
            if (boost > 0) 
            {
                ++boost;
            } 
        }
  public void keyPressed()
  {

      if(keyPressed == false)
      {
        if(pos.y <410)
        {
          boost = 0;
          if(pos.y != 410)
          {
            pos.y=pos.y +2;
            pos.x=pos.x +2;
          }
        }
      }
    if(controls == true) 
    {
      if(keyPressed == true)
      {
        if ( (keyCode == RIGHT) )
        {
          if( pos.x +speed +60> width)
          {
            pos.x = pos.x;
            speed = speed;
          }
          else
          {
            pos.x += speed;
          }
        }
      
        if ( (keyCode == LEFT) )
        {
          if( pos.x - speed < 0)
          {
            pos.x = pos.x;
            speed = speed;
          }
          else
          {
            pos.x -= speed;
          }
        } 
        if ( (keyCode==UP) )
        {
            if (pos.y +boost < 30)
            {
              pos.y = pos.y;
              boost = boost;
            }
            else 
            {
              boost=boost+4;
            }
            pos.y -= boost;
            boost = 0;
        } 
      } 
    } 
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
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
