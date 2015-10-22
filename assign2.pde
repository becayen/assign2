//You should implement your assign2 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
int gameState;
PImage hp;
PImage enemy;
PImage treasure;
PImage fighter;
PImage bg1;
PImage bg2;
PImage start1 ;
PImage start2 ;
PImage end1 ;
PImage end2 ;
int a ;
int b ;
int c ;
int d ;
int e ;
int f ;
int g ;
int h = 550;
int i = 240;
float speed = 8;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


void setup(){
  background(0);
  size(640,480);
  
  
  a=0 ;
  b=0 ;
  g=40;
  c=floor(random(0,600));
  d=floor(random(0,440));
  e=floor(random(0,420));
  f=floor(random(0,440));
  fill(255,0,0);
  rect(10,10,g,31);
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  enemy=loadImage("img/enemy.png");
  treasure=loadImage("img/treasure.png");
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");  
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
}
void draw(){
  image(start1,0,0);
    switch (gameState){
    case GAME_START:
  if(mouseX>210 && mouseX<440 && mouseY>380 && mouseY<410){
    if(mousePressed){
          gameState = GAME_RUN;
    }else{
      image(start2,0,0);
    }
  }
  break ;
  case GAME_RUN:
    image(bg1,a-640,0);
  image(bg2,a,0);  
  image(bg1,a+640,0);
  image(bg2,a-1280,0);
  fill(255,0,0);
  rect(15,10,g,31);
  image(hp,10,10);
  image(enemy,b,e);
  image(treasure,c,d);
  image(fighter,h,i);
  a+= 1 ;
  b+= 2 ;
  a%= 1280 ;
  b%= 580 ;
  f%= 440 ;
    if (upPressed) {
    i -= speed;
  }
  if (downPressed) {
    i += speed;
  }
  if (leftPressed) {
    h -= speed;
  }
  if (rightPressed) {
    h += speed;
  }
  if( h <= 0 ){
  h=0;
  }
  if( i <= 0 ){
  i=0;
  }
  if( h >= 590 ){
  h=590; 
  }
  if( i >= 430 ){
  i=430; 
   }

  if(h>=c-45 && h<c+40 && i>=d-45 && i<=d+40){
  c=floor(random(0,600));
  d=floor(random(0,440));
  image(treasure,c,d);   
  g+=10;
  }
  if(h>=b-45 && h<b+60 && i>=e-45 && i<=e+60){
  b=0;    
  e=floor(random(0,440));
  image(treasure,b,e);   
  b+=2;
  g-=20;
  }
  if(g>=200){
    g=200;
  }
  
  if(g<=0){
    gameState = GAME_OVER;
  }
  break ;
  case GAME_OVER:
    image(end1,0,0);
  if (mouseX>210 && mouseX<440 && mouseY>315 && mouseY<345){
    if (mousePressed){
     gameState = GAME_RUN;    
     g=40;
  a=0 ;
  b=0 ;
  g=40;
  c=floor(random(0,600));
  d=floor(random(0,440));
  e=floor(random(0,440));
  f=floor(random(0,440)); 
  h = 550;
  i = 240;
    }else{
     image(end2,0,0);
    }
  break;
        
      }
    }
    

}
  

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
