// Build a circle graph 
// this is used for players age graph
class CirclesGraph {
  Bubble[] bubbles;
  // A Table object
  Table dataTable;
  ArrayList <Bubble> bages;
  float posx,posy;
  color backColor = color(#B5E5B5);
  color circleColor = color(#9396F7);

  CirclesGraph(){
  }
  
  CirclesGraph(float posx, float posy, Table dataTable, color backColor, color circleColor){
    this.posx = posx;
    this.posy = posy;
    this.dataTable = dataTable;
    this.backColor = backColor;
    this.circleColor = circleColor;
  }

  void loadData(String filename) {
    // Load CSV file into a Table object, sorted already in DESC order
    this.dataTable = loadTable(filename, "header");
 
    // The size of the array of Bubble objects is determined by the total number of rows in the CSV
    bubbles = new Bubble[dataTable.getRowCount()]; 

    // You can access iterate over all the rows in a table
    for (int i = 0; i < dataTable.getRowCount(); i++) {
      TableRow row = dataTable.getRow(i);
      // d number of players with a specific Age
      int d = row.getInt(1);
      String n = row.getString(0);
      // Make a Bubble object out of the data read
      bubbles[i] = new Bubble(d, n);
    }
  }
  
  void displayAll(int xval, int yval, color backColor, color circleColor) {
    int initx = xval;
    fill(color(backColor));
    rect (xval, yval-50, width-xval*2,150); 
    xval = xval+bubbles[0].diameter/2 +60;
    yval = yval+bubbles[0].diameter/2 +10;
    for (int i = 0; i < bubbles.length; i++) {
      bubbles[i].display(xval, yval, circleColor);
      if (i < bubbles.length-1) {
        xval = xval+int(bubbles[i].diameter/2)+int(bubbles[i+1].diameter/2);
      }
    }
    textAlign(CENTER, CENTER);
    fill(0);
    text(dataTable.getColumnTitle(0),initx+20,yval+55); 
    
    textSize(14);
    text("Player ages in the World Cup 2018", width/2, yval-80);
  } 
}
