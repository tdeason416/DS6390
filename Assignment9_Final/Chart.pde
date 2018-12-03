abstract class Chart{
    //Variables
  Data data;
  HashMap<String, String> buttonToName;
  String plotTitle;
  int keeper;
  ColourTable myCTable;
  int dataField;

  //Constructors
  Chart(){
    //Default Constructor
  }

  Chart(Data data, String plotTitle, ColourTable ctable, int dataField){
    //Instatiate with existing Data Object
    this.myCTable = ctable;
    this.data = data;
    this.plotTitle = plotTitle;
    this.dataField = dataField;
  }

  void drawCountries(){
    fill(#D7E4FA);
    noStroke();
    rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
    stroke(120);
    strokeWeight(0.5);
  }

  void drawTitleText(){
    fill(0);
    textAlign(CENTER, TOP);
    PFont myFont = createFont("NEW GOTHIC MT", 26);
    textFont(myFont);
    text(this.plotTitle, this.data.xpos + this.data.sizew/2, this.data.ypos-35);
  }

  void displayCountryData(){
  }
}
