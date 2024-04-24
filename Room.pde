class Room {
  
  float x, y; // These variables are room dimensions
  final float w = 1000, h = 600; // These variables are room dimensions
  float gapSize = 200;
  float wallThickness = 15;
  
  boolean topWall, leftWall, rightWall, bottomWall;
  Door d1, d2, d3, d4;
  
  float wallWidth = w - w/2 - gapSize/2;
  float wallHeight = h - h/2 - gapSize/2;
  
  float yRange = random(100, 450);
  float xRange = random(100, 850);
  
  
  Room(float xPos, float yPos) {
    
    println("asasasaS");
    
    x = xPos;
    y = yPos;
    
    // TOP WALLS
    Wall w1 = new Wall(x + wallWidth/2, y + wallThickness/2, wallWidth, wallThickness);
    if(scenePlay != null){
      scenePlay.walls.add(w1);
    }
    Wall w2 = new Wall(w1.x + gapSize/2 + w1.w, y + wallThickness/2, wallWidth, wallThickness);
    if(scenePlay != null){ 
      scenePlay.walls.add(w2);
    }
    d1 = new Door(x + w/2 - gapSize/4, y + wallThickness/2, wallThickness);
    if(scenePlay != null){
      scenePlay.doors.add(d1);
    }
    
    // RIGHT WALLS
    Wall w3 = new Wall(w1.x + w/2 + w1.w/2, y + wallHeight/2, wallThickness, wallHeight);
    if(scenePlay != null){ 
      scenePlay.walls.add(w3);
    }
    Wall w4 = new Wall(w1.x + w/2 + w1.w/2, w3.y + w3.h + gapSize/2, wallThickness, wallHeight + wallThickness*2);
    if(scenePlay != null){ 
      scenePlay.walls.add(w4);
    }
    d2 = new Door(w1.x + w/2 + w1.w/2, y + h/2 - gapSize/4 - wallThickness/2, wallThickness);
    if(scenePlay != null){
      scenePlay.doors.add(d2);
    }
    
    // BOTTOM WALLS
    Wall w5 = new Wall(x + wallWidth/2, y + wallThickness/2 + h - gapSize/2, wallWidth, wallThickness);
    if(scenePlay != null){ 
      scenePlay.walls.add(w5);
    }
    Wall w6 = new Wall(w1.x + gapSize/2 + w1.w, y + wallThickness/2 + h - gapSize/2, wallWidth, wallThickness);
    if(scenePlay != null){ 
      scenePlay.walls.add(w6);
    }
    d3 = new Door(x + w/2 - gapSize/4, y + wallThickness + h - gapSize/2 - wallThickness/2, wallThickness);
    if(scenePlay != null){
      scenePlay.doors.add(d3);
    }
    
    // LEFT WALLS
    Wall w7 = new Wall(w1.x + w/2 + w1.w/2 - w + gapSize/2, y + wallHeight/2, wallThickness, wallHeight);
    if(scenePlay != null){
      scenePlay.walls.add(w7);
    }
    Wall w8 = new Wall(w1.x + w/2 + w1.w/2 - w + gapSize/2, y + wallHeight + gapSize, wallThickness , wallHeight + wallThickness*2);
    if(scenePlay != null){
      scenePlay.walls.add(w8);
    }
    d4 = new Door(w1.x + w/2 + w1.w/2 - w + gapSize/2, y + h/2 - gapSize/4 - wallThickness/2, wallThickness);
    if(scenePlay != null){
      scenePlay.doors.add(d4);
    }
    
    Enemy e = new Enemy(x + xRange, y + yRange);
    scenePlay.enemies.add(e);
  }
  
  void update() {
    
    // COLLISION WITH TOP DOOR
    if(scenePlay.player.checkCollision(d1)) {
      if(!topWall) {
        topWall = true;
        Room r = new Room(x, y - h + wallHeight/2);
        scenePlay.rooms.add(r);
        r.bottomWall = true;
      }
    }
    
    // COLLISION WITH RIGHT DOOR
    if(scenePlay.player.checkCollision(d2)) {
      if(!rightWall) {
        rightWall = true;
        Room r = new Room(x + w - wallWidth/2 + gapSize/2, y);
        scenePlay.rooms.add(r);
        r.leftWall = true;
      }
    }
    
    
    // COLLISION WITH BOTTOM DOOR
    if(scenePlay.player.checkCollision(d3)) {
      if(!bottomWall) {
        bottomWall = true;
        Room r = new Room(x, y + h - gapSize + wallHeight/2);
        scenePlay.rooms.add(r);
        r.topWall = true;
      }
    }
    
    // COLLISION WITH LEFT DOOR                              DOOR DOESNT WORK // CHECK ROOM BOUNDRIES
    if(scenePlay.player.checkCollision(d4)) {
      if(!leftWall) {
        leftWall = true;
        Room r = new Room(x - w + wallWidth/2 - gapSize/2, y);
        scenePlay.rooms.add(r);
        r.rightWall = true;
      }
    }
    
  }  
}
  
  
