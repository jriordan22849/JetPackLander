package ie.dit;

import processing.core.PApplet;



//Platform for user to aim for.
@SuppressWarnings("serial")

class Platform extends p_sketch{
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
 rect(PlatformX, PlatformY, PlatformWidth, height,5); 
 System.out.println(PlatformX);
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

