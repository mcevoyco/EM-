
class SearchScreen extends Screen{ // Ill let Vlad Comment this one :D
  
  String state;
  PFont backfont;
  PFont stdFont;
  boolean active=false;
  PImage searchimage;
  int xCordMouse;
  int yCordMouse;
  Toolbar tool;
  Boolean tooldrawn;
  ArrayList textWidgets=new ArrayList();
  PFont textWidgetFont=loadFont("Verdana-12.vlw");
  EntryWidget focus=null;
  String Artist=null;
  String Album=null;
  String[] toSend=new String[4];
   int xpos = 40;
   int ypos = 900;
   int swidth = 920;
   int sheight = 600;
   ArrayList input=new ArrayList();
   List list1;
   boolean correctQuery=true;
  
  public SearchScreen(){
     for(int i = 0; i < 50; i++) {
      String[] asd = new String[2];
      asd[0] = "track" + i;
      asd[1] = "asdasdas" + i;
      input.add(asd);
    }
    list1=new List(50,100,920,600,input);
    
    tool = new Toolbar();
    searchimage=loadImage("screen1.jpg");
    backfont = loadFont("Jokerman-Regular-s48.vlw");
    stdFont = loadFont("Aharoni-Bold-20.vlw");
    textFont(stdFont);
    EntryWidget textWidget1=new EntryWidget(1000,100,200,20,"",color(255),textWidgetFont,ENTRY_WIDGET1,125);
    EntryWidget textWidget2=new EntryWidget(1000,170,200,20,"",color(255),textWidgetFont,ENTRY_WIDGET2,125);
    EntryWidget textWidget3=new EntryWidget(1000,240,200,20,"",color(255),textWidgetFont,ENTRY_WIDGET3,125);
    EntryWidget textWidget4=new EntryWidget(1000,310,200,20,"",color(255),textWidgetFont,ENTRY_WIDGET4,125);
//    EntryWidget textWidget5=new EntryWidget(1000,380,200,20,"",color(255),textWidgetFont,ENTRY_WIDGET5,125);
    widgets.add(new Button(1000, 500, 105, 40, "Search", color(250,0), EVENT_BUTTON7));
    textWidgets.add(textWidget1);
    textWidgets.add(textWidget2);
    textWidgets.add(textWidget3);
    textWidgets.add(textWidget4);
//    textWidgets.add(textWidget5); 

 widgets.add(new Button(10, 10, 30, 30, "1 ", color(250,0), CREDITS_BUTTON1));
   widgets.add(new Button(30, 10, 30, 30, "2 ", color(250,0), CREDITS_BUTTON2));
   widgets.add(new Button(50, 10, 30, 30, "3 ", color(250,0), CREDITS_BUTTON3));
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
 
 public int backEvent(int mX, int mY){
    int buttonEvent=0;
    int res=0;
     for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
      }
      if(buttonEvent == CREDITS_BUTTON1 && mousePressed == true){
        searchimage=loadImage("screen1.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON2 && mousePressed == true){
       searchimage=loadImage("animal4.jpg");
      }
      else if(buttonEvent == CREDITS_BUTTON3 && mousePressed == true){
       searchimage=loadImage("trinity4.jpg");
      }
    
      else{ res=0;}
      return res;
  }
  public void typedText(char a){
     if(a!=CODED){
     if(focus!=null){
      focus.append(a);
    }
   } 
 /* if(a==ENTER){
    switch(focus.getEvent()){
      case ENTRY_WIDGET1:
        Artist=focus.getLabel();
        break;
       case ENTRY_WIDGET2:
         Album=focus.getLabel();
         break;
    }
      for(int i=0;i<textWidgets.size();i++){
        EntryWidget singleWidget=(EntryWidget)textWidgets.get(i);
        singleWidget.setLabel("Click here");
        singleWidget.draw();
      }
    }*/
  }
  boolean infoCheck(){
    if(toSend==null){
      if(toSend[0].length()!=0&&toSend[1].length()!=0&&toSend[2].length()!=0&&toSend[3].length()!=0){
        return true;}
      else return false;
  }
  else return false;
  }
  public void addLabels(){
    textFont(textWidgetFont);
    text("User",1000,90);
    text("TrackName",1000,160);
    text("Artist",1000,230);
    text("TrackName",1000,300);
  }
   public int toolEvent(int mX, int mY){
     int iconEvent;
     iconEvent = tool.iconEvent(mX,mY);
     return iconEvent;
    
  }
  public void printData(ArrayList al){
    }
  public void emptyQuery(){
    correctQuery=false;

  
  }
  
   public int getEvent(int mX, int mY){
    int buttonEvent=0;
    int res;
    for(int i = 0; i < widgets.size(); i++){
      Button singleButton = (Button) widgets.get(i);
      buttonEvent = singleButton.check(mX, mY);
      if(buttonEvent!=0) break;
      }
      if(buttonEvent == EVENT_BUTTON7){
        res=EVENT_BUTTON7;
      for(int i=0;i<textWidgets.size();i++){
        EntryWidget entry = (EntryWidget)textWidgets.get(i);
        toSend[i]=entry.getLabel();
        if(toSend[i]==""){
          toSend[i]=null;
        }
        println(toSend[i]);
       }
       correctQuery=true;
      }   
      else{ res=0;}
      return res;
  }
 //public String[] getToSend(){
 //   return  toSend;
 // }
  public boolean getActive(){
    return active;
  }
  void draw(int xCordMouse, int yCordMouse){

    background(searchimage);
    backEvent(xCordMouse,yCordMouse);
    addLabels();
     if(correctQuery==false){
      fill(255);
      text("Wrong Query",100,100);
    }
    tooldrawn=tool.toolbardrawn(xCordMouse,yCordMouse);
    if(tooldrawn==true){
    tool.draw(xCordMouse,yCordMouse);
    }
    fill(102);
    rect(1000, 500, 105, 40);
    for (int i = 0; i < widgets.size(); ++i) {
      Button button = (Button)widgets.get(i);
      button.drawButton(255,textWidgetFont);
    }
    
    
    for (int i = 0; i < textWidgets.size(); ++i) {
      EntryWidget entry = (EntryWidget)textWidgets.get(i);
      entry.draw();
    }
    list1.draw();
    fill(255,225);
    textFont(backfont);
    text("Cyclone", 1075,50);
    
    textFont(stdFont);
    text("v0.3", 5,10);
    
    textFont(stdFont);
    text("Search", 5,755);
  }
}

