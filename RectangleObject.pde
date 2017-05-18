private class RectangleObject extends DefaultObject {
  
 
  float z;
  float z2;
  
  RectangleObject(float sizeWidth, float sizeHeight, float z2){
     z=0;
    this.z2=z2;
    enemy=false;
    this.sizeWidth=sizeWidth;
    this.sizeHeight=sizeHeight;
    x=width;
    y=int(random(0+sizeHeight,height/2-game.p.myHeight));
    
    
  }
  
  void move(){
    x=x-game.speed;
    //println(x,y);
    
    
  }
  
  void display(){
    fill(255,215,0);
    pushMatrix();
    translate(x, y, 0); 
    rotateX(5+z);
    rotateY(0.5+z);
    box(sizeWidth,sizeHeight,z2);
    popMatrix();
    z=z+0.01;
    
  }
  
  
  
}
