//********************************************
// MSDS 6390 - Data Visualization 
// Assignment 9 
// Names:  Travis Deason and Jeff Lancon
//********************************************

// Needed libraries
import org.gicentre.geomap.*;
import org.gicentre.utils.colour.*;   // Colors needed by GeoMap

// Some parameters
//int imgHt = 1000;
//int imgWth = 600;
int mapXPos = 30;
int mapYPos = 70;
int mapWidth = 930;
int mapHeight = 455;
int menuCentW = 30;
int menuCentH = 140;


Table tableData;
PImage header, bg;
Data data;
Map LifeExp;
Map PopDens;
Map GDP;
Map Mortality;

color[] btncolors = new color[4];
String labels[] = {"Life Exp.", "Pop. Density", "GDP per Capita", "Mortality Rate"}; 
int[] dataColumn = {12,5,51,17};
import java.util.Map;

//Class Declarations
GeoMap geoMap; 
Menu optionMenu;
HashMap<String, String> buttonToName;

void setup(){
  size(1000, 1000);
  bg = loadImage("art-background.jpg");
  bg.resize(width,height);
  background(bg);
  header = loadImage("TheWorldBank.jpg");  //header graphic
  header.resize(65,55);
  tableData = loadTable("WorldBank_Data_2015.csv", "header");  // Read data
  geoMap = new GeoMap(mapXPos, mapYPos, mapWidth, mapHeight, this);  // Create the geoMap object.
  btncolors[0] = color(#2B8BDE);  // background color
  btncolors[1] = color(35);  // label color
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected
  
  buttonToName = new HashMap<String, String>();
  buttonToName.put("Life Exp.", "Life expectancy at birth, total (years)");
  buttonToName.put("Pop. Density", "Population Density (per sq. km)");
  buttonToName.put("GDP per Capita", "GDP per capita (current US$)");
  buttonToName.put("Mortality Rate", "Mortality rate, under-5 (per 1,000 live births)");
  
  //Load Data
  data = new Data(tableData, geoMap, mapXPos, mapYPos, mapWidth, mapHeight);
  // Create optionMenu 
  optionMenu = new Menu(labels, menuCentW, menuCentH, btncolors, data, buttonToName, dataColumn);
  //println(optionMenu.data.tableData.getString(120, 1));
  //println(optionMenu.data.tableData.findRow("MWI", 1).getString(0));
}

void draw(){
  background(bg);
  image(header, header.width/2, 2);
  // Display the menu - bottons in horizontal order
  optionMenu.build(300, 550, true);
  if (mouseX > 300 && mouseX < 860 && mouseY > 550 && mouseY < 590 && mousePressed && mouseButton == LEFT){
    optionMenu.selectedButton();
  }
  else {
    optionMenu.keepButton();
  }
   
}
