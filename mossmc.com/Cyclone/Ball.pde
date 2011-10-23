

class Ball { //Conor Code
float x; // X position
float y;//  Y position
float dx; // Velosities
float dy;
float csize;
String ballstring;
int ballfill;
String nameball;
int MMMX;
int MMMY;

int color1;
int color2;
int color3;



Ball (float ballsize,String name){

color1=int(random(0,255)); // Random colour ball
color2=int(random(0,255));
color3=int(random(0,255));




this.csize=ballsize; // Get the ball name
this.nameball=name;
x = random(SCREENX/4, SCREENX/2);
y = random(SCREENY/4, SCREENY/2);// Random ball position on the screen
dx= random(1, 5); // Random velosity. 
dy= random(1, 5);



}
void drawBall(int fillball){
  

if(mousePressed==true && checkball(MMMX,MMMY)){  // If the user has pressed the mouse and if the mouse was clicked inside the ball, make the ball white 
  
 fill(255,255,255,75);
stroke(0);
strokeWeight(2);
smooth();
ellipse(int(x), int(y), csize, csize);
   
}
else{
  
fill(color1,color2,color3,150); // else let the ball be a random colour 
stroke(0);
strokeWeight(2);
smooth();
ellipse(int(x), int(y), csize, csize);
}


}
float getX(){
  
return x;

}

float getY(){
  
return y;

}


void reset(){ // if the user presses the 'R' key then there is no velosity and all the balls will stop dead
  if(keyPressed){
    if (key == 'r' || key == 'R') {
    
dx = 0;
dy = 0;
  }
  if (key == 's' || key == 'S') { // Hit the S key and the balls will move again
    
dx= dx+1;
dy=dy+1;
  }
  
  
  }

}

void update(){ // Update the balls to let them move
  
x = x+dx;
y = y+dy;

}



void update2(int xcord, int ycord){ // allows us to throw the balls relevant to the mouse direction and distance. 
  
  if (mousePressed) { 
    //orb.x = mouseX; 
    //orb.y = mouseY; 
    dx = (xcord-x)/2; 
    dy = (ycord-y)/2; 
  }
  } 

  



void collide(Ball other){ // Code to make the balls hit off the edges of screen...needs to be finished..
// hits right or left wall
if(x+csize/2>=SCREENX || x<=csize/2){
dx=-dx;
}
// hits upper wall
if(y+csize/2>=SCREENY || y<=csize/2){
dy=-dy;
}
}


boolean checkball(int mX, int mY) {     // check if the mouse is inside the ball
  this.MMMX=mX;
  this.MMMY=mY;
   if(mX > x-20 && mX < x+csize && mY > y-20 && mY < y+csize){   
    return true;        
   }else{
    return false;
   }
 }

 
 void ballname(){ // return the string assigned to the ball. 
   
 fill(0);
text(nameball, x-20, y-30);
  
 }


}
