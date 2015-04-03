EndScreen end = new EndScreen();
class EndScreen
{
   int Ex = (width / 2 + 80);
   int Ey = 100;
   
   // box variables; 
   float posX = 66.6;
   float posY = 120; // 600 / 5
   float posWidth = 133.3 * 2;
   float posHeight = 250;
   
   void display() {
     controls = false;
     textSize(40);
     fill(255);
     text("GAME OVER!", Ex, Ey);
     
     // display box
     fill(255);
     rect(posX, posY, posWidth, posHeight, 5);
     
   } 
}
