class Map{
  //Variables
  Data data;
  HashMap<String, String> buttonToName;
  String plotTitle;
  int keeper;
  ColourTable myCTable;

  //Constructors
  Map(){

  }
  Map(Data data, String plotTitle, ColourTable ctable){
    //Instatiate with existing Data Object
    this.myCTable = ctable;
    this.data = data;
    this.plotTitle = plotTitle;
  }

  //Methods
  void drawCountries(){
    fill(#D7E4FA);
    noStroke();
    rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
    stroke(120);
    strokeWeight(0.5);
    for(int id : this.data.geoMap.getFeatures().keySet()){
      String countryCode = this.data.geoMap.getAttributeTable().findRow(str(id), 0).getString("ISO_A3");
      TableRow dataRow = this.data.tableData.findRow(countryCode, 1);
      //println(dataRow.getFloat(this.plotTitle));
      //println(this.myCTable.findColour(61));
      if(dataRow != null){
        //Drawing country based on value of dataField and corresponding colourTable
        //fill(this.myCTable.findColour(dataRow.getFloat(this.data.dataField)));
        fill(this.myCTable.findColour(dataRow.getFloat(this.plotTitle)));
      }
      else{                   
      // No data found in table.
        println("poo");
        fill(#D1D3D1);
      }
      this.data.geoMap.draw(id); // Draw country
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
    int countryID = this.data.geoMap.getID(mouseX, mouseY);
    if(countryID != -1){
      fill(120);
      this.data.geoMap.draw(countryID);
      //Find ISO_A3 country codes such that id geo.Map == id World Bank Database
      String countryCodeMouse = this.data.geoMap.getAttributeTable().findRow(str(countryID),0).getString("ISO_A3");
      TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
      float countryValue;
      if(dataRowMouse == null){
        countryValue = 0;
      }
      else{
        countryValue = dataRowMouse.getFloat(this.data.dataField);
      }
      String countryValueText = String.format("%.2f", countryValue);    
      // Find human readable name of country in lieu of ISO designation
      String countryName = geoMap.getAttributeTable().findRow(str(countryID), 0).getString("NAME");
      fill(0);
      textSize(12);
      text(countryName, mouseX + 8, mouseY - 5);
      text(countryValueText, mouseX + 8, mouseY + 10);
    }
  }
}
