package assignmentoop;

import processing.core.PVector;
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

public class SpaceMan
{
    PApplet parent;
    SpaceMan() {
        
    }
    PVector pos;
    float speed;
    float boost;
    
    SpaceMan(PApplet p)
    {
        parent = p;
        pos = new PVector(0, 410);
        speed = 4;
        
    }
    
    public void update()
    {
        keyPressed();
    }
    
    public void display()
    {
        parent.fill(0);
        parent.stroke(0);
        parent.ellipse(pos.x+30 ,pos.y+30, 20 ,20);    //head
        parent.rect(pos.x+20    ,pos.y+40, 20 ,25,5);  //body
        parent.strokeWeight(9);
        parent.stroke(0);
        parent.line(pos.x+25,pos.y+60,pos.x+23,pos.y+80); //left leg
        parent.line(pos.x+30,pos.y+60,pos.x+40,pos.y+80); //right leg
        parent.strokeWeight(1);
        parent.stroke(255);
        
        parent.rect(pos.x+18,pos.y+80,15,10,4);             //left foot
        parent.rect(pos.x+35,pos.y+80,15,10,4);             //right foot
        parent.ellipse(pos.x+15,pos.y+40,10,10);           //jet pack top
        parent.rect(pos.x+10,pos.y+40,10,22);              //jet pack
        
        parent.rect(pos.x+10,pos.y+25,40,2);               //hat rim
        parent.rect(pos.x+20,pos.y+15,20,10);               //hat top
        
        
    }
    public void keyReleased()
    {
        if (boost > 0)  {
            ++boost;
        }
    }
    public void keyPressed()
    {
        
        if(parent.keyPressed == false)
        {
            if(pos.y <410)
            {
                boost = 0;
                if(pos.y != 410)
                {
                    pos.y=pos.y + 3;
                    pos.x=pos.x + 3;
                    Main.controls = false;
                }
            }
        }
        if(Main.controls == true)
        {
            if(parent.keyPressed == true)
            {
                if ( (parent.keyCode == parent.UP) )
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