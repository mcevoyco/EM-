

class Time { //Conor Code
  // A class to sort our time and update and display properly on the screen
	private int seconds;
        private int minutes;
        private int hours;
        PFont datefont;
        
       
	
	
	public Time(){

          datefont = loadFont("Verdana-16.vlw");
	}

      void draw(int HOURS, int MINUTES, int SECONDS){
        
              this.hours=HOURS;
	      this.minutes=MINUTES;
	      this.seconds=SECONDS;
        
        if(minute()>10 && second()>9){
  textFont(timefont);
  fill(255,225);
 text(""+hours +":"+minutes+":"+seconds, 1180,730);
}
else

if(minute()<10 && second()<10){
  textFont(timefont);
   fill(255,225);
 text(""+hours +":"+"0"+minutes+":"+ "0"+seconds, 1180,730);
}
else
if(minute()<10){
  textFont(timefont);
   fill(255, 225);
 text(""+hours +":"+"0"+minutes+":"+seconds, 1180,730);
}
else
if(second()<10){
  textFont(timefont);
   fill(255, 225);
 text(""+hours +":"+minutes+":"+ "0"+seconds, 1180,730);
}
        
        
      }
}
