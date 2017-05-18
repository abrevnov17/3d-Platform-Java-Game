private class SphereObject extends DefaultObject {
  
  
  float z;
  
  SphereObject(float sizeWidth, float sizeHeight){
    z=0;
    this.sizeWidth=sizeWidth;
    this.sizeHeight=sizeHeight;
    x=width;
    y=int(random(0+sizeHeight,height/2-game.p.myHeight/2));
    enemy=true;
    
  }
  
  void move(){
    x=x-game.speed;
    
    
  }
  
  void display(){
        fill(0,0,255);
  pushMatrix();
    translate(x, y, 0); 
    rotateX(5+z);
    rotateY(0.5+z);
      sphereDetail(25);
  
  stroke(255);
    sphere(sizeWidth);
    
      popMatrix();

    z=z+0.01;
    stroke(0);
    
    
  }
  
  
  
}
