class Enemy extends AABB {
 
  float radius = 15;
  
  float accelAngle;
  float accX, accY;
  
  Enemy(float x, float y) {
   this.x = x;
   this.y = y;
   accX = 500;
   accY = 500;
   setSize(30, 30);
  }
  
  void update() {
   
    storeAngleToPlayer();
    
    velocity.x += accX * cos(accelAngle) * dt;
    velocity.y += accY * sin(accelAngle) * dt;
      
    x += velocity.x * dt;
    y += velocity.y * dt;
    super.update();
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
  
  void storeAngleToPlayer() {
    float dx = scenePlay.player.x - x;
    float dy = scenePlay.player.y - y;
    accelAngle = (atan2(dy, dx)); 
  }
}
