


class BarWidget{ //Conor Code
  int x, y;
  int event;
  boolean strokeColor;
  PImage icon;
  int width=40;
  int height=40;
  
  
  BarWidget(int x, int y, PImage ICON, int event){ // Our  toolbar icons have a position, a picture and an event value. 
    
    this.x = x;
    this.y = y;
    this.event = event;
    this.icon = ICON;
   
  }
  
  void draw(){ // draw our icon

    image(icon, x, y);
  }
  
  
   boolean checkmouse(int mX, int mY){ // check if the mouse is over the icon
    
  if(mX > x && mX < x+width && mY > y && mY < y+height){
        
    return true;        
     }else{
     return false;
     }
  }
  
  int iconcheck(int mX, int mY){ // if the mouse is over the icon then return the event int assigned to that icon
    if(mX > x && mX < x + width && mY > y && mY < y + height){
     // println(event);
      return event;
      
    }else{
      return 0;
    }
  }
}
  

