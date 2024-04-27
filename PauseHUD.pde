class PauseHUD {
 
  ArrayList<ResumeButton> resumebuttons = new ArrayList();
  ArrayList<FlamethrowerButton> flamethrowerbuttons = new ArrayList();
  ArrayList<RocketButton> rocketbuttons = new ArrayList();
  ArrayList<HealthButton> healthbuttons = new ArrayList();
  
  boolean handleRoomB = false;
  boolean handleFB = false;
  boolean handleRocketB = false;
  boolean handleHB = false;
  
  PauseHUD() {
    
    ResumeButton resume = new ResumeButton(width - 175, 675, "RESUME");
    resumebuttons.add(resume);
    
    FlamethrowerButton flamethrower = new FlamethrowerButton(300, 400, "PURCHASE FLAMETHROWER");
    flamethrowerbuttons.add(flamethrower);
    
    RocketButton rocket = new RocketButton(650, 400, "PURCHASE ROCKETS");
    rocketbuttons.add(rocket);
    
    HealthButton health = new HealthButton(1000, 400, "PURCHASE HEALTH");
    healthbuttons.add(health);
    
  }
  
  void update() {
    for(int i = 0; i < resumebuttons.size(); i++) {
     ResumeButton roomb = resumebuttons.get(i);
     roomb.update();
     
     if(roomb.isClicked()) {
       roomb.currentColor = roomb.pressedColor;
       if(handleRoomB == false){
         switchToPlayFromPause();
         handleRoomB = true;
       }
     }
    } 
    
    for(int i = 0; i < flamethrowerbuttons.size(); i++) {
     FlamethrowerButton fb = flamethrowerbuttons.get(i);
     fb.update();
     
     if(fb.isClicked()) {
       fb.currentColor = fb.pressedColor;
       if(handleFB == false){
         //PURCHASE FLAMETHROWER
         if(scenePlay.isFlamethrower == false){
          if(scenePlay.player.moneyCount >= 35){
            scenePlay.player.moneyCount -= 35;
            scenePlay.isFlamethrower = true;
          }
         }
         handleFB = true;
       }
     }
    }
    
    for(int i = 0; i < rocketbuttons.size(); i++) {
     RocketButton rocketb = rocketbuttons.get(i);
     rocketb.update();
     
     if(rocketb.isClicked()) {
       rocketb.currentColor = rocketb.pressedColor;
       if(handleRocketB == false){
         //PURCHASE ROCKETS
         if(scenePlay.isRocket == false){
          if(scenePlay.player.moneyCount >= 50){
            scenePlay.player.moneyCount -= 50;
            scenePlay.isRocket = true;
          }
         }
         handleRocketB = true;
       }
     }
    }
    
    for(int i = 0; i < healthbuttons.size(); i++) {
     HealthButton hb = healthbuttons.get(i);
     hb.update();
     
     if(hb.isClicked()) {
       hb.currentColor = hb.pressedColor;
       if(handleHB == false){
         //PURCHASE ROCKETS
         if(scenePlay.isFullHealth == false){
           if(scenePlay.player.moneyCount >= 15){
             scenePlay.player.moneyCount -= 15;
             scenePlay.player.g += 50;
             scenePlay.player.r -= 50;
           }
         }
         handleFB = true;
       }
     }
    }
  }
  
  void draw() {
    
    for(int i = 0; i < resumebuttons.size(); i++) {
     ResumeButton roomb = resumebuttons.get(i);
     roomb.draw();
    }
     
     for(int i = 0; i < flamethrowerbuttons.size(); i++) {
     FlamethrowerButton fb = flamethrowerbuttons.get(i);
     fb.draw();
     }
     
     for(int i = 0; i < rocketbuttons.size(); i++) {
     RocketButton rocketb = rocketbuttons.get(i);
     rocketb.draw();
     }
     
     for(int i = 0; i < healthbuttons.size(); i++) {
     HealthButton hb = healthbuttons.get(i);
     hb.draw();
     }
    
  }
  


  class FlamethrowerButton {
   float x, y, w = 350, h = 250;
   String buttonName;
   color normalColor = 25, hoveredColor = 200, pressedColor = 60, currentColor;
   boolean isHovered;
   
   FlamethrowerButton(float x, float y, String name) {
    this.x = x;
    this.y = y;
    buttonName = name;
    currentColor = normalColor;
   }
   
   void update() {
    if(scenePlay.isFlamethrower == false) {
     if(mouseX > x-w/2 && mouseX < x + w/2 && mouseY > y-h/2 && mouseY < y + h/2) {
      isHovered = true;
      currentColor = hoveredColor;
     } else {
      isHovered = false; 
      currentColor = normalColor;
     }
    }
      if(scenePlay.isFlamethrower) {
       currentColor = hoveredColor; 
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
     text("35 Coins", x + 100, y + 100);
     noStroke();
   }
   
   boolean isClicked() {
     if(scenePlay.isFlamethrower == false) {
      if(isHovered) {
       if(Mouse.onDown(Mouse.LEFT)) {
         currentColor = pressedColor;
         return true; 
       }
      }
     }
    return false;
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
  
  class RocketButton {
   float x, y, w = 350, h = 250;
   String buttonName;
   color normalColor = 25, hoveredColor = 200, pressedColor = 60, currentColor;
   boolean isHovered;
   
   RocketButton(float x, float y, String name) {
    this.x = x;
    this.y = y;
    buttonName = name;
    currentColor = normalColor;
   }
   
   void update() {
    if(scenePlay.isRocket == false){
     if(mouseX > x-w/2 && mouseX < x + w/2 && mouseY > y-h/2 && mouseY < y + h/2) {
      isHovered = true;
      currentColor = hoveredColor;
     } else {
      isHovered = false; 
      currentColor = normalColor;
     }
    }
    if(scenePlay.isRocket) {
     currentColor = hoveredColor; 
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
     text("50 Coins", x + 100, y + 100);
     noStroke();
   }
   
   boolean isClicked() {
    if(scenePlay.isRocket == false) {
     if(isHovered) {
     if(Mouse.onDown(Mouse.LEFT)) {
       currentColor = pressedColor;
       return true; 
       }
     }
    }
    return false;
   }
   
   
  }

class HealthButton {
   float x, y, w = 350, h = 250;
   String buttonName;
   color normalColor = 25, hoveredColor = 200, pressedColor = 60, currentColor;
   boolean isHovered;
   
   HealthButton(float x, float y, String name) {
    this.x = x;
    this.y = y;
    buttonName = name;
    currentColor = normalColor;
   }
   
   void update() {
    if(scenePlay.isFullHealth == false){
     if(mouseX > x-w/2 && mouseX < x + w/2 && mouseY > y-h/2 && mouseY < y + h/2) {
      isHovered = true;
      currentColor = hoveredColor;
     } else {
      isHovered = false; 
      currentColor = normalColor;
     }
    }
    
    if(scenePlay.isFullHealth) {
     currentColor = hoveredColor; 
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
     text("15 Coins", x + 100, y + 100);
     noStroke();
   }
   
   boolean isClicked() {
    if(scenePlay.isFullHealth == false) {
     if(isHovered) {
     if(Mouse.onDown(Mouse.LEFT)) {
       currentColor = pressedColor;
       return true; 
       }
     }
    }
    return false;
   }
   
   
  }

}
