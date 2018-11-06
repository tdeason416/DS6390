//********************************************
// MSDS 6390 - Data Visualization 
// Assignment 8 
// Names:  Travis Deason and Jeff Lancon
//********************************************

// Needed libraries
import org.gicentre.geomap.*;
import org.gicentre.utils.colour.*;   // Colors needed by GeoMap

Table tableData;
PImage header, bg;

color[] btncolors = new color[4];
String labels[] = {"Life Exp.", "Pop. Density", "GDP per Capita", "Mortality Rate"}; 

//Class Declarations
GeoMap geoMap; 
Menu optionMenu;

void setup(){
  size(1000, 1000);
  bg = loadImage("art-background.jpg");
  bg.resize(width,height);
  background(bg);
  header = loadImage("TheWorldBank.jpg");  //header graphic
  header.resize(65,55);
  
  tableData = loadTable("WorldBank_Data_2015.csv");  // Read data
  
  geoMap = new GeoMap(this);  // Create the geoMap object.
  btncolors[0] = color(#2B8BDE);  // background color
  btncolors[1] = color(35);  // label color
  btncolors[2] = color(#D5F5F4);  // mouseover
  btncolors[3] = color(#109D0E);  // selected

  // Create optionMenu 
  optionMenu = new Menu(labels, 30, 140, btncolors);
  
}

void draw(){
  
  background(bg);
  image(header,header.width/2,2);
  
  
  // Display the menu - bottons in horizontal order
  optionMenu.build(300, 550, true);
  
  if (mouseX > 300 && mouseX < 860 && mouseY > 550 && mouseY < 590 && mousePressed && mouseButton == LEFT){
    optionMenu.selectedButton();
  }
  else {
    optionMenu.keepButton();
  }
   
}
