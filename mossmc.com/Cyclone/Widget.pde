//This class contains parameters of simple widget
class Widget{
  int x,y,width,height;
  void draw(){

  } 
  public int getX() {
    return x;  
  }
  
  public void setX(int x) {
    this.x = x;
  }
  
  public int getY() {
    return y;  
  }
  
  public void setY(int y) {
    this.y = y;
  }
  
  public int getHeight() {
    return height;  
  }
    
  public int getWidth() {
    return width;  
  }
  
  public void setHeight(int height) {
    this.height = height;
  }
  
  public void setWidth(int width) {
    this.width = width;
  }
  boolean mouseOver(int mX, int mY) {     
   if(mX > x && mX < x+width && mY > y && mY < y+height){   
    return true;        
   }else{
    return false;
   }
 }
}
 
