Particle [] bob;

void setup(){
  
  size(400, 400);
  bob = new Particle[150];
  
  for(int i = 0; i<bob.length; i++){
    bob[i] = new Particle(); 
  }
  bob[0] = new OddballParticle();
}

void draw(){
  fill(0, 10, 24, 80);
  rect(0, 0, height, width);
  for(int i = 0; i<bob.length; i++){
      
     bob[i].move();
     bob[i].show();

  }

}

class Particle{
  
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
  
  Particle(){
     myX = 200;
     myY = 200;
     myColor=color((int)(Math.random()*150),(int)(Math.random()*200),(int)(Math.random()*200));
     myAngle = (double)(Math.random()*2*Math.PI);
     mySpeed = (double)(Math.random()*3+.5);
     mySize = (float)(Math.random()*1.5);
  }

  
  void move(){
      
      myX = myX + (Math.cos(myAngle)*mySpeed);
      myY = myY + (Math.sin(myAngle)*mySpeed); 
      mySize+=.05;
      if(myX>width || myX<0){
        myX = width/2;
        mySize = (float)(Math.random()*2);
      }
      if(myY>width || myY <0){
        myY = height/2;
        mySize = (float)(Math.random()*2);
      }  
  }
  
    void show(){
      noStroke();
      fill(myColor);
      ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
      fill(myColor);
  }
}


class OddballParticle extends Particle{
  
  OddballParticle(){
     myX = 200;
     myY = 200;
     myColor=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
     mySize = (float)(Math.random()*50+20);
  }
  
  void move(){
    if(mouseX > myX)
      myX = myX + (int)(Math.random()*5)-1;
    else
       myX = myX + (int)(Math.random()*7)-5;
     
    if(mouseY > myY)
       myY = myY + (int)(Math.random()*5)-1;
    else
       myY = myY + (int)(Math.random()*7)-5;
  }
  
  void show(){
    noStroke();
      fill(myColor);
      rect((float)myX, (float)myY, (float)mySize, (float)mySize);
      fill(myColor);
  }
  
}
