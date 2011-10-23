
class ListItem {
  String[] strings;
}

class List extends Widget{
  ArrayList dataOutput=new ArrayList();
  ScrollBar scrollBar;
    int scrolly = 0;
  int scrollheight = 0;

  public List(int sx,int sy,int sw,int sh,ArrayList in){
    scrollBar=new ScrollBar(sx+sw, sy, 20, sh, 3*5+1);
    dataOutput=in;
    x = sx;
    y = sy;
    width = sw;
    height = sh;

  }
  public void draw() {
    fill(255,100);
    rect(x,y,width,height);
    int ypos = 0;
    int rowheight = 20;
    int rowwidth = width - 20;
    fill(0);
    if(dataOutput.size()!=0){
      int i0 = (int)(((float)scrollBar.scrolly-99)/ height * dataOutput.size());
      for(int i = i0; i < dataOutput.size(); i++) {
        int xpos = 0;
        String[] s = (String[])dataOutput.get(i);
        for(int j = 0; j < s.length; j++){
          text(s[j], x + xpos, y + ypos + 10);
          xpos += rowwidth / s.length;
        } 
        ypos += rowheight;
        if(ypos + rowheight > height) break;
      }
      scrollheight = height * height / (dataOutput.size() * rowheight);

      if (scrollheight > height) scrollheight = height;
      scrollBar.scrollheight = scrollheight;
      scrollBar.update();
    }
    scrollBar.display();
  }

}

