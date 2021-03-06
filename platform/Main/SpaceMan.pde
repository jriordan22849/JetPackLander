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

  void update()
  {
    keyPressed(); 
  }

  void display()
  {
      fill(0);
      stroke(255);
      ellipse(pos.x+30 ,pos.y+30, 20 ,20);    //head
      rect(pos.x+20    ,pos.y+40, 20 ,25,5);  //body
      strokeWeight(9);
      stroke(0);
      line(pos.x+25,pos.y+60,pos.x+23,pos.y+80); //left leg
      line(pos.x+30,pos.y+60,pos.x+40,pos.y+80); //right leg
      strokeWeight(1);
      stroke(255);
      
      rect(pos.x+18,pos.y+80,15,9,4);            //left foot
      rect(pos.x+35,pos.y+80,15,9,4);            //right foot
      ellipse(pos.x+15,pos.y+40,10,10);           //jet pack top
      rect(pos.x+10,pos.y+40,10,22);              //jet pack
      
      rect(pos.x+10,pos.y+25,40,2);               //hat rim
      rect(pos.x+20,pos.y+15,20,10);              //hat top
      
      
  }
  void keyReleased() 
  {
    if (boost > 0)  {
      ++boost;
    } 
  }
  void keyPressed()
  {

      if(keyPressed == false)
      {
        if(pos.y <410)
        {
          boost = 0;
          if(pos.y != 410)
          {
            pos.y=pos.y + 3;
            pos.x=pos.x + 3;
            controls = false;
          }
        }
      }
    if(controls == true) 
    {
      if(keyPressed == true)
      {
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

