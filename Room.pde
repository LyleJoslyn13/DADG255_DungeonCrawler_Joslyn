class Room {
  
  float x, y; // These variables are room dimensions
  final float w = 1000, h = 600; // These variables are room dimensions
  float gapSize = 200;
  float wallThickness = 15;
  
  boolean topWall, leftWall, rightWall, bottomWall;
  Door d1, d2, d3, d4;
  
  float wallWidth = w - w/2 - gapSize/2;
  float wallHeight = h - h/2 - gapSize/2;
  
  
  Room(float xPos, float yPos) {
    
    x = xPos;
    y = yPos;
    
    // TOP WALLS 
    Wall w1 = new Wall(x + wallWidth/2, y + wallThickness/2, wallWidth, wallThickness);
    walls.add(w1);
    Wall w2 = new Wall(w1.x + gapSize/2 + w1.w, y + wallThickness/2, wallWidth, wallThickness);
    walls.add(w2);
    d1 = new Door(x + w/2 - gapSize/4, y + wallThickness/2, wallThickness);
    doors.add(d1);
    
    // RIGHT WALLS
    Wall w3 = new Wall(w1.x + w/2 + w1.w/2, y + wallHeight/2, wallThickness, wallHeight);
    walls.add(w3);
    Wall w4 = new Wall(w1.x + w/2 + w1.w/2, w3.y + w3.h + gapSize/2, wallThickness, wallHeight);
    walls.add(w4);
    d2 = new Door(w1.x + w/2 + w1.w/2, y + h/2 - gapSize/4, wallThickness);
    doors.add(d2);
    
    //// BOTTOM WALLS
    //Platform p5 = new Platform(x, y, w - w/2 - gapSize/2, wallThickness);
    //platforms.add(p5);
    //Platform p6 = new Platform(x + gapSize/2 + p1.w, y, w - w/2 - gapSize/2,wallThickness);
    //platforms.add(p6);
    
    //// LEFT WALLS
    //Platform p7 = new Platform(x, y, w - w/2 - gapSize/2, wallThickness);
    //platforms.add(p7);
    //Platform p8 = new Platform(x + gapSize/2 + p1.w, y, w - w/2 - gapSize/2,wallThickness);
    //platforms.add(p8);
  }
  
  void update() {
    
    // COLLISION WITH TOP DOOR
    if(player.checkCollision(d1)) {
      if(!topWall) {
        topWall = true;
        Room r = new Room(x, y - h + wallHeight/2);
        rooms.add(r);
        r.bottomWall = true;
      }
    }
    
    // COLLISION WITH RIGHT DOOR
    if(player.checkCollision(d2)) {
      if(!rightWall) {
        rightWall = true;
        Room r = new Room(x + w - wallWidth/2, y);
        rooms.add(r);
        r.leftWall = true;
      }
    }
    
  }  
}
  
  