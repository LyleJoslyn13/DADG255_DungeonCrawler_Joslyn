class Enemy extends AABB {
 
  int enemyType = 1;
  
  float radius = 15;
  
  float accelAngle;
  float accX, accY;
  float dis;
  
  float friction = .95;
  
  float gunCD = 1;
  
  boolean isSplit = false;
  
  int currentState;
 
  final int FAR_AWAY = 0;
  final int SHOOTING = 1;
  final int RUNNING_AWAY = 2;
  
  Enemy(float x, float y) {
   //int rand = (int)random(0,2);
   //enemyType = rand;
    
   this.x = x;
   this.y = y;
   accX = 500;
   accY = 500;
   setSize(30, 30);
   
   if(enemyType == 1) {
    velocity.x = random(-150, 150);
    velocity.y = random(-150, 150); 
   }
  }
  
  void update() {
   
    storeAngleToPlayer();
    
    if(enemyType == 0) {
      if(dis > 300) currentState = FAR_AWAY;
      if(dis <= 300 && dis > 100) currentState = SHOOTING;
      if(dis <= 100) currentState = RUNNING_AWAY;
      
      switch(currentState) {
           case FAR_AWAY:
           velocity.x += accX * cos(accelAngle) * dt;
           velocity.y += accY * sin(accelAngle) * dt;
           //println("closer");
           gunCD = 1;
           break;
           case SHOOTING:
           gunCD -= dt;
           velocity.x *= friction;
           velocity.y *= friction;
           //println("shooting");
           if(gunCD <= 0){
            EnemyBullet eb = new EnemyBullet(x, y, accelAngle);
             scenePlay.enemybullets.add(eb); 
             gunCD = 1;
           }
           break;
           case RUNNING_AWAY:
           velocity.x += accX * cos(accelAngle * -1) * dt;
           velocity.y += accY * sin(accelAngle * -1) * dt;
           //println("running");
           break;
           default:
           // do something else
           break;
      }
    }
    
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
    dis = sqrt(dx * dx + dy * dy); 

  }
  
}
