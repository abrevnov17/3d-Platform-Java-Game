class PortalRed extends DefaultObject{
  float sizeDepth;
  PortalRed(){ 
  
   x=width-300;
    y=height/2;
    sizeWidth=500;
    sizeHeight=200;
    sizeDepth=300;
    enemy=false;
  }
  
  void move(){
    
    
  }
  
   void display(){
  fill(255,0,0);
  pushMatrix();
    translate(width-300, height/2, -20); 
    
  
  stroke(0);
  
    box(500,200,300);
    fill(0);

        box(510,150,150);

    
      popMatrix();
      fill(255);
      pushMatrix();
          translate(width-300, height/2, 400); 

      rect(width-300,height/2,120,150);
      popMatrix();
   }
  
  
  
  
}
