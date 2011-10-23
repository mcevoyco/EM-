



   class Date { // Conor code
	private int dayy;
        private int monthh;
        private int yearr;
        PFont datefont;
        
       
	
	
	public Date(int DAY, int MONTH, int YEAR){ // parameters are constantly updated with the time. 
		this.dayy=DAY;
		this.monthh=MONTH;
		this.yearr=YEAR;

          datefont = loadFont("Verdana-16.vlw");
	}
        
        public int returnDay(){
		return this.dayy;
	}
	
	public int returnMonth(){
		return this.monthh;
	}
	
	public int returnYear(){
		return this.yearr;
	}


      void draw (){ // adjusts the date and time to print correctly on the screen and draws the date
        
        String theday=null;
        String themonth=null;
        String thedate=null;
       
       
       if((this.dayy != 1 || this.dayy != 21 || this.dayy != 21 || this.dayy != 2 || this.dayy != 22 || this.dayy != 3 || this.dayy != 23)){
        theday= ""+dayy +"th";
       }
       
       if((this.dayy == 1 || this.dayy == 21 || this.dayy ==31)){
        theday= ""+dayy +"st";
       }
       
       if((this.dayy == 2 || this.dayy == 22)){
        theday= ""+dayy +"nd";
       }
       
       if((this.dayy == 3 || this.dayy == 23)){
        theday= ""+dayy +"rd";
       }
       
       if(this.monthh==1){
         themonth="January";
       }
       if(this.monthh==2){
         themonth="Febuary";
       }
       if(this.monthh==3){
         themonth="March";
       }
       if(this.monthh==4){
         themonth="April";
       }
       if(this.monthh==5){
         themonth="May";
       }
       if(this.monthh==6){
         themonth="June";
       }
       if(this.monthh==7){
         themonth="July";
       }
       if(this.monthh==8){
         themonth="August";
       }
       if(this.monthh==9){
         themonth="September";
       }
       if(this.monthh==10){
         themonth="October";
       }
       if(this.monthh==11){
         themonth="November";
       }
        if(this.monthh==12){
         themonth="December";
       }
       
       
       thedate= ""+theday+" " +"of " +themonth +" " +this.yearr;
       
       fill(255,255);
      textFont(datefont);
    text(thedate, 1150,760);
    
      }
        
       
   }
