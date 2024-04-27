class HUD {
 
  ArrayList<Button> buttons = new ArrayList();
  
  boolean handle = false;
  
  HUD() {
    Button pause = new Button(width - 175, 75, "STORE");
    buttons.add(pause);
  }
  
  void update() {
    for(int i = 0; i < buttons.size(); i++) {
     Button b = buttons.get(i);
     b.update();
     
     if(b.isClicked()) {
       b.currentColor = b.pressedColor;
       switch(b.buttonName) {
         case "STORE":
         if(handle == false){
         switchToPause();
         handle = true;
         }
         break;
         case "SKILL1":
         //do something
         break;
         default:
         // do something else
         break;
       }
     }
    } 
  }
  
  void draw() {
    
    for(int i = 0; i < buttons.size(); i++) {
     Button b = buttons.get(i);
     b.draw();
     
     fill(0);
     textSize(30);
     text(scenePlay.player.moneyCount + " Coins", 100, 100);
  }
  
}

class Button {
 float x, y, w = 150, h = 50;
 String buttonName;
 color normalColor = 25, hoveredColor = 200, pressedColor = 60, currentColor;
 boolean isHovered;
 
 Button(float x, float y, String name) {
  this.x = x;
  this.y = y;
  buttonName = name;
  currentColor = normalColor;
 }
 
 void update() {
  
   if(mouseX > x-w/2 && mouseX < x + w/2 && mouseY > y-h/2 && mouseY < y + h/2) {
    isHovered = true;
    currentColor = hoveredColor;
   } else {
    isHovered = false; 
    currentColor = normalColor;
   }
   
 }
 
 void draw() {
   stroke(255);
   strokeWeight(2);
   //println(currentColor);
   fill(currentColor);
   rect(x-w/2, y-h/2, w, h);
   fill(255);
   textAlign(CENTER, CENTER);
   textSize(18);
   text(buttonName, x, y);
   noStroke();
   
 }
 
 boolean isClicked() {
  if(isHovered) {
   if(Mouse.isDown(Mouse.LEFT)) {
     currentColor = pressedColor;
     return true; 
   }
  }
  return false;
 }
 
 
}
}
