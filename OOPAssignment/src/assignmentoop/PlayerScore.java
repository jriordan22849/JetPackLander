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
public class PlayerScore {
	  PApplet parent;
	  PlayerScore(PApplet p) {
		  parent = p;
	  }
	  int textsize = 40;
	  int textX = (400 / 2) - textsize / 2; // 180
	  int textY = 600 / 6; // 100
	  
	  public void display() {
	    
	    parent.fill(0xff5F5F5F);
	    parent.stroke(0xff5F5F5F);
	    parent.rect(textX - 10, textY + 5, textsize + 10, -40, 5);
	    // score   
	    parent.fill(255);
	    parent.textSize(40);
	    if(Main.PScore >= 10 && Main.PScore < 100) {
	       parent.textSize(30); 
	       parent.text(Main.PScore, textX - 5, textY);
	    }
	    if(Main.PScore >= 100) {
	       parent.textSize(25); 
	       parent.text(Main.PScore, textX - 10, textY);
	    }
	    if(Main.PScore < 10) {
	      parent.text(Main.PScore, textX + 2, textY);
	    }
	  }
	}
