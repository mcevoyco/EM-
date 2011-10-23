class Screen extends Widget{ // Defines a basic screen including widgets, buttons and text entry boxes
 ArrayList widgets=new ArrayList();
 
 PImage ScreenColor;
 
 PFont widgetFont = loadFont("Candara-BoldItalic-30.vlw");
   
   
 public void addWidget(Widget widget){
  widgets.add(widget); 
 }
 public void addButton(Button button){
  widgets.add(button);
 }
 

 

 
 public void draw(int xcord, int ycord) {
   
  for (int i = 0; i < widgets.size(); ++i) {
   Widget widget = (Widget)widgets.get(i);
    widget.draw();
    }
  }
  public int getEvent(int mx,int my){
    return 0;
  
  }
  
   public int toolEvent(int mX, int mY){
   return 0;
  }
  public void getWhichTextWidget(int mx,int my) {
    }
  public void typedText(char a){
    }
  boolean infoCheck(){
    return false;
  }
  public void printData(ArrayList al){
  }
  public void emptyQuery(){
  }
}



