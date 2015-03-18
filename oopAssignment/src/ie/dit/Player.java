package ie.dit;

import processing.core.*; 
//import processing.data.*; 
//import processing.event.*; 
//import processing.opengl.*; 
//
//import java.util.HashMap; 
//import java.util.ArrayList; 
//import java.io.File; 
//import java.io.BufferedReader; 
//import java.io.PrintWriter; 
//import java.io.InputStream; 
//import java.io.OutputStream; 
//import java.io.IOException; 

public class Player extends PApplet{

	  PVector pos;
	  float speed;
	  
	  public Player()
	  {
	    pos = new PVector(100, 400);
	    speed = 4;
	    
	  }  

	  public void update()
	  {
	    keyPressed(); 
	  }

	  public void display()
	  { 
	      
	      //fill(0);
	      rect(pos.x+10,pos.y+20,40,2);
	      ellipse(pos.x+30 ,pos.y+30, 20 ,20);    //head
	      rect(pos.x+20    ,pos.y+40, 20 ,40,5);  //body
	      strokeWeight(9);
	      stroke(0);
	      line(pos.x+25,pos.y+60,pos.x+23,pos.y+100); //left leg
	      line(pos.x+30,pos.y+60,pos.x+40,pos.y+100); //right leg
	      strokeWeight(1);
	      stroke(255);
	      
	      rect(pos.x+18,pos.y+100,15,10,4);             //left foot
	      rect(pos.x+35,pos.y+100,15,10,4);             //right foot
	      
	      ellipse(pos.x+15,pos.y+50,10,10);           //jet pack top
	      rect(pos.x+10,pos.y+50,10,22);              //jet pack
	      
	      rect(pos.x+10,pos.y+20,40,2);               //hat rim
	      rect(pos.x+20,pos.y+5,20,15);               //hat top
	      
	      
	  }

	  public void keyPressed()
	  {
	    
	    if(keyPressed == true)
	    {
	      if ( (keyCode == RIGHT) )
	      {
	        if( pos.x +speed +60> width)
	        {
	          pos.x = pos.x;
	         // speed = speed;
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
	         // speed = speed;
	        }
	        else
	        {
	          
	          pos.x -= speed;
	        }
	      } 
	    }
	  }

}
