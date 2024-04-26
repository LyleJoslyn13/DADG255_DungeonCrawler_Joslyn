class Player extends AABB {
 
  int level = 1;
  
  float burstCD = .35;
  float gunCD = .1;
  int numBursts = 3;
  boolean isBursting;
  boolean isLighting;
  boolean isShooting;
  
  Player(float xPos, float yPos){ 
   x = xPos;
   y = yPos;
   setSize(75, 75);
  }
  
  void update() {
    
    calcAngleToMouse();
    
    if(Keyboard.isDown(Keyboard.LEFT)){ 
      velocity.x = -250;
    }
    if(Keyboard.isDown(Keyboard.RIGHT)){ 
      velocity.x = 250;
    }
    if(Keyboard.isDown(Keyboard.UP)){ 
      velocity.y = -250;
    }
    if(Keyboard.isDown(Keyboard.DOWN)){ 
      velocity.y = 250;
    }
    if(Keyboard.onDown(Keyboard.Q)) {
      isBursting = true;
    }
    if(Mouse.isDown(Mouse.LEFT)) {
      isLighting = true;
    }
      else isLighting = false;
     
    if(Mouse.isDown(Mouse.RIGHT)) {
      isShooting = true;
    }
      else isShooting = false;
    
    
    
    spawnRocketBurst();
    spawnFlames();
    spawnMachineGun();
    
    x += velocity.x * dt;
    y += velocity.y * dt;
    
    velocity.x *= 0.95;
    velocity.y *= 0.95;
    
    super.update();
  }
  
  void draw() {
    fill(#FF2483);
    pushMatrix();
    translate(x, y);
    rotate(angle);
    rect(-halfW, -halfH, w, h); 
    popMatrix();
  }
  
  void spawnRocketBurst() {
   if(isBursting) {
    burstCD -= dt;
    if(burstCD <= 0 ) {
     numBursts--;
     if(numBursts > 0) {
       //SPAWN
       for (int i = 0; i< 4; i++) {
        Rocket r = new Rocket(x, y, angle);
        scenePlay.rockets.add(r);
        }
       burstCD = 0.35;
       } else {
       numBursts = 3;
       isBursting = false;
      }
     }
    }
   }
   
   void spawnFlames(){
     if(isLighting){
      Flamethrower f1 = new Flamethrower(x, y, angle);
       scenePlay.flamethrowers.add(f1);
      Flamethrower f2 = new Flamethrower(x, y, angle + .1);
       scenePlay.flamethrowers.add(f2);
      Flamethrower f3 = new Flamethrower(x, y, angle - .1);
       scenePlay.flamethrowers.add(f3);
    }
    
  }
  
  void spawnMachineGun(){
     if(isShooting){
       gunCD -= dt;
        if(gunCD <= 0) {
          Bullet b = new Bullet(x, y, angle);
           scenePlay.bullets.add(b);
          gunCD = .1;
        }
     }
  }
  
 @Override void applyFix(PVector fix) {
    x += fix.x;
    y += fix.y;
    if (fix.x != 0) {
      // If we move the player left or right, the player must have hit a wall, so we set horizontal velocity to zero.
      velocity.x = 0;
    }
    if (fix.y != 0) {
      // If we move the player up or down, the player must have hit a floor or ceiling, so we set vertical velocity to zero.
      velocity.y = 0;
      if (fix.y < 0) {
        // If we move the player up, we must have hit a floor.
        
        // isGrounded = true;
      }
      if (fix.y > 0) {
        // If we move the player down, we must have hit our head on a ceiling.
      }
    }
    // recalculate AABB (since we moved the object AND we might have other collisions to fix yet this frame):
    calcAABB();
  }
  
}
