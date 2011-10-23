

class Toolbar extends Screen{

  ArrayList barwidgets;
  boolean toolboolean;
  int Xmouse;
  int Ymouse;
  boolean drawn;
   PImage icon1;
  PImage icon2;
  PImage icon3;
   PImage icon4;
  PImage icon5;
  PImage icon6;
  int Xcord=460;
  int Ycord=800;
  
  
  Toolbar(){

    barwidgets = new ArrayList();
    
    icon1 = loadImage("Home.png");
    icon2 = loadImage("Calendar.png");
    icon3 = loadImage("Favorites.png");
    icon4 = loadImage("Search.png");
   
    icon6 = loadImage("User.png");
    
    barwidgets.add(new BarWidget(475,710,icon1, ICONBUTTON0));
    barwidgets.add(new BarWidget(525,710,icon2, ICONBUTTON1));
    barwidgets.add(new BarWidget(575,710,icon3, ICONBUTTON2));
     
    barwidgets.add(new BarWidget(625,710,icon4, ICONBUTTON3));
//    barwidgets.add(new BarWidget(675,710,icon5, ICONBUTTON4));
    barwidgets.add(new BarWidget(675,710,icon6, ICONBUTTON5));
  }
  
  void addbarwidget(int x, int y, PImage icon, int event){
    barwidgets.add(new BarWidget(x, y, icon, event));
  }
  
  boolean toolbardrawn(int Xcheck, int Ycheck){
    
    if((Xcheck>=450 && Xcheck<=740)&&(Ycheck>=695 && Ycheck <=760)){
      return true;
      
    }
    else{
      Ycord = 800;
      return false;
    
  }
  }


  void draw(int mX, int mY){
    this.Xmouse=mX;
    this.Ymouse=mY;
    

    fill(255, 30);
    stroke(20,100);
    strokeWeight(5);
    strokeJoin(ROUND);
    rect(Xcord,Ycord,270,60);

    
    for(int i = 0; i < barwidgets.size(); i++){
     
    
      BarWidget toolWidget = (BarWidget) barwidgets.get(i);
      
      toolboolean = toolWidget.checkmouse(mX, mY);
     
       if(Ycord > 700){
        Ycord--;
        }
        

       if(toolboolean==true){
        tint(255);
        
      
     if(Ycord == 700){
        toolWidget.draw();
     }
      }
      else{
          if(Ycord == 700){ 
        tint(255,100);
        toolWidget.draw();
          }
        
      }
    }
    
  }
  
  
  
  
  public int iconEvent(int mX, int mY){
    int iconEvent=0;
    int res;
     for(int i = 0; i < barwidgets.size(); i++){
      BarWidget singleicon = (BarWidget) barwidgets.get(i);
      iconEvent = singleicon.iconcheck(mX, mY);
      if(iconEvent!=0) break;
      }
      if(iconEvent == ICONBUTTON1){
        res=ICONBUTTON1;
      }
      else if(iconEvent == ICONBUTTON2){
        res=ICONBUTTON2;
      }
      else if(iconEvent == ICONBUTTON3){
        res=ICONBUTTON3;
      }
      else if(iconEvent ==ICONBUTTON4){
        res=ICONBUTTON4;
      }
      else if(iconEvent ==ICONBUTTON5){
        res=ICONBUTTON5;
      }
      else if(iconEvent==ICONBUTTON6){
        res=ICONBUTTON6;
      }
      else if(iconEvent == ICONBUTTON0){
        res=ICONBUTTON0;
      }
      else{ res=0;}
      return res;
  }
}

















