float dt = 0;
float prevTime = 0;

Player player;
Camera camera;

ArrayList<Enemy> enemies = new ArrayList();

void setup() {
  size(1280, 720);
  player = new Player(width/2, height/2); 
  camera = new Camera(player);
  
  for(int i = 0; i < 10; i++) {
    Enemy e = new Enemy(random(width), random(height));
    enemies.add(e);
  }
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
  
  for(int i = 0; i< enemies.size(); i++) {
   Enemy e = enemies.get(i);
   e.update();
  }
  
  player.update();
  
  // LATE UPDATE OBJECTS
  Keyboard.update();
  
  
  // DRAW OBJECTS
  for(int i = 0; i< enemies.size(); i++) {
   Enemy e = enemies.get(i);
   e.draw();
  }
  
  player.draw(); 
  
  //popMatrix below
  popMatrix();
  
  
  // DRAW HUD
  
  
  
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
