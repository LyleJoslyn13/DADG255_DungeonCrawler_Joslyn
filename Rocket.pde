class Rocket extends AABB {
 
  float accelAngle;
  float accX, accY;
  
  float timeToHome = .75;
  float lifeTime = 1;
  boolean isHoming = false;
  
  Rocket(float xPos, float yPos, float angle) {
    this.angle = angle;
    x = xPos;
    y = yPos;
    velocity.x = random(1) < 0.5 ? 250 * cos(angle - PI/2) : 250 * cos(angle + PI/2);  
    velocity.y = random(1) < 0.5 ? 250 * cos(angle - PI/2) : 250 * cos(angle + PI/2); 
    accX = 1500;
    accY = 1500;
    storeAngleToMouse();
    //accelAngle = angle;
  }
  
  void update() {
    
    lifeTime -= dt;
    
    if(isHoming) {                                      //TRACKING CODE
      storeAngleToMouse();
      velocity.x += accX * cos(accelAngle) * dt;
      velocity.y += accY * sin(accelAngle) * dt;
      
      x += velocity.x * dt;
      y += velocity.y * dt;
    }
    else {
      timeToHome -= dt;
     x += velocity.x * cos(angle) * dt; 
     y += velocity.y * sin(angle) * dt; 
     
     velocity.x *= 0.98;
     velocity.y *= 0.98;
     
     if(timeToHome <= 0) {
      isHoming = true; 
      velocity.x = velocity.y = 0;
     }
    }
    
    if(lifeTime <= 0) isDead = true;
    
  }
  
  void storeAngleToMouse() {
    float dx = camera.x + mouseX - x;
    float dy = camera.y + mouseY - y;
    accelAngle = atan2(dy, dx); 
  }
  
  void draw() {
    fill(#FFC634);
    ellipse(x, y, 10, 10);
  }
  
}
