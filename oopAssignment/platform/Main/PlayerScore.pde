
PlayerScore pscore = new PlayerScore();
class PlayerScore {

  int textsize = 40;
  int textX = (400 / 2) - (textsize / 2); // 180
  int textY = 600 / 6; // 100
  
  void display() {
    // Displays the score and lives of the player in the top left hand corner of the screen
    fill(255);
    // Displays Score in the center
    // needs fixing **************************************************->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    fill(150);
    rect(170, 60, 50,50, 5);
    // ****************************************************************************************************
    fill(255);
    textSize(40);
    if(PScore >= 10) {
       textSize(35); 
    }

    text(PScore, textX, textY);


  }
}
