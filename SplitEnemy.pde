class SplitEnemy extends AABB {

  SplitEnemy(float x, float y, float xVelocity, float yVelocity) {
   this.x = x;
   this.y = y;
   this.velocity.x = xVelocity;
   this.velocity.y = yVelocity;
   setSize(30, 30);
  }
  
  void update() {    
    x += velocity.x * dt;
    y += velocity.y * dt;
    
    super.update();
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
  
  
}
