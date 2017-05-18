private class Player {

  float x;
  float y;
  float myWidth;
  float myHeight;
  float verticalSpeed;
  float z;
  int jumps;
  float z5;
  
  Player(){
    
    x=150;
    y=height/2;
    myWidth=75;
    myHeight=75;
    verticalSpeed=0;
    z=0;
    jumps=0;
    z5=0;
    
  }
  
  void display(){
    if (game.gameMode!=5 && game.gameMode!=6){
    fill(255);
    }
    else{
      fill(0);
      stroke(255);
    }
    if (game.gameMode==4){
      fill(255,165,0);
      
    }
    
    //rect(x,y,myWidth,myHeight);
    pushMatrix();
   translate(x, y, z5); 
   
   rotateX(5+z);
    rotateY(0.5+z);
    box(myWidth);
    popMatrix();
    z=z+0.01;
    fill(255);
    
      
    
  }
  
  void move(){
    if (game.gameMode!=5 && game.gameMode!=6){
      portalOneMove();
      
    }
    
    else if (game.gameMode==5){
              println(x,y,z5);

      if (x>=width/2){
        x=x-15;
        y=y+8;
        z5=z5+10;
        
      }
      
      else {
        z5=0;
        game.gameMode=6;
       
        //camera(70.0, 35.0, 120.0, 50.0, 50.0, 0.0, 
       //0.0, 1.0, 0.0);
      }
      
    }
    
    else if (game.gameMode==6){
       //y=y-verticalSpeed;
     if (game.gameMode==6 && y>-300){
      
        y=y-10;
      }
      else {
        game.p=new Player();
        game.p.y=game.p.y-700;;
    game.speed=game.speed+7;;
    game.objects=new ArrayList();
    game.gameMode=0;
    game.holes=new ArrayList();
    game.sphereCount=0;
    game.coinCount=0;
    frameCount=0;
        
      }
      if (game.gameMode==6){
        //z5=z5-1;
        println(y);
        if (myWidth<75){
        myWidth=myWidth+0.1;
        myHeight=myHeight+0.1;
        }
        
      }
      
    
    
      //println(z5,myWidth,myHeight);
         
       }
     
    }
      
    
    
         
  
  
  void portalOneMove(){
    y=y-verticalSpeed;
    //println(y,height/2);
    if (game.gameMode==4){
      
       if (y<height/2-30){
         z=z+1;
         if (y+30>height/2){
           y=y+(height/2-y);
         }
         else{
         y=y+30;
         }
         
       }
       
       else{
         x=x+50;
       }
       if (x>width+myWidth){
         game.gameMode=5;
         y=0;
         z=-500;
         myWidth=10;
         myHeight=10;
         
       }
     
    }
    else if  (game.gameMode==2){
      
      verticalSpeed=-7;
      z5=z5-15;
      x=x-15;
      
    }
    else if (y-myHeight<=0){
      verticalSpeed=-2;
      //myHeight+2;
      
    }
    else if (y<height/2){ 
      
      verticalSpeed=verticalSpeed-1;
      z=z+0.08;
    }
    
    
   else  {
      jumps=0;
      verticalSpeed=0;
      y=height/2;
      
    }
    
  }
  
  
  
}
