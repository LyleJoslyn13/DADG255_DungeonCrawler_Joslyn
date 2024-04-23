// this class defines a "Game Over" scene
class ScenePause {
  
  PauseHUD pauseHUD;
  
  ScenePause(){
    
    pauseHUD = new PauseHUD();
  }
  
  void update(){
    
  }
  
  void draw(){
    
    
   
  
  pauseHUD.update();
  pauseHUD.draw();
  
  }
}
