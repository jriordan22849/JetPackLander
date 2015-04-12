package assignmentoop;
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
public class StartScreen
{
	  PApplet parent;
	  StartScreen(PApplet p) {
		 parent = p;
	  }
	  int posX = 50;
	  int posY = 0;
	  int posWidth = 50;
	  int posLength = 300;
	  int speed = 0;
	  int vSpeed = 0;
	  
	  public void display() {
	    parent.image(Main.title, (parent.width / 2)   - 70, posY - 300 + speed);
	    parent.textSize(40);
	    // First box - Play button display
	    parent.fill(0xffADADAD);
	    parent.stroke(0xffFF0808);
	    parent.rect(posX , posY - 200 + speed, posLength, posWidth, 5); 
	    
	    parent.fill(255);
	    parent.text("Play", (parent.width / 2) - 40 , posY + speed - 160);
	    
	    // second box on main menu - leaderboard 
	    parent.fill(0xffADADAD);
	    parent.rect(posX , posY - 100 + speed, posLength, posWidth, 5); 
	    
	    parent.fill(255);
	    parent.text("Leaderboard", (parent.width / 2) - 120 , posY + speed - 60);
	    
	    // third box on main menu - information 
	    parent.fill(0xffADADAD);
	    parent.rect(posX , posY + speed, posLength, posWidth, 5);
	    
	    parent.fill(255);
	    parent.text("Information", (parent.width / 2) - 120 , posY + speed + 40);
	    
	    // First box on main menu - high lighted
	    if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY - 200) && (parent.mouseY <= posY - 200 + posWidth) ) {
	      parent.fill(0);
	      parent.text("Play", (parent.width / 2) - 40 , posY + speed - 160);
	    }
	    
	    // second box on main menu - highlighted
	    if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY - 100) && (parent.mouseY <= posY - 100 + posWidth) ) {
	      parent.fill(0);
	      parent.text("Leaderboard", (parent.width / 2) - 120 , posY + speed - 60);
	    }
	    
	    // third box on main mneu - highlighted
	    if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY) && (parent.mouseY <= posY + posWidth) ) {
	      parent.fill(0);
	      parent.text("Information", (parent.width / 2) - 120 , posY + speed + 40);
	    }
	  }
	  
	  public void update() {
	    if(Main.speedVar == true) {
	      speed += 4;
	    }
	    if(posY + speed > 350) {
	      speed = 0;
	      posY = 350;
	      Main.speedVar = false;
	    }  
	    if(Main.pButton == true) {
	      speed -= 4;
	      Main.controls = true;
	      if(posY + speed <= - 50) {
	        Main.playButton = true;
	        Main.scoreToDisplay = true;
	      } 
	    }
	    
	    if(Main.lButton == true) {
	      vSpeed -= 4;
	      Main.leaderboardButton = true;
	      if(posX + posLength + vSpeed <= -50) {
	        Main.leaderboardButton = true;
	        vSpeed = 0;
	      } 
	    }
	    
	    if(Main.iButton == true) {
	      Main.informationScreen = true;
	      vSpeed += 4;
	      if(posX <= - parent.width + 50) {
	        Main.informationScreen = true;
	        vSpeed = 0;
	      } 
	    }
	     
	    if(Main.lButton == false && Main.iButton == false && Main.leaderboardButton == false && Main.startScreen == true) {
	       vSpeed = 0; 
	    }
	    if(parent.mousePressed) {
	      if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY - 200) && (parent.mouseY <= posY - 200 + posWidth) ) {
	        Main.pButton = true;
	      }
	      if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY - 100) && (parent.mouseY <= posY - 100 + posWidth) ) {
	        Main.lButton = true;
	      }
	      if( (parent.mouseX >= posX) && (parent.mouseX <= posX + posLength) && (parent.mouseY >= posY) && (parent.mouseY <= posY + posWidth) ) {
	        Main.iButton = true;
	      }
	    }
	  }
	}
