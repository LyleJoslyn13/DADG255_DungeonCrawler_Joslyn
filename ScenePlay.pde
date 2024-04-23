class ScenePlay {
  
Player player;
Camera camera;
HUD playerHUD;

ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Wall> walls = new ArrayList();
ArrayList<Rocket> rockets = new ArrayList();
ArrayList<Shockwave> shockwaves = new ArrayList();
ArrayList<Door> doors = new ArrayList();
ArrayList<Room> rooms = new ArrayList();

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
      rockets.remove(r);
     }
     
    }
    
    for(int i = 0; i< shockwaves.size(); i++) {
     Shockwave s = shockwaves.get(i);
     s.update();
    }
    
    for(int i = 0; i< enemies.size(); i++) {
     Enemy e = enemies.get(i);
     e.update();
     
     if(e.isDead) enemies.remove(i);
    }
    
     for (int i = 0; i < doors.size(); i++) {
      Door d = doors.get(i);
      d.update();
     }
     
      for (int i = 0; i < rooms.size(); i++) {
      Room r = rooms.get(i);
      r.update();
      }
    
    player.update();
    
    if(scenePlay == null){
      println("aaaaaaa");
    }
  }
  
  
   
  
  void draw() {
   
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
  
  player.draw(); 
  
  //popMatrix below
  popMatrix();
  
  
  // DRAW HUD
  playerHUD.update();
  playerHUD.draw();
    
  }   
}
  
  
