import java.text.SimpleDateFormat;
import java.util.Date;


class MostPlayedScreen extends Screen{ //Bit different to other screens, see comments



  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage playedimage;
  int xCordMouse;
  int yCordMouse;
  Toolbar tool;
  Boolean tooldrawn;
  int ballsize =25;
  int mouseclickx;
  int mouseclicky;
  Boolean checkball;
  Boolean checkclick;
  ArrayList multiball; // Array of balls
  int ballnumber=0;
  float randomsize;
  ArrayList textWidgets=new ArrayList();
  PFont textWidgetFont=loadFont("Verdana-12.vlw");
  EntryWidget focus=null;
  String Artist=null;
  String Album=null;
  PFont widgetFont;
  String day1;
  String day2;
  String month1;
  String month2;
  String year1;
  String year2;
  Tuple[] tracks = {new Tuple("Track1",1), new Tuple("Track2",2)};



  public MostPlayedScreen(){
//    this.tracks = {
    multiball=new ArrayList();
    widgetFont = loadFont("Candara-BoldItalic-30.vlw");
    EntryWidget textWidget1=new EntryWidget(1000,200,40,30,"",color(255),textWidgetFont,ENTRY_WIDGET1,125);
    EntryWidget textWidget2=new EntryWidget(1075,200,60,30,"",color(255),textWidgetFont,ENTRY_WIDGET2,125);
    EntryWidget textWidget3=new EntryWidget(1175,200,50,30,"",color(255),textWidgetFont,ENTRY_WIDGET3,125);
     EntryWidget textWidget4=new EntryWidget(1000,300,40,30,"",color(255),textWidgetFont,ENTRY_WIDGET4,125);
      EntryWidget textWidget5=new EntryWidget(1075,300,60,30,"",color(255),textWidgetFont,ENTRY_WIDGET5,125);
      EntryWidget textWidget6=new EntryWidget(1175,300,50,30,"",color(255),textWidgetFont,ENTRY_WIDGET6,125);
    widgets.add(new Button(1060, 360, 105, 40, "Search", color(250,0), EVENT_BUTTON7));
    textWidgets.add(textWidget1);
    textWidgets.add(textWidget2);
    textWidgets.add(textWidget3); 
    textWidgets.add(textWidget4); 
    textWidgets.add(textWidget5); 
    textWidgets.add(textWidget6); 
    
    widgets.add(new Button(10, 10, 30, 30, "1 ", color(250,0), CREDITS_BUTTON1));
   widgets.add(new Button(30, 10, 30, 30, "2 ", color(250,0), CREDITS_BUTTON2));
   widgets.add(new Button(50, 10, 30, 30, "3 ", color(250,0), CREDITS_BUTTON3));
    
      
   
     // Balls are an arraylist


    




    tool = new Toolbar();
    //    polar= new PolarClock();
    //     polar.polarsetup();
    playedimage=loadImage("screen8.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    textFont(stdFont);
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
        playedimage=loadImage("screen8.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON2 && mousePressed == true){
        playedimage=loadImage("animal3.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON3 && mousePressed == true){
        playedimage=loadImage("trinity3.jpg");
      }
    
      else{ res=0;}
      return res;
  }

  public void getWhichTextWidget(int mx,int my) {
    int event;
    for(int i=0;i<textWidgets.size();i++){
      EntryWidget singleWidget=(EntryWidget)textWidgets.get(i);
      event=singleWidget.check(mx,my);
      if(event!=0){
        singleWidget.setLabel("");
        focus=singleWidget;
        break;
      }
      else{
        focus=null;
      }
    }
  }

  public void typedText(char a){
    if(a!=CODED){
      if(focus!=null){
        focus.append(a);
      }
    }
  } 

//  boolean infoCheck(){
//    if(Artist.length()!=0||Track.length()!=0){
//      println("da"+Track+"ewe"+Artist);
//      return true;
//    }
//    else return false;
//  }
  public void addLabels(){
    textFont(textWidgetFont);
    strokeWeight(2);
    text("To",1000,285);
    text("From",1000,185);
  }

  public void printData(ArrayList al){
  }
  public void emptyQuery(){
    fill(255);
    text("Go",100,100);

  }

  public int getEvent(int mX, int mY){
    String Track;
    int buttonEvent=0;
    int res;
    for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
    }
    if(buttonEvent == EVENT_BUTTON7){
      multiball=new ArrayList();
      res=EVENT_BUTTON7;
      EntryWidget entry = (EntryWidget)textWidgets.get(0);
      day1=entry.getLabel();
      entry = (EntryWidget)textWidgets.get(1);
      month1=entry.getLabel();   
      entry = (EntryWidget)textWidgets.get(2);
      year1=entry.getLabel(); 
      entry = (EntryWidget)textWidgets.get(3);
      day2=entry.getLabel(); 
      entry = (EntryWidget)textWidgets.get(4);
      month2=entry.getLabel(); 
      entry = (EntryWidget)textWidgets.get(5);
      year2=entry.getLabel(); 
      
      String Date1;
      String Date2;
      
      Date1 = ""+day1+" "+month1+" "+year1;
      Date2 = ""+day2+" "+month2+" "+year2;
      
      

//      tracks = getPopularTracks((int)((new SimpleDateFormat("d MMM yyyy")).parse(Date1)).getTime()/1000 , (int)((new SimpleDateFormat("d MMM yyyy")).parse(Date2)).getTime()/1000);


      println(Date1);
      println(Date2);
//       tracks = getPopularity(Track);
  
   for(int i=0; i<tracks.length;i++){ // for each ball we add makei t random in size and send the ball number string as parameter, increment each time a ball is added. 
      randomsize = random(30,70); 
      ballnumber= ballnumber+1;

      multiball.add(new Ball(randomsize,tracks[i].getString()));    
    }
    }

    else{ 
      res=0;
    }
    return res;
  }
  public boolean getActive(){
    return active;
  }

  public int toolEvent(int mXX, int mYY){
    int iconEvent;
    this.mouseclickx=mXX;
    this.mouseclicky=mYY;
    iconEvent = tool.iconEvent(mXX,mYY);

    return iconEvent;

  }

  void draw(int xCordMouse, int yCordMouse){


    background(playedimage);

    addLabels();
    backEvent(xCordMouse,yCordMouse);
    

    for (int i = 0; i < textWidgets.size(); ++i) {
      EntryWidget entry = (EntryWidget)textWidgets.get(i);
      entry.draw();
    }

    for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255,widgetFont);
    }


    for(int i=0; i<multiball.size();i++){ // Draw and call methods of each of our balls. 
      Ball currentBall = (Ball) multiball.get(i);


      checkball= currentBall.checkball( xCordMouse, yCordMouse);
      if(checkball==true && mousePressed == true){ // if the mouse is over the ball and the user pressed the mouse, draw and update the ball as white when selected
        currentBall.update2(xCordMouse, yCordMouse);
        currentBall.collide(currentBall);
        currentBall.drawBall(0);
        currentBall.ballname();
        currentBall.reset();



      }

      else{
        currentBall.update();
        currentBall.collide(currentBall);
        currentBall.drawBall(255);
        currentBall.reset();

      }
    }


    //    checkball= theball.checkball( xCordMouse, yCordMouse);
    //    if(checkball==true && mousePressed == true){
    //    theball.update2(xCordMouse, yCordMouse);
    //    theball.collide();
    //    theball.drawBall(255);
    //    theball.ballname();
    //   
    //  }
    //    
    //    else{
    //       theball.update();
    //    theball.collide();
    //    theball.drawBall(0);
    //    }



    tooldrawn=tool.toolbardrawn(xCordMouse,yCordMouse);
    if(tooldrawn==true){
      tool.draw(xCordMouse,yCordMouse);
    }



    fill(255,225);
    textFont(backfont);
    text("Cyclone", 1075,50);

    textFont(stdFont);
    fill(0, 150);
    text("Most Played", 5,755);
  }
}

class Tuple {

  public String string;
  public int integer;


  Tuple(String _string, int _integer){

    this.string = _string;
    this.integer = _integer;

  }

  public String getString(){

    return this.string;	
  }


  public int getInt(){

    return this.integer;
  }

}



