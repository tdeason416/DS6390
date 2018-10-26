//  Draws a choropleth map of contries participation in World Cup Russia 2018.
void wcMap(int xpos, int ypos, String file_name, int sizew, int sizeh) {
  GeoMap geoMap;
  Table tableData;
  float dataMax;
  color minColour = color(222, 235, 247);   // Light blue
  color maxColour = color(49, 130, 189);    // Dark blue.
   
  // Read map data.
  geoMap = new GeoMap(xpos+10, ypos+10, sizew-20, sizeh-20, this);
  geoMap.readFile("world");

   
  tableData = loadTable(file_name);  // Read data
 
  // Find largest data value so we can scale colours.
  dataMax = 0;
  for (TableRow row : tableData.rows())
  {
    dataMax = max(dataMax, row.getFloat(2)); //third column
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
    TableRow dataRow = tableData.findRow(countryCode, 0);
 
    if (dataRow != null)       // Table row matches country code
    {
      float score = dataRow.getFloat(2)/dataMax;
      fill(lerpColor(minColour, maxColour, score));
    }
    else                   // No data found in table.
    {
      fill(#D1D3D1);
    }
    geoMap.draw(id); // Draw country
  }
 
  // Draw title text
  fill(0);
  textAlign(LEFT, TOP);
  text("Countries participation in World Cup Russia 2018", xpos+10, sizeh+ypos-15);
  
  // Query the country at the mouse position to display Country name
  int id = geoMap.getID(mouseX, mouseY);
  if (id != -1)
  {
    fill(180, 120, 120);
    geoMap.draw(id);
 
    String name = geoMap.getAttributeTable().findRow(str(id),0).getString("NAME");    
    fill(0);
    text(name, mouseX+5, mouseY-5);
  }
}
