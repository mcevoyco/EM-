class EntryWidget extends Widget{ // Vlad Code
  int maxlen;
  String label;
  int event;
  color widgetColor,labelColor;
  PFont widgetFont;
  EntryWidget(int in_x,int in_y, int in_width, int in_height, String in_label, color in_color, PFont in_font, int in_event, int in_max){
    x=in_x;
    y=in_y;
    width = in_width;
    height= in_height;
    label=in_label;
    event=in_event;
    widgetColor=in_color;
    widgetFont=in_font;
    labelColor=0;
    maxlen=in_max;
  }
  void draw(){
    textFont(widgetFont);
    fill(widgetColor,50);
    rect(x,y,width+10,height+10);
    fill(labelColor,150);
    text(label, x+5, y+height-5);
  }

  int check(int mX, int mY){
  if(mX>x && mX< x+width&& mY>y && mY<y+height){
    return event;
  }
    return 0;
  }
  void append(char s){
    if(s==BACKSPACE){
      if(!label.equals(""))
        label=label.substring(0,label.length()-1);
        //Remove 1 character from the label for each backspace
       } else if (label.length() <maxlen){
           label=label+str(s);
         //Add to label the character
       }
  }
  String getLabel(){
    return label;
  }
  void setLabel(String label){
    this.label= label;
    }
  int getEvent(){
    return event;
   } 
}
