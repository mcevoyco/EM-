


class ScrollBar
{
  int swidth, sheight;    // width and height of bar
  int xpos, ypos;         // x and y position of bar
  float spos, newspos;    // y position of slider
  int sposMin, sposMax;   // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;
  int scrollheight;
  float scrolly;

  ScrollBar (int xp, int yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    xpos = xp;
    ypos = yp;
    spos = ypos;
    newspos = spos;
    sposMin = ypos;
    loose = l;
    ratio=spos/sposMax;
    scrolly = ypos;
  }

  void update() {
    sposMax = ypos + sheight - scrollheight;
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = constrain(mouseY, sposMin, sposMax);
    }
    if(abs(newspos - scrolly) > 1) {
      scrolly = scrolly + (newspos-scrolly)/loose;
    }
  }

  int constrain(int val, int minv, int maxv) {
    return min(max(val, minv), maxv);
  }

  boolean over() {
    if(mouseX > xpos && mouseX < xpos+swidth &&
    mouseY > scrolly && mouseY < scrolly+scrollheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(255);
    rect(xpos, ypos, swidth, sheight);
    if(over || locked) {
      fill(153, 102, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(xpos, scrolly, swidth, scrollheight);
  }

}
