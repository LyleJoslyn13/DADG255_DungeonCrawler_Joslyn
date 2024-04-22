// this class defines a "Title" scene
class SceneTitle {
  SceneTitle() {
  }
  
  void update() {
    if(Keyboard.onDown(Keyboard.SPACE)) {
      switchToPlay();
      
    }
  }
  
  void draw() {
    background(0);
    fill(255);
    textSize(35);
    textAlign(CENTER, CENTER);
    text("DADG 255", width/2, height/2-60);
    textSize(25);
    text("Endless Runner Game", width/2, height/2 - 30);
    text("Created by: Lyle Joslyn", width/2, height/2);
    textSize(20);
    text("Press SPACE BAR to play!", width/2, height/2+90);
    fill(#ff2C2C);
    text("WARNING: Loud Sound Effects", width/2, height-100);
  }
  
  //void mousePressed() {
    
  //}
}
