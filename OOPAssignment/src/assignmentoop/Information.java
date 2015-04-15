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
public class Information {
	  PApplet parent;
	  
	  Information(PApplet p) {
		  parent = p;
	  }
	  int xpos = -1;
	  int ypos = 0; 
	  
	  int Px = (400 / 2) - 25;
	  int Py = 500;
	  
	  int imageWL = 50;
	  
	  Information() {
	  }
	  
	  public void display() {
	     parent.image(Main.infoScreen, xpos, ypos);
	     
	     // display return button
	     parent.image(Main.img, Px, Py);
	   } 
	   
	   public void update() {
	     if(parent.mousePressed) {
	        if( (parent.mouseX >= (parent.width / 2) - 25) && (parent.mouseX <= (parent.width / 2) - 25 + imageWL) && (parent.mouseY >= Py) && (parent.mouseY <= Py + imageWL) ) {
	          Main.iButton = false;
	          Main.informationScreen = false;
	          Main.startScreen = true;
	        }
	     }
	   }
	}