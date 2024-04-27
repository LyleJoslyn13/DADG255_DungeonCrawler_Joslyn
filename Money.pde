class Money extends AABB {

  float radius = 4;
  
  Money(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    setSize(radius*2, radius*2);
  }

  void update() {
    super.update();
  }
  
  void draw() {
    fill(#fccf03);
    rect(x, y, radius*2, radius*2); 
  }

}
