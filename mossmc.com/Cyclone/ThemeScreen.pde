


class ThemeScreen extends Screen{ // Same as many screens
  
  
  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage themeimage;
  int xCordMouse;
  int yCordMouse;
  Toolbar tool;
  Boolean tooldrawn;
  PFont widgetFont;
  
  
  public ThemeScreen(){
  
     widgetFont = loadFont("Aharoni-Bold-30.vlw");
    tool = new Toolbar();
    themeimage=loadImage("screen6.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    textFont(stdFont); 
    
    widgets.add(new Button(450, 375, 105, 40, "Theme1 ", color(250,0), CREDITS_BUTTON1));
    widgets.add(new Button(430, 530, 120, 40, "Theme2", color(250,0), CREDITS_BUTTON2));
    widgets.add(new Button(370, 670, 105, 40, "Theme3", color(250,0), CREDITS_BUTTON3));
  
     
  }
  
  public int backEvent(int mX, int mY){
    int buttonEvent=0;
    int res;
     for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
      }
      if(buttonEvent == CREDITS_BUTTON1){
        res=EVENT_BUTTON1;
      }
      else if(buttonEvent == CREDITS_BUTTON2){
        res=EVENT_BUTTON2;
      }
      else if(buttonEvent == CREDITS_BUTTON3){
        res=EVENT_BUTTON3;
      }
      
      else{ res=0;}
      return res;
  }
  
   public int toolEvent(int mX, int mY){
    int iconEvent;
    iconEvent = tool.iconEvent(mX,mY);
    
    return iconEvent;
    
  }
  
   
  public boolean getActive(){
    return active;
  }
  void draw(int xCordMouse, int yCordMouse){
    background(themeimage);
   tooldrawn=tool.toolbardrawn(xCordMouse,yCordMouse);
    if(tooldrawn==true){
    tool.draw(xCordMouse,yCordMouse);
    }
    for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255, widgetFont);
    }
    
    
    fill(255,225);
    textFont(backfont);
    text("Cyclone", 1075,50);
    
    
    textFont(stdFont);
    fill(0, 150);
    text("Theme", 5,755);
  }
}

