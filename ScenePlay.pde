class ScenePlay {
  
Player player;
Camera camera;
HUD playerHUD;

ArrayList<Enemy> enemies = new ArrayList();
ArrayList<SplitEnemy> splitenemies = new ArrayList();
ArrayList<Wall> walls = new ArrayList();
ArrayList<Rocket> rockets = new ArrayList();
ArrayList<Shockwave> shockwaves = new ArrayList();
ArrayList<Door> doors = new ArrayList();
ArrayList<Room> rooms = new ArrayList();
ArrayList<Flamethrower> flamethrowers = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
ArrayList<EnemyBullet> enemybullets = new ArrayList();

float roomDelay = 0.01;
boolean shouldSpawn = true;
  
  ScenePlay() {
   player = new Player(width/2, height/2); 
   camera = new Camera(player);
   playerHUD = new HUD();
  }
  
  void update() {
        
     // SPAWN ALL OBJECTS UNDER THIS LINE //
     
     roomDelay -= dt;
     if(roomDelay <= 0 && shouldSpawn) {
       Room r = new Room(-camera.x, -camera.y);      //Creates Spawn Room
       rooms.add(r);
       shouldSpawn = false;
     }
     
    //pushMatrix Below
    pushMatrix();
    translate(-camera.x, -camera.y);
     
     
    camera.update();
  
    for(int i = 0; i< walls.size(); i++) {
     Wall w = walls.get(i);
     w.update();
     
     if(w.checkCollision(player)) {
      player.applyFix(player.findOverlapFix(w));           // REQUIRED FOR FIXING OVERLAP 
     }
     
     for(int j = 0; j< enemies.size(); j++) {
          Enemy e = enemies.get(j);
        
        if(w.checkCollision(e)) {
          if(e.enemyType == 0){
            e.applyFix(e.findOverlapFix(w));             // REQUIRED FOR FIXING OVERLAP 
          }
          else if(e.enemyType == 1) {                    // BOUNCE CODE
            if(w.identifier == 1) {
             e.velocity.y *= -1;
            }
            if(w.identifier == 2) {
             e.velocity.y *= -1; 
            }
            if(w.identifier == 3) {
             e.velocity.x *= -1; 
            }
            if(w.identifier == 4) {
             e.velocity.x *= -1; 
            }
            if(w.identifier == 5) {
             e.velocity.y *= -1; 
            }
            if(w.identifier == 6) {
             e.velocity.y *= -1; 
            }
            if(w.identifier == 7) {
             e.velocity.x *= -1; 
            }
            if(w.identifier == 8) {
             e.velocity.x *= -1; 
            }
          }
        }
     }
       
       
       for(int k = 0; k < splitenemies.size(); k++) {
          SplitEnemy se = splitenemies.get(k);
       
       if(w.checkCollision(se)) {
          
                             // BOUNCE CODE
            if(w.identifier == 1) {
             se.velocity.y *= -1;
            }
            if(w.identifier == 2) {
             se.velocity.y *= -1; 
            }
            if(w.identifier == 3) {
             se.velocity.x *= -1; 
            }
            if(w.identifier == 4) {
             se.velocity.x *= -1; 
            }
            if(w.identifier == 5) {
             se.velocity.y *= -1; 
            }
            if(w.identifier == 6) {
             se.velocity.y *= -1; 
            }
            if(w.identifier == 7) {
             se.velocity.x *= -1; 
            }
            if(w.identifier == 8) {
             se.velocity.x *= -1; 
            }
          }
         }
         
       //for(int l = 0; l < bullets.size(); l++) {                        //VARUUN!!!! Can u message me why this doesnt work???
       // Bullet b = bullets.get(l); 
        
       // if(w.checkCollision(b)) {
       //   println("hitWall");
       //  b.isDead = true; 
       // }
       //}
       
       for(int a = 0; a < enemybullets.size(); a++) {
        EnemyBullet eb = enemybullets.get(a); 
        
        if(w.checkCollision(eb)) {
         eb.isDead = true; 
        }
       }
       
     }
   
    
    for(int i = 0; i< rockets.size(); i++) {
     Rocket r = rockets.get(i);
     r.update();
     
     //if(r.checkCollision(w)) {            //
     // r.NumCollisions++;
     // if(r.numCollisions < 3) {
     //  Bullet b1 = new bullet();
     //  b1.numCollisions += r.numCollisions;
     //  bullets.add(b1);
     //  Bullet b2 = new bullet();
     //  b2.numCollisions++;
     //  bullets.add(b2);
     //  r.isDead = true;
     // }
     //}
     
     if(r.isDead) {
      Shockwave s = new Shockwave(r.x, r.y);
      shockwaves.add(s);
      rockets.remove(i);
     }
     
    }
    
    for(int i = 0; i< shockwaves.size(); i++) {
     Shockwave s = shockwaves.get(i);
     s.update();
     
     if(s.isDead) {
      shockwaves.remove(i); 
     }
    }
    
    for(int i = 0; i< enemies.size(); i++) {
     Enemy e = enemies.get(i);
     e.update();
     
     if(e.isDead) enemies.remove(i);
    }
    
    for(int i = 0; i< splitenemies.size(); i++) {
     SplitEnemy se = splitenemies.get(i);
     se.update();
     
     if(se.isDead) splitenemies.remove(i);
    }
    
     for (int i = 0; i < doors.size(); i++) {
      Door d = doors.get(i);
      d.update();
     }
     
      for (int i = 0; i < rooms.size(); i++) {
      Room r = rooms.get(i);
      r.update();
      }
      
     for(int i = 0; i < flamethrowers.size(); i++) {
       Flamethrower f = flamethrowers.get(i);
       f.update();
       
        for(int j = 0; j< enemies.size(); j++) {
          Enemy e = enemies.get(j);
        
         if(f.checkCollision(e)) {
          if(e.enemyType == 0){
           e.isDead = true;
          }
          else if(e.enemyType == 1){
            SplitEnemy se1 = new SplitEnemy(e.x, e.y, e.velocity.x *-1, e.velocity.y);
            splitenemies.add(se1);
            SplitEnemy se2 = new SplitEnemy(e.x, e.y, e.velocity.x, e.velocity.y *-1);
            splitenemies.add(se2);
            e.isDead = true;
          }
         }
        }
        
        for(int k = 0; k< splitenemies.size(); k++) {
          SplitEnemy se = splitenemies.get(k);
          
          if(f.checkCollision(se)) {
            se.isDead = true;
          }
       }
        
     if(f.isDead) flamethrowers.remove(i);
     } 
     
     for(int i = 0; i< bullets.size(); i++) {
     Bullet b = bullets.get(i);
     b.update();
     
       for(int j = 0; j< enemies.size(); j++) {
          Enemy e = enemies.get(j);
        
         if(b.checkCollision(e)) {
          if(e.enemyType == 0){
           e.isDead = true;
          }
          else if(e.enemyType == 1){
            SplitEnemy se1 = new SplitEnemy(e.x, e.y, e.velocity.x *-1, e.velocity.y);
            splitenemies.add(se1);
            SplitEnemy se2 = new SplitEnemy(e.x, e.y, e.velocity.x, e.velocity.y *-1);
            splitenemies.add(se2);
            e.isDead = true;
          }
          b.isDead = true;
         }
         
       }
       for(int k = 0; k< splitenemies.size(); k++) {
          SplitEnemy se = splitenemies.get(k);
          
          if(b.checkCollision(se)) {
            se.isDead = true;
          }
       }
       
      if(b.isDead){
        //println("test");
        bullets.remove(i);
      }
     }
     
     for(int i = 0; i< enemybullets.size(); i++) {
     EnemyBullet eb = enemybullets.get(i);
     eb.update();
     
       if(eb.checkCollision(player)) {
         player.isDead = true; 
         println("Playerdead");
       }
       
       if(eb.isDead) enemybullets.remove(i);
     }
    
    player.update();
    
    if(scenePlay == null){
      println("aaaaaaa");
    }
  }
  
  
   
  
  void draw() {
    
  for(int i = 0; i < flamethrowers.size(); i++) {
   Flamethrower f = flamethrowers.get(i);
   f.draw();
  }
   
  for(int i = 0; i< walls.size(); i++) {
   Wall w = walls.get(i);
   w.draw();
  }
  
  for(int i = 0; i< rockets.size(); i++) {
   Rocket r = rockets.get(i);
   r.draw();
  }
  
  for(int i = 0; i< shockwaves.size(); i++) {
   Shockwave s = shockwaves.get(i);
   s.draw();
  }
  
  for (int i = 0; i < doors.size(); i++) {
    Door d = doors.get(i);
    d.draw();
  }
  
  for(int i = 0; i< enemies.size(); i++) {
   Enemy e = enemies.get(i);
   e.draw();
  }
  
  for(int i = 0; i< splitenemies.size(); i++) {
   SplitEnemy se = splitenemies.get(i);
   se.draw();
  }
  
  for(int i = 0; i< bullets.size(); i++) {
   Bullet b = bullets.get(i);
   b.draw();
  }
  
  for(int i = 0; i< enemybullets.size(); i++) {
   EnemyBullet eb = enemybullets.get(i);
   eb.draw();
  }
  
  player.draw(); 
  
  //popMatrix below
  popMatrix();
  
  
  // DRAW HUD
  playerHUD.update();
  playerHUD.draw();
    
  }   
}
  
  
