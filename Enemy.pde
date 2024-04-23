class Enemy extends AABB {
 
  float radius = 15;
  
  Enemy(float x, float y) {
   this.x = x;
   this.y = y;
   setSize(30, 30);
  }
  
  void update() {
   
    
    super.update();
  }
  
  void draw() {
    fill(255, 0, 0);
    rect(x - halfW, y - halfH, w, h);
  }
}
