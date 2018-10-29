//  Draws a choropleth map of contries.
void wcMap(int xpos, int ypos, Table tableData, int sizew, int sizeh, int dataField, String plotTitle) {
  GeoMap geoMap;
  
  color minColour = color(255, 0, 42);   // Light blue
  color maxColour = color(0, 0, 255);    // Dark red.
   
  // Read map data.
  geoMap = new GeoMap(xpos+10, ypos+10, sizew-20, sizeh-20, this);
  geoMap.readFile("world");

 
  // Find largest data value so we can scale colours.
  float dataMax = 0;
  float dataMin = 0;
  for (TableRow row : tableData.rows())
  {
    dataMax = max(dataMax, row.getFloat(dataField)); //third column
    dataMin = min(dataMin, row.getFloat(dataField));
    //println(dataMax,dataMin, row.getString(1),row.getFloat(dataField));
   
  }
  fill(#D7E4FA);
  noStroke();
  rect(xpos,ypos, sizew, sizeh);
  stroke(255);
  strokeWeight(0.5);
  
  // Draw countries
  for (int id : geoMap.getFeatures().keySet())
  {
    String countryCode = geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");    
       
    TableRow dataRow = tableData.findRow(countryCode, 1);
 
    if (dataRow != null)       // Table row matches country code
    {
      float countryColour = (dataRow.getFloat(dataField)-dataMin)/(dataMax-dataMin);
      fill(lerpColor(minColour, maxColour, countryColour));
    }
    else                   // No data found in table.
    {
      fill(#D1D3D1);
    }
    geoMap.draw(id); // Draw country
  }
 
  // Draw title text
  fill(0);
  textAlign(CENTER, TOP);
  PFont myFont = createFont("NEW GOTHIC MT", 26);
  textFont(myFont);
  //text(plotTitle, xpos+10, sizeh+ypos-25);
  text(plotTitle, xpos+sizew/2, ypos-30);
  // Query the country at the mouse position to display Country name
  int id = geoMap.getID(mouseX, mouseY);

  if (id != -1)
  {
    fill(120, 120, 120);
    geoMap.draw(id);
 
    // Since ISO_A3 country codes are the same between geo.Map and World Bank Database, it will be used as the unique ID
    String countryCodeMouse = geoMap.getAttributeTable().findRow(str(id),0).getString("ISO_A3");
    TableRow dataRowMouse = tableData.findRow(countryCodeMouse, 1);
    float countryAge;
    if (dataRowMouse == null){
      countryAge = 0;
    }
    else
    {countryAge = dataRowMouse.getFloat(dataField);
  }
    
    // Displaying 'common' name of country in lieu of ISO designation
    String name = geoMap.getAttributeTable().findRow(str(id),0).getString("NAME");
    String countryAgeText = String.format("%.2f", countryAge);    
    fill(0);
    textSize(12);
    text(name, mouseX+8, mouseY-5);
    text(countryAgeText, mouseX+8,mouseY+10);
  }
}
