//NOTE: THIS CLASS IS NEVER USED... I WAS GOING TO CREATE A NEW KIND OF ENEMY THAT COMES AFTER YOU PORTAL BUT I DECIDED AGAINST IT
private class TileObject extends DefaultObject{
  float z;
  float z2;
  
  TileObject(float x, float y){
    enemy=true;
     this.x=x;
    this.y=y;
    sizeWidth=30;
    sizeHeight=50;
    z=0;
    z2=0;
 
    
  }
  
  void move(){
    //z=z+5;
    
  }
  
  void display(){
    pushMatrix();
    fill(0);
    translate(x, y, 0); 
    box(sizeWidth);
    popMatrix();
    fill(255);
    //println(x,y,z);
    
  }
  
  
  
  
  
  
  
}
