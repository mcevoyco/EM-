




class SplashScreen extends Screen{ 
 
  
  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage splashimage;
  PImage splashimage2;
  Boolean tooldrawn;
  Toolbar tool; // Toolbar object
  boolean checkbg =false;
  int xCord;
  int yCord;
  PFont splashFont;
 
  
  
  int xCordMouse;
  int yCordMouse;
  
  public SplashScreen(){
    
   
    splashimage=loadImage("cycloneloading.jpg"); // Background image, fonts, initialise toolbar
    splashimage2=loadImage("cyclonemain.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
     
    textFont(stdFont);
    widgets.add(new Button(550, 500, 135, 40, "Start", color(250,0), EVENT_BUTTON8));
    splashFont = createFont("Bleeding_Cowboys.ttf", 40);
    
     tool = new Toolbar();
     
} 


    

  
  public int toolEvent(int mX, int mY){ // method to check if a toolbar icon has been pressed
    int iconEvent;
    iconEvent = tool.iconEvent(mX,mY);
    
    return iconEvent;
    
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
      else if(buttonEvent ==4){
        res=EVENT_BUTTON4;
      }
      else if(buttonEvent ==5){
        res=EVENT_BUTTON5;
      }
      else if(buttonEvent==6){
        res=EVENT_BUTTON6;
      }
      else if(buttonEvent==7){
        res=EVENT_BUTTON7;
      }
       else if(buttonEvent==8){
        res=EVENT_BUTTON8;
      }
      else{ res=0;}
      return res;
  }
  public boolean getActive(){
    return active;
  }
  
  
  
  
  void draw(int xCordMouse, int yCordMouse){ // draw our screen with our background image, array of our added widgets, toolbar and text.
  this.xCord = xCordMouse;
  this.yCord = yCordMouse;
    if(checkbg==false){
   background(splashimage);
   delay(1000);
   checkbg=true;
    }
    
    if(checkbg=true){
      background(splashimage2);
      
    
     for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255,splashFont);
    }
    }
  
   
   
    
    
  
    
//    textFont(stdFont);
//    text("v0.3", 5,10);
//    
//    textFont(stdFont);
//    text("Calender", 5,755);
  }
}

