class Map{
  //Variables
  Data data;
  // int xpos;
  // int ypos;
  // Table tableData;
  // int sizew;
  // int sizeh;
  // int dataField;
  String plotTitle;
  int keeper;
  // float dataMax;
  // float dataMin;
  // float minColor;
  // float maxColor;
  // GeoMap geoMap;
  // ColourTable myCTable

  //Constructors
  Map(){
    //Default Constructor
  }

  Map(Data data, String plotTitle, int keeper){
    //Instatiate with existing Data Object
    this.data = data;
    this.plotTitle = plotTitle;
  }

  // Map(int xpos, int ypos, Table tableData, int sizew, int sizeh, 
  //     int dataField, String plotTitle, int keeper){
  //   //Instatiate with arguements
  //   super(int xpos, int ypos, Table tableData, int sizew, int sizeh, 
  //         int dataField, String plotTitle, int keeper){
  //   this.geoMap = geoMap;
  //   this.plotTitle = plotTitle;
  //   this.sizew = sizew;
  //   this.sizeh = sizeh;
  //   this.xpos = xpos;
  //   this.ypos = ypos;
  //   this.geoMap = new GeoMap(xpos, ypos, Table tableData);
  //   this.geoMap.readFile("world");
  //   this.keeper = keeper;
  //   this.setColorScale();
  //   this.setColorTable();
  //   this.saveColorTable();
  // }

  //Public Methods
  
  // void setColorScale(){
  //   this.dataMax = 0;
  //   this.dataMin = 0;
  //   for(TableRow row : this.tableData.rows()){
  //       this.dataMax = max(this.dataMax, row.getFloat(this.dataField));
  //       this.dataMin = min(this.dataMin, row.getFloat(this.dataField));
  //   }
  // }

  // void setColorTable(){
  //   if(this.keeper == 1){
  //     this.myCTable = ColourTable.getPresetColourTable(ColourTable.SPECTRAL,dataMin,dataMax);
  //   }
  //   else if(this.keeper == 2){
  //     this.myCTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,dataMin,dataMax);
  //   }
  //   else if(this.keeper == 3){
  //     this.myCTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,dataMin,dataMax);
  //   }
  //   else{
  //       myCTable = ColourTable.getPresetColourTable(ColourTable.REDS,dataMin,dataMax);
  //   }
  // }

  // void saveColorTable(){
  //   ColourTable.writeFile(myCTable,createOutput("mapColors.ctb"));
  // }

  void drawCountries(){
    fill(#D7E4FA);
    noStroke();
    rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
    stroke(120);
    strokeWeight(0.5);
    for(int id : this.data.geoMap.getFeatures.keySet()){
      String countryCode = this.data.geoMap.getAttributeTable().findRow(str(id), 0).getString("ISO_A3");
      TableRow dataRow = this.data.tableData.findRow(countryCode, 1);
      if dataRow != null){
        //Drawing country based on value of dataField and corresponding colourTable
        fill(this.data.myCTable.findColour(dataRow.getFloat(this.data.dataField)));
      }
      else{                   
      // No data found in table.
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
    text(this.plotTitle, this.data.xpos + this.data.sizew/2, this.data.ypos-35)
  }

  void displayCountryData(){
    int countryID = this.data.geoMap.getID(mouseX, mouseY);
    if(id != -1){
      fill(120);
      this.data.geoMap.draw(id);
      //Find ISO_A3 country codes such that id geo.Map == id World Bank Database
      String countryCodeMouse = this.data.geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");
      TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
      float countryValue;
      if(dataRowMouse == null){
        countryValue = 0;
      }
      else{
        countryValue = dataRowMouse.getFloat(this.data.dataField)
      }
      String countryValueText = String.format("%.2f", countryValue);    
      // Find human readable name of country in lieu of ISO designation
      String countryName = geoMap.getAttributeTable().findRow(str(id), 0).getString("NAME");
      fill(0);
      textSize(12);
      text(countryName, mouseX + 8, mouseY - 5);
      text(countryValueText, mouseX + 8, mouseY + 10)
    }
  }


  //Private Methods




  //Getters and Setters

}


// //  Draws a choropleth map of contries.
// void wcMap(int xpos, int ypos, Table tableData, int sizew, int sizeh, int dataField, String plotTitle, int keeper) {
//   GeoMap geoMap;
//   ColourTable myCTable;
   
//   // Read map data.
//   geoMap = new GeoMap(xpos+10, ypos+10, sizew-20, sizeh-20, this);
//   geoMap.readFile("world");

 
//   // Find largest data value so we can scale colours.
//   float dataMax = 0;
//   float dataMin = 0;
//   for (TableRow row : tableData.rows())
//   {
//     dataMax = max(dataMax, row.getFloat(dataField)); //Selecting Applicable column
//     dataMin = min(dataMin, row.getFloat(dataField));
//     //println(dataMax,dataMin, row.getString(1),row.getFloat(dataField));
   
//   }
  
//   // Selecting map colour palette according to button selection
//   if (keeper == 1){
//     myCTable = ColourTable.getPresetColourTable(ColourTable.SPECTRAL,dataMin,dataMax);}
//   else if (keeper == 2){
//       myCTable = ColourTable.getPresetColourTable(ColourTable.YL_GN_BU,dataMin,dataMax);}
//     else if (keeper == 3){
//         myCTable = ColourTable.getPresetColourTable(ColourTable.RD_YL_GN,dataMin,dataMax);}
//       else{
//         myCTable = ColourTable.getPresetColourTable(ColourTable.REDS,dataMin,dataMax);}
  
//   // Saving colour table to file for retrieval when drawing map  
//   ColourTable.writeFile(myCTable,createOutput("mapColors.ctb"));
  
//   // Draw countries
//   fill(#D7E4FA);
//   noStroke();
//   rect(xpos,ypos, sizew, sizeh);
//   stroke(120);
//   strokeWeight(0.5);
  
//   for (int id : geoMap.getFeatures().keySet())
//   {
//     String countryCode = geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");    
       
//     TableRow dataRow = tableData.findRow(countryCode, 1);
 
//     if (dataRow != null)       // Table row matches country code
//     {
//       //Drawing country based on value of dataField and corresponding colourTable
//       fill(myCTable.findColour(dataRow.getFloat(dataField)));
//     }
//     else                   // No data found in table.
//     {
//       fill(#D1D3D1);
//     }
//     geoMap.draw(id); // Draw country
//   }
 
//   // Drawing  Map Title Text
//   fill(0);
//   textAlign(CENTER, TOP);
//   PFont myFont = createFont("NEW GOTHIC MT", 26);
//   textFont(myFont);
//   text(plotTitle, xpos+sizew/2, ypos-35);

//     // Query the country at the mouse position to display Country Name and Value during mouseover
//   int id = geoMap.getID(mouseX, mouseY);

//   if (id != -1)
//   {
//     fill(120, 120, 120);
//     geoMap.draw(id);
 
//     // Since ISO_A3 country codes are the same between geo.Map and World Bank Database, it will be used as the unique ID
//     String countryCodeMouse = geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");
//     TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
//     float countryValue;
//     if (dataRowMouse == null){
//       countryValue = 0;}
//     else{
//       countryValue = dataRowMouse.getFloat(dataField);}
    
//     // Displaying country Name and Value during mouseover //
//     // Finding 'common' name of country in lieu of ISO designation
//     String name = geoMap.getAttributeTable().findRow(str(id),0).getString("NAME");
    
//     // Rounding countryValueText to 2 decimal places 'for display purposes only' 
//     String countryValueText = String.format("%.2f", countryValue);    
//     fill(0);
//     textSize(12);
//     text(name, mouseX+8, mouseY-5);
//     text(countryValueText, mouseX+8,mouseY+10);
//   }
// }
