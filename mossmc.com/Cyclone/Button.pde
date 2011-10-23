class Button extends Widget{ //Vlad Code
  String label;
  color widgetColor, labelColor;
  boolean strokeColor;
 
  int event;
  
  
  Button(int x,int y, int width, int height,String label, color w_color, int event){ // Constructor to the button,
    
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.widgetColor = w_color;
    this.labelColor = 0;
    this.event=event;
  }
  void drawButton(int fontcol,PFont widgetFont){ // draw our button with text and colour
    
    fill(0,fontcol);
    textFont(widgetFont);
    text(label, x + 5, y + height - 10);
  }
  
  int check(int mX, int mY){ // method for if a user clicks a button to return the event int
   if(mX > x && mX < x + width && mY > y && mY < y + height){
     // println(event);
     return event;  
    }else{
      return 0;
    }
  }
}
