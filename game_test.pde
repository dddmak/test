import processing.opengl.*;
ArrayList<Boolean> blKeyStat;  //キーを覚える配列
int obstacle[][];
void keyPressed() {
  if ( key == '1')blKeyStat.set(4,true);
  else if (key == CODED) {
    switch(keyCode) {
    /*case UP:
      blKeyStat.set( 0, true );
      break;
    case DOWN:
      blKeyStat.set( 1, true );
      break;
    */
    case LEFT:
      blKeyStat.set( 2, true );
      break;
    case RIGHT:
      blKeyStat.set( 3, true );
      break;
    }
  }
  
}

void keyReleased() {
  if ( key == '1')blKeyStat.set(4,false);
  else if (key == CODED) {
    switch(keyCode) {
    /*
    case UP:
      blKeyStat.set( 0, false );
      break;
    case DOWN:
      blKeyStat.set( 1, false );
      break;
    */
    case LEFT:
      blKeyStat.set( 2, false );
      break;
    case RIGHT:
      blKeyStat.set( 3, false );
      break;
    }
  }
}

int humanX,humanY,humanZ;
int move_x = 5;
int move_z = 1;
void setup(){
  obstacle = new int[10][3];
  for(int i = 0;i < 10;i++){
    obstacle[i][0] = (int)(random(300) - 150);
    obstacle[i][1] = 0;
    obstacle[i][2] = (int)(-1*random(900) - 300);
    
  }
  size(400,400,OPENGL);
  frameRate(60);
  fill(63,127,255); 
  stroke(255);
  rectMode(CENTER);
  
  humanX = 0;
  humanY = 0;
  humanZ = 0;
  
  blKeyStat = new ArrayList<Boolean>();
  for(int i = 0;i < 5;i++){
    blKeyStat.add( false );
  }
}

void draw(){
  background(0,0,20); 
  translate(width/2,height/2);
  //human
  /*if( blKeyStat.get(0)==true ){
    humanZ += move;
  }
  if( blKeyStat.get(1)==true ){
    humanZ -= move;
  }
  */
  humanZ += move_z;
  move_z += 0.5;
  if( blKeyStat.get(2)==true ){
    humanX -= move_x;
  }
  if( blKeyStat.get(3)==true ){
    humanX += move_x;
  }
  if( blKeyStat.get(4)==true ){
    move_x = 10;
  }
  else move_x = 5;
  
  //human 
  box_trans(humanX,0,0,0,0,0,20,40,20);
  sphere_trans(humanX,-30,0,0,0,0,10);
  box_trans(humanX+14,-5,0,0,0,0,8,30,20);
  box_trans(humanX-14,-5,0,0,0,0,8,30,20);
  
  box_trans(humanX+8,35,0,0,0,0,8,30,20);
  box_trans(humanX-8,35,0,0,0,0,8,30,20);
  //obstacle
  for(int i = 0;i < 10;i++){
    if(obstacle[i][2] + humanZ > 400)obstacle[i][2] =  (int)(-1 * random(900) -300 - humanZ);
    box_trans(obstacle[i][0],obstacle[i][1],obstacle[i][2] + humanZ,0,0,0,10,90,20);
    if(((obstacle[i][2] + humanZ) > -20) && ((obstacle[i][2] + humanZ) < 20)){
      if((humanX > (obstacle[i][0] - 15))&&(humanX < (obstacle[i][0] + 15))){
        background(0,0,20); 
        textSize(50);  
        textAlign(CENTER);
        text("GAME OVER!!",0,0);
        noLoop();
      }
    }
  }
  
}
