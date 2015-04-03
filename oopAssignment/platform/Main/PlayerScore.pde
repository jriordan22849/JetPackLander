
PlayerScore pscore = new PlayerScore();
class PlayerScore {

  int textsize = 40;
  int textY = 100;
  
  void display() {
    // Displays the score and lives of the player in the top left hand corner of the screen
    fill(255);
    // Displays Score in the center
    fill(150);
//  rect( (width / 2) - textsize - 5, textY - 40, 100, 50, 5);
    fill(255);
    textSize(40);
    text(PScore, (width / 2) - textsize / 2, textY);

  }
}
