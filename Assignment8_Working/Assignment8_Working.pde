//********************************************
// MSDS 6390 - Data Visualization 
// Assignment 8 
// Names:  Travis Deason and Jeff Lancon
//********************************************

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

Table tableData;
PImage header, bg, gTreeMap; 
Table table1;
color[] btncolors = new color[4];
String labels[] = {"Life Exp.", "Pop. Density", "GDP per Capita", "Mortality Rate"}; 
//Market Value
float[] barData = new float[10];
String[] cName = new String[10];
int lineCount = 0;
int cardsDrawn = 0;

void setup(){
  size(1000, 1000);
  bg = loadImage("art-background.jpg");
  bg.resize(width,height);
  background(bg);
  header = loadImage("TheWorldBank.jpg");  //header graphic
  header.resize(65,55);
  
  tableData = loadTable("WorldBank_Data_2015.csv");  // Read data
  
  geoMap = new GeoMap(this);  // Create the geoMap object.
  btncolors[0] = color(#2B8BDE);  // 
  btncolors[1] = color(0);  // label
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected

  // Create optionMenu 
  optionMenu = new Menu(labels, 30, 140, btncolors);

  //Market Value
//  marketValue = new MarketValue();
//  barChart = new BarChart(this);
  //Retrieve Data for the Market Value Bar Chart
//  marketValue.setMV();
//  barData = marketValue.getMV();
//  cName = marketValue.getCountry();
  
  // Age player graph
//  AgeGraph = new CirclesGraph();
//  buildTable = new DataTable();

//  goalTime();
//  drawGameTreeMap();
   
}

void draw(){
  
  background(bg);
  image(header,header.width/2,2);
  
  
  // Display the menu - bottons in horizontal order
  optionMenu.build(300, 550, true);
  
  if (mouseX > 300 && mouseX <860 && mouseY > 550 && mouseY<590 && mousePressed && mouseButton == LEFT){
    optionMenu.selectedButton();
  }
  else {
    optionMenu.keepButton();
  }
   
}
