class Map extends Chart{
  //Variables
  Data data;
  HashMap<String, String> buttonToName;
  String plotTitle;
  int keeper;
  ColourTable myCTable;
  int dataField;

  //Constructors
  Map(){
  
  }
  Map(Data data, String plotTitle, ColourTable ctable, int dataField){
    super(data, plotTitle, ctable, dataField);
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
    for(int id : this.data.geoMap.getFeatures().keySet()){
      String countryCode = this.data.geoMap.getAttributeTable().findRow(str(id), 0).getString("ISO_A3");
  //println(countryCode);
      TableRow dataRow = this.data.tableData.findRow(countryCode, 1);
      //println(dataRow.getFloat(this.plotTitle));
      //println(this.myCTable.findColour(61));
      if(dataRow != null){
        //Drawing country based on value of dataField and corresponding colourTable
        //fill(this.myCTable.findColour(dataRow.getFloat(this.data.dataField)));
        //fill(this.myCTable.findColour(dataRow.getFloat(this.plotTitle)));
    //println(dataRow.getFloat(dataField));
        fill(this.myCTable.findColour(dataRow.getFloat(dataField)));
        
        //color minColour = color(222, 235, 247);   // Light blue
        //color maxColour = color(49, 130, 189);    // Dark blue.
        //fill(lerpColor(minColour, maxColour, dataField));
      }
      else{                   
      // No data found in table.
    //println("poo");
        //fill(#D1D3D1);
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
      if(dataRowMouse == null) {
        countryValue = 0;
      }
      else{
        countryValue = dataRowMouse.getFloat(dataField);
      }
      String countryValueText = String.format("%.2f", countryValue);    
      // Find human readable name of country in lieu of ISO designation
      String countryName = geoMap.getAttributeTable().findRow(str(countryID), 0).getString("NAME");
      fill(0);
      textSize(14);
      text(countryName, mouseX + 18, mouseY - 5);
      text(countryValueText, mouseX + 18, mouseY + 10);
    }
  }
}
