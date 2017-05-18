public class GameManager {

  Player p;
  float speed;
  ArrayList <DefaultObject> objects;
  ArrayList <Hole> holes;
  int gameMode;
  int sphereCount;
  int coinCount;
  int score;
  Player q;
        



  GameManager() {
    p=new Player();
    speed=4.5;
    objects=new ArrayList();
    gameMode=-1;
    holes=new ArrayList();
    sphereCount=0;
    coinCount=0;
    score=0;
    q=new Player();
    q.myWidth=2000;
    q.x=width/2;
    q.y=height/2;

  }   

  void display() {
    
    if (gameMode==-1){
        q.display();
        q.move();
        fill(255, 215, 0);
    textSize(50);
    text("Press Any Button to Play",width/2-150,height/2);
    //println("a");
    textSize(25);
    fill(255);
        

      
      
    }
    else{
   if (gameMode==5 || gameMode==6) {
    
    background(255,0,0);
    //println("a");
    p.move();
    p.display();
    
    
  }
  else if (gameMode!=5&&game.gameMode!=6){
    displaySetup();
    if (gameMode!=1) {
      displayHoles();


      displayObjects();
      p.display();
    } else if (gameMode==1) {
      playAgainSetup();
    }
    if (gameMode==3){
      
      textSize(75);
    fill(255);
    text("Press p to use the portal...", 200, height/2);
    fill(0);
      
    }
  }
    }
  }

  void update() {
    if (gameMode!=-1){
    if (gameMode!=5&&game.gameMode!=6){
    if (gameMode!=4){
    checkIfFallenThroughTheGround();
    }
    moveHoles();
    moveObjects(); 
    frameCountDependantStuff();
    checkPlayerObjectCollisions(); 
    p.move();
    }
    if (gameMode==6){
      
       for (int i=0;i<objects.size();i++){
         
         objects.get(i).display();
         objects.get(i).move();
       }
       if (keyPressed){
    if (key==CODED){
      if (keyCode==LEFT){
        moveLeft();
        
      }
      else if (keyCode==RIGHT){
        
        moveRight();
        
      }
      
    }
       }
       if (frameCount%100==0){
         /*TileObject object=new TileObject(900,height/2);
         objects.add(object);
         */
         
       }
    
    
  
    }
    }
  }

  void displaySetup() {
    fill(255, 215, 0);
    textSize(50);
    text("Score: "+score, width-300, 75);
    //println("a");
    textSize(25);
    fill(0);
    noStroke();
    fill(255);
    rect(0, height/2+p.myHeight, width, 5);
    stroke(0);
    fill(0);
    //text("hi",width/2,height/2);
  }

  void displayHoles() {
    for (int i=holes.size ()-1; i>=0; i--) { 
      holes.get(i).display();
      if (holes.get(i).x<=p.x-10 && holes.get(i).x+holes.get(i).sizeWidth-10>=p.x+p.myWidth&&p.y==height/2&&gameMode!=4) {
        p.y=p.y+2;
        gameMode=2;
      }
    }
  }

  void displayObjects() {
    for (int i=0; i<objects.size (); i++) {

      objects.get(i).display();
    }
  }
  void playAgainSetup() {
    textSize(75);
    fill(255);
    text("Press any key to play again...", 200, height/2);
    fill(0);
  }

  void checkIfFallenThroughTheGround() {

    if (p.y+p.myHeight>height*4.75&&gameMode==2) {
      holes.clear();
      objects.clear();
      gameMode=1;
    }
  }
  void moveHoles() {
    for (int i=holes.size ()-1; i>=0; i--) { 
      holes.get(i).move();
      if (holes.get(i).x+holes.get(i).sizeWidth<=0) {

        holes.remove(i);
      }
    }
  }
  void playerJump() {
    println(gameMode);
    if (p.jumps<2&&gameMode!=6&&gameMode!=2) {
      if (gameMode!=6&& gameMode!=5){
      p.verticalSpeed=20;
      }
      
      else {
        p.verticalSpeed=5;
      }
      p.jumps=p.jumps+1;
    }
  }
  void moveObjects() {
    for (int i=objects.size ()-1; i>=0; i--) {

      objects.get(i).move();
      if (objects.get(i).x+objects.get(i).sizeWidth<0) {
        objects.remove(i);
        //if (objects.get(i).getClass().equals(SphereObject.class)){
        //gameMode=1;
        //println(objects.get(i).getClass());
        //}
        //println("a");
      }
    }
  }


  void frameCountDependantStuff() {
    if (frameCount%int(abs(100-sphereCount)+1)==0) {
      SphereObject sphere=new SphereObject(40, 40);
      objects.add(sphere);
      sphereCount=sphereCount+1;
    }
    if (frameCount%int(abs(120-coinCount)+2)==0) {
      RectangleObject rectangle=new RectangleObject(40, 40, 40);
      objects.add(rectangle);
      coinCount=coinCount+1;
    }

    if (frameCount%200==0) {
      Hole myHole=new Hole();
      holes.add(myHole);
    }
    if (frameCount%10==0) {

      speed=speed+0.25;
    }
    if (frameCount%1000==0&&gameMode!=3 && gameMode!=1 && gameMode!=4&&gameMode!=2){
      
       objects.add(new PortalRed());
       gameMode=3;
      
    }
  }

  void checkPlayerObjectCollisions() {

    for (int i=objects.size ()-1; i>=0; i--) {

      if (dist(p.x, p.y, objects.get(i).x, objects.get(i).y)-25<=p.myWidth/2+objects.get(i).sizeWidth) {     
        if (objects.get(i).enemy==true&&gameMode!=4) {
          gameMode=1;


          //println(objects.get(i).enemy);
        } else {
          score=score+100;
        }
        objects.remove(objects.get(i));
        //println(objects.get(i).enemy);
      }
    }
  }
  
  void portal(){
    
    gameMode=4;
    
  }
  
  void moveLeft(){
    if (p.x-7-p.myWidth-p.myWidth/2>=0){
    p.x=p.x-7;
    }
  }
  
  void moveRight(){
    if (p.x+p.myWidth*4+p.myHeight+7<=width){
    p.x=p.x+7;
    }
        //println(p.x);

  }
}

