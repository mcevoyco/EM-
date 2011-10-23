  AllScreens allS; // Our AllScreen object to handle the Screens, Date, time, font. 
  Date thedate; //
  Time thetime;
  PFont timefont;
  
  
void setup(){ 
  allS= new AllScreens(); // Set everything up
  noStroke();
  size(1280, 768);
  thedate = new Date(day(),month(),year()); // Pass second,minute, hour as parameters to the Date class
  thetime = new Time();
  timefont = loadFont("Verdana-Bold-18.vlw");
  
  
}

void draw(){
  background(0);
  allS.screendraw(mouseX,mouseY);  // Draw our screens, pass mouseX, Mouse Y for methods contained in screen and widget checking and user interacton.
  thedate.draw(); 
  thetime.draw(hour(),minute(),second());

}
void mousePressed(){
  allS.textSearchChoose(mouseX,mouseY);
  
  allS.screenChanged(mouseX,mouseY); // Call a method that check if a user changed screens by widget button
  allS.screenChanged2(mouseX,mouseY);// Method to check if screens changed by toolbar
 

}
void keyPressed(){
  allS.textSearchType(key);

}
