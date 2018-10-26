//********************************************//
// MSDS 6390 - Visualization of Information   // 
// Assignment 8 - Mid-Term Data Viz Project   //
// Names:  Alma Lopez and George Sturrock     //
//********************************************//

// Needed libraries
import org.gicentre.geomap.*;
import grafica.*; //Goal Distribution
import org.gicentre.utils.stat.*; //Market Value
import org.gicentre.treemappa.*;      // For treemappa classes
import org.gicentre.utils.colour.*;   // Colours needed by treemappa.

//Class Declarations
GeoMap geoMap; 
GPlot plot;
BarChart barChart;
MarketValue marketValue;
Menu optionMenu;
CirclesGraph AgeGraph;
DataTable buildTable;
PTreeMappa pTreeMappa;
TreeMapPanel tmPanel;

PImage header, bg, gTreeMap; 
Table table1;
color[] btncolors = new color[4];
String labels[] = {"AGES", "GOALS", "MARKET", "TIME"}; 
//Market Value
float[] barData = new float[10];
String[] cName = new String[10];
int lineCount = 0;
int cardsDrawn = 0;

void setup(){
  size(1000, 1000);
  bg = loadImage("fifa2018bg (2).jpg");
  background(bg);
  header = loadImage("longfifa.jpg");  //header graphic
  
  geoMap = new GeoMap(this);  // Create the geoMap object.
  btncolors[0] = color(#2B8BDE);  // brackground - Russian Flag Blue
  btncolors[1] = color(0);  // label
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected
  
  // Create optionMenu 
  optionMenu = new Menu(labels, 30, 100, btncolors);

  //Market Value
  marketValue = new MarketValue();
  barChart = new BarChart(this);
  //Retrieve Data for the Market Value Bar Chart
  marketValue.setMV();
  barData = marketValue.getMV();
  cName = marketValue.getCountry();
  
  // Age player graph
  AgeGraph = new CirclesGraph();
  buildTable = new DataTable();

  goalTime();
  drawGameTreeMap();
   
}

void draw(){
  
  background(bg);
  image(header,width/2-header.width/2,0);
  
  // map of all the countries participating in Worl Cup 2018
  wcMap(20, 60, "Country_rounds.csv", 960, 400); 
  
  // Display the menu - bottons in horizontal order
  optionMenu.build(300, 480, true);
  
  if (mouseX > 300 && mouseX <700 && mouseY > 480 && mouseY<520 && mousePressed && mouseButton == LEFT){
    optionMenu.selectedButton();
  }
  else {
    optionMenu.keepButton();
  }
   
}
