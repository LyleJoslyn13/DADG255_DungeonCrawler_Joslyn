class Shockwave {
 
  ArrayList<Enemy> enemiesCopy = new ArrayList();
  
  float x, y;
  float radius = 10;
  boolean isDead = false;
  //float lifeTime;
  float alpha = 255;
  
  Shockwave(float x, float y) {
    this.x = x;
    this.y = y;
    enemiesCopy = scenePlay.enemies;
  }
  
  void update() {
    alpha -= 255 * dt;
    
    radius += 300 * dt;
    
    if(alpha <= 0) isDead = true;
    
    for(int i = 0; i< enemiesCopy.size(); i++) {
     Enemy e = enemiesCopy.get(i);
     e.update();
     
     if(checkCollision(this, e)){
       e.isDead = true;
     }
    }
    
     
  }
  
  void draw() {
    noFill();
    stroke(255, 0, 0, alpha);
    strokeWeight(3);
    ellipse(x,y, radius*2, radius*2);
    noStroke();
  }
  
}
