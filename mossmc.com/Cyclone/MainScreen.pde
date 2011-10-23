class MainScreen extends Screen{ // Minor changes to other screen classes
  PImage mainmenu;
  int xCordMouse;
  int yCordMouse;
  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage mainmenuimage;
  Toolbar tool;
  PFont widgetFont;
  
  
  
  public MainScreen(){
    
    tool = new Toolbar();
    
    mainmenu=loadImage("screen7.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    widgetFont = loadFont("Candara-BoldItalic-30.vlw");
    textFont(stdFont);
    widgets.add(new Button(340, 80, 135, 40, "Calender", color(250,0), EVENT_BUTTON1)); // Add Widgets to our Screen in the form of buttons
    widgets.add(new Button(400, 210, 145, 40, "Most Played", color(250,0), EVENT_BUTTON2));
    widgets.add(new Button(450, 375, 105, 40, "Search ", color(250,0), EVENT_BUTTON3));
    widgets.add(new Button(420, 530, 105, 40, "Credits", color(250,0), EVENT_BUTTON5));
    
       widgets.add(new Button(10, 10, 30, 30, "1 ", color(250,0), CREDITS_BUTTON1));
   widgets.add(new Button(30, 10, 30, 30, "2 ", color(250,0), CREDITS_BUTTON2));
   widgets.add(new Button(50, 10, 30, 30, "3 ", color(250,0), CREDITS_BUTTON3));
    
  }
  
   public int toolEvent(int mX, int mY){
    int iconEvent;
    iconEvent = tool.iconEvent(mX,mY);
    
    return iconEvent;
    
  }
  
   public int backEvent(int mX, int mY){
    int buttonEvent=0;
    int res=0;
     for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
      }
      if(buttonEvent == CREDITS_BUTTON1 && mousePressed == true){
        mainmenu=loadImage("screen7.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON2 && mousePressed == true){
        mainmenu=loadImage("clouds.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON3 && mousePressed == true){
        mainmenu=loadImage("turtle.jpg");
      }
    
      else{ res=0;}
      return res;
  }
  
  public int getEvent(int mX, int mY){
    int buttonEvent=0;
    int res;
     for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
      }
      if(buttonEvent == EVENT_BUTTON1){
        res=EVENT_BUTTON1;
      }
      else if(buttonEvent == 2){
        res=EVENT_BUTTON2;
      }
      else if(buttonEvent == 3){
        res=EVENT_BUTTON3;
      }
      else if(buttonEvent ==5){
        res=EVENT_BUTTON5;
      }
      else if(buttonEvent==6){
        res=EVENT_BUTTON6;
      }
      else{ res=0;}
      return res;
  }
  public boolean getActive(){
    return active;
  }
  void draw(int xcord, int ycord){
    background(mainmenu);
    backEvent(xcord,ycord);
 
    for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255,widgetFont);
    }

    strokeWeight(2);
    fill(255, 20);
    stroke(0,70);
    ellipse(-150, 400, 1100, 1100);
    
    fill(255,225);
    textFont(backfont);
    text("Cyclone", 1075,50);
    
    fill(255,225);
    textFont(stdFont);
    text("RC", 10,750);
    
    
   
  }
}

