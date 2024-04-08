float dt = 0;
float prevTime = 0;

Player player;
Camera camera;
HUD hud;

ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Wall> walls = new ArrayList();
ArrayList<Rocket> rockets = new ArrayList();
ArrayList<Shockwave> shockwaves = new ArrayList();
ArrayList<Door> doors = new ArrayList();
ArrayList<Room> rooms = new ArrayList();


void setup() {
  size(1280, 720);
  player = new Player(width/2, height/2); 
  camera = new Camera(player);
  
  //for(int i = 0; i < 10; i++) {
  //  Wall w = new Wall(random(width), random(height));
  //  walls.add(w);
  //}
    
    //Enemy e = new Enemy(random(width), random(height));
    //enemies.add(e);
    
    Room r = new Room(-camera.x, -camera.y);
    rooms.add(r);
    
    hud = new HUD();
  }
  
  


void draw() {
  //BACKGROUND AND DELTA TIME
  calcDeltaTime();
  background(128);
  
  //pushMatrix Below
  pushMatrix();
  translate(-camera.x, -camera.y);
  
  
  
  
  // SPAWN OBJECTS
  
  
  
  // UPDATE OBJECTS
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
  
  //for(int i = 0; i< enemies.size(); i++) {
  // Enemy e = enemies.get(i);
  // e.update();
  //}
  
   for (int i = 0; i < doors.size(); i++) {
    Door d = doors.get(i);
    d.update();
   }
   
    for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.update();
    }
  
  player.update();
  
  // LATE UPDATE OBJECTS
  Keyboard.update();
  
  
  // DRAW OBJECTS
  
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
  
  //for(int i = 0; i< enemies.size(); i++) {
  // Enemy e = enemies.get(i);
  // e.draw();
  //}
  
  player.draw(); 
  
  //popMatrix below
  popMatrix();
  
  
  // DRAW HUD
  hud.update();
  hud.draw();
  
  
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  if(mouseButton == LEFT)
  Mouse.handleKeyDown(Mouse.LEFT);
}

void mouseReleased() {
  Mouse.handleKeyUp(Mouse.LEFT);
}
