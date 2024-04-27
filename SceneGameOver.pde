// this class defines a "Game Over" scene
class SceneGameOver {
  SceneGameOver(){
    
  }
  
  void update(){
    if(Keyboard.onDown(Keyboard.SPACE)) {
      switchToPlay();
      GameOver.pause();
    }
  }
  
  void draw(){
    background(#972020);
    textAlign(CENTER, CENTER);
    fill(#FFFFFF);
    textSize(100);
    text("GAME OVER", width/2, 200);
    textSize(25);
    text("SPACE BAR to Try Again", width/2 + 20, height/2 + 20);
  }
  

}
