class Flamethrower extends AABB {
  
   PVector acceleration = new PVector();
   float alpha, lifeTime, rotateSpeed, rotateAngle, size;
   float r, g, b;
   boolean isDead = false;
   
   float cone = random(-.5,.5);
 
  Flamethrower(float xPos, float yPos, float angle) { 
    //super();
    x = xPos;
    y = yPos;
    
    lifeTime = 5;
    size = random(3, 6);
    alpha = random(128, 255);
    velocity.x = random(250, 350) * cos(angle + cone);
    velocity.y = random(250, 350) * sin(angle + cone);
    rotateAngle = random(radians(360));
    rotateSpeed = random(radians(30), radians(720));
    r = random(155, 255);
    g = random(0, 125);
    b = random(0, 25); 
  }
  
  void update() {
   
   alpha -= 355 * dt; 
   rotateAngle += rotateSpeed * dt;
   
   x += velocity.x * dt;
   y += velocity.y * dt; 
   
   if(alpha <= 0 || lifeTime <= 0) isDead = true;
    
   super.update();
  }
  
  void draw() { 
    colorMode(RGB);
    fill(r, g, b, alpha);
    
    pushMatrix();
    translate(x, y);
    rotate(rotateAngle);
    rect(-size/2, -size/2, size, size);
    popMatrix();
    
    colorMode(RGB);
  }
  
}
