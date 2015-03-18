class Platform {
  int PlatformX; 
  int PlatformY;
  int PlatformWidth;

  Platform(int PlatformX, int PlatformY, int PlatformWidth) {
    this.PlatformX = PlatformX;
    this.PlatformY = PlatformY;
    this.PlatformWidth = PlatformWidth;
  } 
 
  void display() {
    fill(255);
    stroke(255);
    rect(PlatformX, PlatformY, PlatformWidth, 100); 
  } 
}
