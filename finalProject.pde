//Anatoly Brevnov
//May 21, 2015
//Intermediate Computer Science
//Period 2
//Instructor: Darby Thompson

GameManager game;
void setup(){
  game=new GameManager();
  //1925
  size(1925,950,P3D);
  lights();

  
}


void draw(){
  background(0);
  
  game.update();
  game.display();
  
}

void keyPressed(){
  if (game.gameMode!=-1){
  if (key==' '){
       
       game.playerJump();
    }
    if (game.gameMode==1){
      game.gameMode=0;
      game.objects.clear();
      game.holes.clear();
      game.speed=4.5;
      game.sphereCount=0;
      game.coinCount=0;
      game.p=new Player();
      game.score=0;
      frameCount=0;
      
    }
    if (key=='p'&& game.gameMode==3){
      
      game.portal();
      
    }
  }
  
  else{
    game.gameMode=0;
  }
    
  
  
}
