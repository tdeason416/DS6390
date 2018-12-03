//class BarChart extends Chart{
//  //Variables
//  Data data;
//  HashMap<String, String> buttonToName;
//  String plotTitle;
//  int gapWidth;
//  int rowWidth;
//  int keeper;
//  ColourTable myCTable;
//  int dataField;

//  //Constructors
//  BarChart(){
//  }
  
//  BarChart(Data data, String plotTitle, ColourTable ctable, int dataField){
//    super(data, plotTitle, ctable, dataField);
//    this.myCTable = ctable;
//    this.data = data;
//    this.plotTitle = plotTitle;
//    this.dataField = dataField;
//    this.gapWidth = 2;
//    this.rowWidth = (this.data.sizew / this.data.getRowCount()) -  gapWidth;
//  }


//  void drawCountries(){
//        //background
//        fill(#D7E4FA);
//        noStroke();
//        rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
//        // stroke(120);
//        // strokeWeight(0.5);
//        // Draw Country Data
//        int currentPos = this.data.xpos + this.gapWidth * 4;
//        for(String countryName : this.data.tableData.getStringColumn("Country Name")){
//            TableRow dataRow = this.data.tableData.findRow(countryName, 1);
//            if(dataRow != null){
//                float value = dataRow.getFloat(this.data.dataField);
//                color clr = this.data.myCTable.findColour(value);
//                this.drawBar(locX, value, clr, countryName);
//        }
//        else{                   
//        // No data found in table.
//            fill(#D1D3D1);
//        }
//        }
//    }
    
//  //  fill(#D7E4FA);
//  //  noStroke();
//  //  rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
//  //  stroke(120);
//  //  strokeWeight(0.5);
//  //  for(int id : this.data.geoMap.getFeatures().keySet()){
//  //    String countryCode = this.data.geoMap.getAttributeTable().findRow(str(id), 0).getString("ISO_A3");
//  ////println(countryCode);
//  //    TableRow dataRow = this.data.tableData.findRow(countryCode, 1);
//  //    //println(dataRow.getFloat(this.plotTitle));
//  //    //println(this.myCTable.findColour(61));
//  //    if(dataRow != null){
//  //      //Drawing country based on value of dataField and corresponding colourTable
//  //      //fill(this.myCTable.findColour(dataRow.getFloat(this.data.dataField)));
//  //      //fill(this.myCTable.findColour(dataRow.getFloat(this.plotTitle)));
//  //  //println(dataRow.getFloat(dataField));
//  //      fill(this.myCTable.findColour(dataRow.getFloat(dataField)));
        
//  //      //color minColour = color(222, 235, 247);   // Light blue
//  //      //color maxColour = color(49, 130, 189);    // Dark blue.
//  //      //fill(lerpColor(minColour, maxColour, dataField));
//  //    }
//  //    else{                   
//  //    // No data found in table.
//  //  //println("poo");
//  //      //fill(#D1D3D1);
//  //    }
//  //    this.data.geoMap.draw(id); // Draw country
//  //  }
//  //}

//  void drawTitleText(){
//    fill(0);
//    textAlign(CENTER, TOP);
//    PFont myFont = createFont("NEW GOTHIC MT", 26);
//    textFont(myFont);
//    text(this.plotTitle, this.data.xpos + this.data.sizew/2, this.data.ypos-35);
//  }

//  void displayCountryData(){
//    int countryID = this.data.geoMap.getID(mouseX, mouseY);
//    if(countryID != -1){
//      fill(120);
//      this.data.geoMap.draw(countryID);
//      //Find ISO_A3 country codes such that id geo.Map == id World Bank Database
//      String countryCodeMouse = this.data.geoMap.getAttributeTable().findRow(str(countryID),0).getString("ISO_A3");
//      TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
//      float countryValue;
//      if(dataRowMouse == null){
//        countryValue = 0;
//      }
//      else{
//        //countryValue = dataRowMouse.getFloat(this.data.dataField);
//        countryValue = dataRowMouse.getFloat(dataField);
//      }
//      String countryValueText = String.format("%.2f", countryValue);    
//      // Find human readable name of country in lieu of ISO designation
//      String countryName = geoMap.getAttributeTable().findRow(str(countryID), 0).getString("NAME");
//      fill(0);
//      textSize(12);
//      text(countryName, mouseX + 8, mouseY - 5);
//      text(countryValueText, mouseX + 8, mouseY + 10);
//    }
//  }
//}

//class BarChart extends Chart{
//    //Variables
//    Data data;
//    int gapWidth;
//    int rowWidth;

//    //Constructors
//    BarChart(){

//    }

//    BarChart(Data data, int gapWidth){
//        this.data = data;
//        this.gapWidth = gapWidth;
//        int nRows = this.data.tableData.getRowCount();
//        this.rowWidth = ((this.data.sizew - 8 * this.gapWidth) / nRows) - this.gapWidth;
//    }

//    //Standard Methods
//    void drawBar(int locX, float value, color clr, String countryName){
//        noStroke();
//        fill(clr);
//        beginShape();
//        int yPos = this.data.ypos + 100;
//        vertex(int(locX), yPos);
//        vertex(int(locX) + this.rowWidth, yPos);
//        vertex(int(locX) + this.rowWidth, yPos - int(value));
//        vertex(int(locX), yPos + value);
//        endShape();
//        textSize(this.rowWidth);
//        pushMatrix();
//        translate(int(locX), yPos);
//        rotate(PI/2);
//        text(countryName);
//        popMatrix();
//    }

//    void drawChart(){
//        //background
//        fill(#D7E4FA);
//        noStroke();
//        rect(this.data.xpos, this.data.ypos, this.data.sizew, this.data.sizeh);
//        // stroke(120);
//        // strokeWeight(0.5);
//        // Draw Country Data
//        this.currentPos = this.data.xpos + this.gapWidth * 4;
//        for(String countryName : this.data.tableData.getStringColumn("Country Name")){
//            TableRow dataRow = this.data.tableData.findRow(countryName, 1);
//            if(dataRow != null){
//                float value = dataRow.getFloat(this.data.dataField);
//                color clr = this.data.myCTable.findColour(value);
//                this.drawBar(locX, value, clr, countryName);
//        }
//        else{                   
//        // No data found in table.
//            fill(#D1D3D1);
//        }
//        }
//    }

//    // void displayAttr(){

//    // }
//}
