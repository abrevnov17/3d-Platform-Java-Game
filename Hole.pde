 private class Hole {
  
  float x,y,sizeWidth,sizeHeight;
  int speed;
  
  Hole(){
    
    sizeWidth=150;
    sizeHeight=5;
    x=width+sizeWidth;
    y=height/2+75;
    //75 is the player's height which is constant
    
  }
  
  void display(){
    
    fill(0);
    rect(x,y,sizeWidth,sizeHeight);
    
    
  }
  
  void move(){
    
    x=x-game.speed;
    
  }
  
  
  
}
