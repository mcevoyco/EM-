

class CreditsScreen extends Screen{ // Same as Calender Screen, please see for understanding of code


  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage creditsimage;
  int xCordMouse;
  int yCordMouse;
  Toolbar tool;
  Boolean tooldrawn;
  PFont widgetFont;



  public CreditsScreen(){

    tool = new Toolbar();
    creditsimage=loadImage("mainmenu.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    textFont(stdFont);
    widgetFont = loadFont("Candara-BoldItalic-30.vlw");
    widgets.add(new Button(200, 390, 135, 40, "Jakob - Back End", color(250,0), EVENT_BUTTON1)); // Add Widgets to our Screen in the form of buttons
    widgets.add(new Button(200, 460, 145, 40, "Vlad - Back End & Front End", color(250,0), EVENT_BUTTON2));
    widgets.add(new Button(200, 530, 105, 40, "Conor - Front End ", color(250,0), EVENT_BUTTON3));
    widgets.add(new Button(200, 600, 120, 40, "Colm - Front End", color(250,0), EVENT_BUTTON4));
    widgets.add(new Button(200, 670, 105, 40, "Ray - Front End", color(250,0), EVENT_BUTTON5));
    
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
         creditsimage=loadImage("mainmenu.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON2 && mousePressed == true){
         creditsimage=loadImage("animal2.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON3 && mousePressed == true){
         creditsimage=loadImage("trinity2.jpg");
      }
    
      else{ res=0;}
      return res;
  }

  public int getEvent(int mX, int mY){ // Method for checking if widgets have been pressed.
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
    else if(buttonEvent ==4){
      res=EVENT_BUTTON4;
    }
    else if(buttonEvent ==5){
      res=EVENT_BUTTON5;
    }
    else if(buttonEvent==6){
      res=EVENT_BUTTON6;
    }
    else{ 
      res=0;
    }
    return res;
  }
  public boolean getActive(){
    return active;
  }
  void draw(int xCordMouse, int yCordMouse){
    background(creditsimage);
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
    text("Credits", 5,755);
  }
}



