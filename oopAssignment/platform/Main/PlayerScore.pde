
PlayerScore pscore = new PlayerScore();
class PlayerScore {

  int textsize = 40;
  int textX = (400 / 2) - textsize / 2; // 180
  int textY = 600 / 6; // 100
  
  void display() {
    
    fill(#5F5F5F);
    stroke(#5F5F5F);
    rect(textX - 10, textY + 5, textsize + 10, -40, 5);
    // score   
    fill(255);
    textSize(40);
    if(PScore >= 10 && PScore < 100) {
       textSize(30); 
       text(PScore, textX - 5, textY);
    }
    if(PScore >= 100) {
       textSize(25); 
       text(PScore, textX - 10, textY);
    }
    if(PScore < 10) {
      text(PScore, textX + 2, textY);
    }


  }
}
