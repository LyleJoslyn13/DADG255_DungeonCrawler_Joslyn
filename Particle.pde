class Particle{
 
   PVector position = new PVector();
   PVector velocity = new PVector();
   PVector acceleration = new PVector();
   float alpha, lifeTime, rotateSpeed, rotateAngle, angle, size;
   float r, g, b;
   boolean isDead = false;
  
  Particle() {
   
  }
  
  void update() {
    
    
    
    if(alpha <= 0 || lifeTime <= 0) isDead = true;
    if(position.x > width + size || position.x < -size || position.y > height + size || position.y < -size) isDead = true;
  }
  
  void draw() {
    
  }
}
