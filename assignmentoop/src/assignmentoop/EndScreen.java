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

public class EndScreen extends SpaceMan
{
	   int Ex = (parent.width / 2 + 80);
	   int Ey = 75;
	   int hScore;
	   
	   // box variables;
	   float posX = 66.6f;
	   float posY = 120; // 600 / 5
	   float posWidth = 133.3f * 2;
	   float posHeight = 250;
	   
	   float imageY = 600 / 1.55f;
	   float imageX1 = 80;
	   float imageX2 = (400 / 2) - 25;
	   int picSize = 50;
	   
	   float scoreX = 400 / 2.666666f;
	   float scoreY = 600 / 3.52f;
	   
	   public void display() {
           Main.controls = false;
           parent.textSize(40);
           parent.fill(255);
           parent.text("GAME OVER!", Ex, Ey);
           
           // display box for player results and best score
           parent.fill(255);
           parent.stroke(0xffA0A0A0);
           parent.strokeWeight(20);
           parent.rect(posX, posY, posWidth, posHeight, 5);
           parent.strokeWeight(1);
           
           parent.textSize(30);
           parent.fill(0);
           
           // player score during the game
           parent.text("SCORE", scoreX, scoreY);
           parent.text(Main.PScore, scoreX + 35, scoreY + 50);
           
           // best score read in from file
           parent.text("BEST SCORE", scoreX - 35, scoreY + 120);
           
           for(int i = 0; i < Main.data.length; i ++) {
               hScore = Main.data[i];
           }
           if(Main.PScore >= 10 || hScore >= 10) {
               parent.textSize(30);
           }
           if(Main.PScore >= hScore) {
               String stringPScore = parent.str(Main.PScore);
               String[] list = parent.split(stringPScore, ' ');
               parent.saveStrings("data.txt", list);
               parent.text(Main.PScore, scoreX + 35, scoreY + 120 + 50);
           }
           else if(hScore > Main.PScore) {
               parent.textSize(30);
               parent.text(hScore, scoreX + 35, scoreY + 120 + 50);
           }
           
           
           // display the play button to user.
           parent.image(Main.img2, imageX2, imageY);
           
           if(parent.mousePressed) {
               
               // play again button if clicked.
               if( (parent.mouseX >= imageX2) && (parent.mouseX <= imageX2 + picSize) && (parent.mouseY >= imageY) && (parent.mouseY <= imageY + picSize) ) {
                   bGround.backgroundNumber = (int)parent.random(0,4);
                   Main.endScreen = false;
                   Main.startScreen = true;
                   Main.controls = true;
                   Main.PScore = 0;
               }
           }
           
       } 
}