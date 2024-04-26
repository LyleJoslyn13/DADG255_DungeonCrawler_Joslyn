class Bullet extends AABB {
  
  float radius = 8;
  float accelAngle;
  float accX = 350, accY = 350;
  float lifeTime = .75;
  
  Bullet(float xPos, float yPos, float angle){
    this.angle = angle;
    x = xPos;
    y = yPos;
    velocity.x = accX * cos(angle);
    velocity.y = accY * sin(angle);
    storeAngleToMouse();
    setSize(radius*2, radius*2);
  }
  
  void update() {
    velocity.x += cos(accelAngle) * dt;
    velocity.y += sin(accelAngle) * dt;
    
    x += velocity.x * dt; 
    y += velocity.y * dt; 
    
    lifeTime -= dt;
    if(lifeTime <= 0) isDead = true;
    
    super.update();
  }
  
  void draw() {
    fill(#FFD917);
    ellipse(x - halfW, y - halfH, w, h);
  }
  
  void storeAngleToMouse() {
    float dx = scenePlay.camera.x + mouseX - x;
    float dy = scenePlay.camera.y + mouseY - y;
    accelAngle = atan2(dy, dx); 
  }
  
}
