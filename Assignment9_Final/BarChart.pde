class BarChart extends Chart{
  //Variables
  Data data;
  HashMap<String, String> buttonToName;
  HashMap<Integer, String> mouseCountry;
  String plotTitle;
  //Table dataTable;
  int maxValue;
  int gapWidth;
  int rowWidth;
  int numRows;
  PFont barFont;
  int keeper;
  ColourTable myCTable;
  int dataField;

  //Constructors
  BarChart(){
  }
  
  BarChart(Data data, String plotTitle, ColourTable ctable, int dataField){
    super(data, plotTitle, ctable, dataField);
    this.barFont = createFont("Ariel", 11);
    this.myCTable = ctable;
    this.mouseCountry = new HashMap<Integer, String>();
    this.data = data;
    this.numRows = 50;
    this.plotTitle = plotTitle;
    this.dataField = dataField;
    this.data.tableData.sortReverse(this.dataField);
    this.gapWidth = 1;
    //this.rowWidth = (this.data.sizew / this.data.tableData.getRowCount()) -  gapWidth;
    this.rowWidth = int((this.numRows / this.data.tableData.getRowCount()) - gapWidth);
    this.maxValue = this.findMaxValue();
  }
  
  int findMaxValue(){
    float tmpVal = 0;
    float maxVal = 0;
    for(int i=0; i < this.data.tableData.getRowCount(); i++){
      tmpVal = this.data.tableData.getInt(i, this.dataField);
      if(tmpVal > maxVal){
        maxVal = tmpVal;
      }
    }
    return int(maxVal);
  }
  
  void drawBar(int locX, float value, color clr, String countryName){
        int barHeight = int(value / this.maxValue) * this.data.sizeh;  
        //noStroke();
        int yPos = this.data.ypos + this.data.sizeh;
        fill(clr);
        beginShape();
        vertex(int(locX), yPos);
        vertex(int(locX), yPos - barHeight);
        vertex(int(locX) + this.rowWidth, yPos - barHeight);
        vertex(int(locX) + this.rowWidth, yPos);
        endShape();
        textSize(this.rowWidth);
        pushMatrix();
        translate(int(locX) + this.rowWidth/2, yPos);
        rotate(-PI/2);
        textFont(this.barFont);
        text(countryName, 0, 0);
        popMatrix();
    }

  void drawCountries(){
        //background
        fill(#D7E4FA);
        noStroke();
        rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
        // stroke(120);
        // strokeWeight(0.5);
        // Draw Country Data
        int currentPos = this.data.xpos + this.gapWidth * 4;
        for(int i = 0; i < numRows; i++){
            println(currentPos);
            TableRow dataRow = this.data.tableData.getRow(i);
            String countryName = dataRow.getString(0);
        //for(String countryName : this.data.tableData.getStringColumn("Country Name")){
            //TableRow dataRow = this.data.tableData.findRow(countryName, 0);
            //if(dataRow != null){
                float value = dataRow.getFloat(this.data.dataField);
                color clr = this.myCTable.findColour(value);
                this.drawBar(currentPos, value, clr, countryName);
                for(int j = currentPos; j < currentPos + this.rowWidth; j++){
                  this.mouseCountry.put(j, countryName);
                  }
              currentPos += this.rowWidth + this.gapWidth;
            //}
            //else{                   
            //// No data found in table.
            //    //fill(#D1D3D1);
            //}
        }
    }

  void drawTitleText(){
    fill(0);
    textAlign(CENTER, TOP);
    PFont myFont = createFont("NEW GOTHIC MT", 26);
    textFont(myFont);
    text(this.plotTitle, this.data.xpos + this.data.sizew/2, this.data.ypos-35);
  }
  
  void displayCountryData(){
    //int countryID = this.data.geoMap.getID(mouseX, mouseY);
    try{
     String countryCodeMouse = this.mouseCountry.get(mouseX);
     TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
     float countryValue;
     if(dataRowMouse == null){
        countryValue = 0;
      }
      else{
        countryValue = dataRowMouse.getFloat(dataField);
      }
      String countryValueText = String.format("%.2f", countryValue);    
      // Find human readable name of country in lieu of ISO designation
      String countryName = dataRowMouse.getString(0);
      fill(0);
      textSize(12);
      text(countryName, mouseX + 8, mouseY - 5);
      text(countryValueText, mouseX + 8, mouseY + 10);
    }
    catch(NullPointerException e)
    {
     println("Mouse is not on Bar");
    }

  }

}
