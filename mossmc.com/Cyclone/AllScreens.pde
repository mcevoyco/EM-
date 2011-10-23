class AllScreens{
 
 int xCord;
 int yCord;
 PImage calenderimage=loadImage("screen5.jpg");
 PImage mostplayedimage=loadImage("screen8.jpg");
 PImage searchimage=loadImage("screen1.jpg");
 PImage creditsimage=loadImage("mainmenu.jpg");
 PImage mainimage =loadImage("screen7.jpg");
 int changer = 0;
  

  MainScreen mainScreen=new MainScreen(); // Declare all our types of screens
  
  Screen screen0=new SplashScreen();
  Screen screen1=new CalenderScreen(changer);
  Screen screen2=new MostPlayedScreen();
  Screen screen3=new SearchScreen();

  Screen screen5=new CreditsScreen();
  Screen activeScreen=screen0;
  

   
  
  
  
  
  
  
  public void screendraw(int mouseX, int mouseY){
  // activeScreen.draw();
  this.xCord=mouseX;
  this.yCord=mouseY;
  
  // println("XCORD" +xCord);
   //println("YCORD" +yCord);

   activeScreen.draw(xCord,yCord); // draw only the active screen and pass parameters
   
  }
  void screenChanged(int x,int y ){ // Checker to check the widgets and if they are click then change to the relevant screen
    int event=activeScreen.getEvent(x,y);
  
        
     switch(event){
    case EVENT_BUTTON1:
      activeScreen = screen1;
      break;
    case EVENT_BUTTON2:
      activeScreen = screen2;
      break;
    case EVENT_BUTTON3:
      activeScreen = screen3;
      break;
    case EVENT_BUTTON5:
      activeScreen = screen5;
      break;
       case EVENT_BUTTON8:
      activeScreen = mainScreen;
      break;
    case EVENT_BUTTON7:
 
      if(activeScreen.infoCheck()==true){ // VLAD code
      //  activeScreen.printData(ArrayList al);
      println("hmm");

      }
      else{
        activeScreen.emptyQuery();
                                 println("but");

      }
  }
  }
  
//  void checkbackground(int x,int y){
//    
//    changer= screen4.backEvent(x,y);
//    println(""+changer);
//    
//  }
  
  void screenChanged2(int x,int y ){ // method to change screen by a toolbar button being clicked. 
   
    int toolevent=activeScreen.toolEvent(x,y);
    
    switch(toolevent){
    case ICONBUTTON0:
      activeScreen = mainScreen;
      break;
    case ICONBUTTON1:
      activeScreen = screen1;
      break;
    case ICONBUTTON2:
      activeScreen = screen2;
      break;
    case ICONBUTTON3:
      activeScreen = screen3;
      break;
    case ICONBUTTON5:
      activeScreen = screen5;
      break;
    }
  }
   void textSearchChoose(int mx,int my){
   screen2.getWhichTextWidget(mx,my);
   screen3.getWhichTextWidget(mx,my);
  }
  void textSearchType(char a){
    screen2.typedText(a);
    screen3.typedText(a);
  }
  
}
