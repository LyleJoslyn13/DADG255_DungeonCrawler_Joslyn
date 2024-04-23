class PauseHUD {
 
  ArrayList<ResumeButton> resumebuttons = new ArrayList();
  
  boolean handle = false;
  
  PauseHUD() {
    ResumeButton resume = new ResumeButton(width - 175, 675, "PAUSE");
    resumebuttons.add(resume);
  }
  
  void update() {
    for(int i = 0; i < resumebuttons.size(); i++) {
     ResumeButton b = resumebuttons.get(i);
     b.update();
     
     if(b.isClicked()) {
       b.currentColor = b.pressedColor;
       if(handle == false){
         switchToPlayFromPause();
         handle = true;
       }
       switch(b.buttonName) {
         case "RESUME":
         //switchToPlayFromPause();
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
    
    for(int i = 0; i < resumebuttons.size(); i++) {
     ResumeButton b = resumebuttons.get(i);
     b.draw();
    
  }
  
}

class ResumeButton {
 float x, y, w = 150, h = 50;
 String buttonName;
 color normalColor = 25, hoveredColor = 200, pressedColor = 60, currentColor;
 boolean isHovered;
 
 ResumeButton(float x, float y, String name) {
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
   if(Mouse.onDown(Mouse.LEFT)) {
     currentColor = pressedColor;
     return true; 
   }
  }
  return false;
 }
 
 
}
}
