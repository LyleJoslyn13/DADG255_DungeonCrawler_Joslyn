// This Program plays an Dungeon Crawler Game
// Copyright Lyle Joslyn 2024

// SOUND CREDITS
// Main Menu Music by: Japanese Breakfast - Sable Main Menu // https://www.youtube.com/watch?v=eaIJ9iYq1fc
// Game Over Sound by: FromSoftware - Dark Souls Death SFX // https://www.youtube.com/watch?v=j_nV2jcTFvA
// Collecting Coins Sound by: SEGA - Sonic Ring SFX // https://www.youtube.com/watch?v=n9GImjHkLmE


// CONTROLS
// W - Move Up
// A - Move Left
// S - Move Down
// D - Move Right
// HOLD Left Click - Fire Machine Gun
// HOLD Right Click - Fire FlameThrower 
// Q - Fire Rockets

//SOUND FX LIBARY
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

SceneTitle sceneTitle;
ScenePlay scenePlay;
SceneGameOver sceneGameOver;
ScenePause scenePause;

Minim minim;
AudioPlayer MainMenu;
AudioPlayer GameOver;
AudioPlayer Coin;

float dt = 0;
float prevTime = 0;



void setup() {
  size(1280, 720);
  
  switchToTitle();
  
  // AUDIO FILE SETUP BELOW
  minim = new Minim(this);
  MainMenu = minim.loadFile("Main_Menu.mp3");
  GameOver = minim.loadFile("Game_Over.mp3");
  Coin = minim.loadFile("Coin.mp3");
  MainMenu.loop();
  }
  
  


void draw() {
  //BACKGROUND AND DELTA TIME
  calcDeltaTime();
  background(128);
  
  if(sceneTitle != null){
    sceneTitle.update();
    if(sceneTitle != null) sceneTitle.draw(); // this extra if statement exists because the sceneTitle.update() might result in the scene switching...
  }
  else if(scenePause != null){
    scenePause.update();
    if(scenePause != null) scenePause.draw(); // this extra if statement exists because the sceneGameOver.update() might result in the scene switching...
  }
  else if(scenePlay != null){
    scenePlay.update();
    if(scenePlay != null) scenePlay.draw(); // this extra if statement exists because the scenePlay.update() might result in the scene switching...
  }
  else if(sceneGameOver != null){
    sceneGameOver.update();
    if(sceneGameOver != null) sceneGameOver.draw(); // this extra if statement exists because the sceneGameOver.update() might result in the scene switching...
  }
  
 
  // Prep for next frame //
  Keyboard.update();

}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}

void switchToTitle(){                      // setting the scene to title screen //
  sceneTitle = new SceneTitle();
  scenePlay = null;
  sceneGameOver = null;
  scenePause = null;
}
void switchToPlay(){                      // setting the scene to Gameplay screen //
  scenePlay = new ScenePlay();
  sceneTitle = null;
  sceneGameOver = null;
  scenePause = null;
}
void switchToGameOver(){
  sceneGameOver = new SceneGameOver();
  scenePlay = null;
  sceneTitle = null;
  scenePause = null;
}
void switchToPause(){
  scenePause = new ScenePause();
  sceneTitle = null;
  sceneGameOver = null;
  scenePause.pauseHUD.handleRoomB = false;
  scenePause.pauseHUD.handleFB = false;
}
void switchToPlayFromPause(){
  sceneTitle = null;
  sceneGameOver = null;
  scenePlay.playerHUD.handle = false;
  scenePause = null;
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
  if(mouseButton == RIGHT)
  Mouse.handleKeyDown(Mouse.RIGHT);
}

void mouseReleased() {
  Mouse.handleKeyUp(Mouse.LEFT);
  Mouse.handleKeyUp(Mouse.RIGHT);
}

boolean checkCollision(Shockwave s, Enemy e) {       
    float dx = s.x - e.x;
    float dy = s.y - e.y;
    float dis = sqrt(dx * dx + dy * dy);
    if(dis <= s.radius + e.radius) return true;
    return false;
  }
