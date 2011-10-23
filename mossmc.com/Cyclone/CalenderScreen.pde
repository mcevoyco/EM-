

class CalenderScreen extends Screen{ 


  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage calenderimage;
  Boolean tooldrawn;
  Toolbar tool; // Toolbar object
  int changer;
  



  int xCordMouse;
  int yCordMouse;

  public CalenderScreen(int change){
    this.changer = change;


    calenderimage=loadImage("screen5.jpg");


  




    //   back =loadImage("screen5.jpg"); // Background image, fonts, initialise toolbar
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    textFont(stdFont);
   widgetFont = loadFont("Candara-BoldItalic-30.vlw");
   widgets.add(new Button(10, 10, 30, 30, "1 ", color(250,0), CREDITS_BUTTON1));
   widgets.add(new Button(30, 10, 30, 30, "2 ", color(250,0), CREDITS_BUTTON2));
   widgets.add(new Button(50, 10, 30, 30, "3 ", color(250,0), CREDITS_BUTTON3));
    tool = new Toolbar();
 
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
        calenderimage=loadImage("screen5.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON2 && mousePressed == true){
        calenderimage=loadImage("animal1.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON3 && mousePressed == true){
        calenderimage=loadImage("trinity1.jpg");
      }
    
      else{ res=0;}
      return res;
  }





  public int toolEvent(int mX, int mY){ // method to check if a toolbar icon has been pressed
    int iconEvent;
    iconEvent = tool.iconEvent(mX,mY);

    return iconEvent;

  }
  public boolean getActive(){
    return active;
  }
  void draw(int xCordMouse, int yCordMouse){ // draw our screen with our background image, array of our added widgets, toolbar and text.

    background(calenderimage);
  backEvent(xCordMouse,yCordMouse);
    tooldrawn=tool.toolbardrawn(xCordMouse,yCordMouse);
    if(tooldrawn==true){
      tool.draw(xCordMouse,yCordMouse);
    }
    
     for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255,widgetFont);
    }

    fill(255,225);
    textFont(backfont);
    text("Cyclone", 1075,50);

    textFont(stdFont);
    text("Calender", 5,755);
  }
}


