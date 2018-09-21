// MSDS 6390 Data Visualization
// Homework 3      09/20/18
// Travis Deason , Jeffrey Lancon

//  Solar System - Motion Animation
//  Assistance on Coding was provided by Coding Train
// Images from planetpixelemporium.org

// Defining variables
PImage mercuryImg , venusImg, earthImg, marsImg, jupiterImg, saturnImg, uranusImg, neptuneImg, plutoImg;
PImage sunImg;
PShape globe;

// **************************************************
// *******    Manual Input     **********************

// Screen size and Rotation Speed
float img_size = 1024;

// Rotational Speed
int speedOrbit = 2;

// Setting Maximum Planet size Diameter
float maxPlanetSize = 40;

//float maxPlanetSize = 100;

//Scaling Sun - For optimal Viewing
float sunDiaScale = .1;
//float sunDiaScale = 0.1;

//Orbit Radius Adjust Factor - For Improved Viewing 
float mercOrbitFactor = 1;
float venusOrbitFactor = 1;
float earthOrbitFactor = 1;
float marsOrbitFactor = 1;
float jupiterOrbitFactor = .7;
float saturnOrbitFactor = .7;
float uranusOrbitFactor = .7;
float neptuneOrbitFactor = .6;
float plutoOrbitFactor = .6;

//****************************************************
//****************************************************

// Defining center of screen
float cent = img_size / 2;

 //Sun & Plant Diameters (x1)
float sunDia = 1391000;
float mercDia = 4879;
float venusDia = 12104;
float earthDia = 12756;
float marsDia = 6792;
float jupiterDia = 142984;
float saturnDia = 120536;
float uranusDia = 51118;
float neptuneDia = 49528;
float plutoDia = 2377; 

//float sizelf = 10;

//float sunDia = log(1391000) / log(sizelf);
//float mercDia = log(4879) / log(sizelf);
//float venusDia = log(12104) / log(sizelf);
//float earthDia = log(12756) / log(sizelf);
//float marsDia = log(6792) / log(sizelf);
//float jupiterDia = log(142984) / log(sizelf);
//float saturnDia = log(120536) / log(sizelf);
//float uranusDia = log(51118) / log(sizelf);
//float neptuneDia = log(49528) / log(sizelf);
//float plutoDia = log(2377) / log(sizelf); 


//Orbits (x1000)
float mercOrbit = 55730, venusOrbit = 108892, earthOrbit = 150301, marsOrbit = 206667, jupiterOrbit = 804617, saturnOrbit = 1505512, uranusOrbit =  2973096, neptuneOrbit = 4479011, plutoOrbit = 5906376; 

// OrbitsSpeed
float mercOrbit_yrs = 0.24, venusOrbit_yrs = 0.615, earthOrbit_yrs = 1.0, marsOrbit_yrs = 1.881, jupiterOrbit_yrs = 11.86, saturnOrbit_yrs = 29.46, uranusOrbit_yrs = 84.01, neptuneOrbit_yrs = 164.8, plutoOrbit_yrs = 287.5;

//normalize planets
float jupiterAdj = jupiterDia / jupiterDia * maxPlanetSize;
float mercAdj = mercDia / jupiterDia * maxPlanetSize;
float venusAdj = venusDia / jupiterDia * maxPlanetSize;
float earthAdj = earthDia / jupiterDia * maxPlanetSize;
float marsAdj = marsDia / jupiterDia * maxPlanetSize;
float saturnAdj = saturnDia / jupiterDia * maxPlanetSize;
float uranusAdj = uranusDia / jupiterDia * maxPlanetSize;
float neptuneAdj = neptuneDia / jupiterDia * maxPlanetSize;
float plutoAdj = plutoDia / jupiterDia * maxPlanetSize;

//normalize Sun
float sunAdj = (sunDia / sunDia * maxPlanetSize) * sunDiaScale;
//float sunAdj = (sunDia / sunDia * maxPlanetSize);


//Orbit Scale Factors
//float orbitScaleFactor = (.96 / (neptuneOrbit * neptuneOrbitFactor) * img_size)/2;
float orbitScaleFactor = (.96 / (plutoOrbit * plutoOrbitFactor) * img_size) / 2; 

//normalize orbits
//float mercOrbitAdj = mercOrbit * mercOrbitFactor * orbitScaleFactor;
//float venusOrbitAdj = venusOrbit * venusOrbitFactor * orbitScaleFactor;
//float earthOrbitAdj = earthOrbit * earthOrbitFactor * orbitScaleFactor;
//float marsOrbitAdj = marsOrbit * marsOrbitFactor * orbitScaleFactor;
//float jupiterOrbitAdj = jupiterOrbit * jupiterOrbitFactor * orbitScaleFactor;
//float saturnOrbitAdj = saturnOrbit * saturnOrbitFactor * orbitScaleFactor;
//float uranusOrbitAdj = uranusOrbit * uranusOrbitFactor * orbitScaleFactor;
//float neptuneOrbitAdj = neptuneOrbit * neptuneOrbitFactor * orbitScaleFactor;
//float plutoOrbitAdj = plutoOrbit * plutoOrbitFactor * orbitScaleFactor;
float mercOrbitAdj = mercOrbit * mercOrbitFactor * orbitScaleFactor;
float venusOrbitAdj = venusOrbit * venusOrbitFactor * orbitScaleFactor;
float earthOrbitAdj = earthOrbit * earthOrbitFactor * orbitScaleFactor;
float marsOrbitAdj = marsOrbit * marsOrbitFactor * orbitScaleFactor;
float jupiterOrbitAdj = jupiterOrbit * jupiterOrbitFactor * orbitScaleFactor;
float saturnOrbitAdj = saturnOrbit * saturnOrbitFactor * orbitScaleFactor;
float uranusOrbitAdj = uranusOrbit * uranusOrbitFactor * orbitScaleFactor;
float neptuneOrbitAdj = neptuneOrbit * neptuneOrbitFactor * orbitScaleFactor;
float plutoOrbitAdj = plutoOrbit * plutoOrbitFactor * orbitScaleFactor;


void setup() {
// Setting Screen size
  size(1024, 1024, P3D);
  
// Loading texture images of planet surfaces
  mercuryImg = loadImage("mercury.jpg");
  venusImg = loadImage("venus.jpg");
  earthImg = loadImage("earth.jpg");
  marsImg = loadImage("mars.jpg");
  jupiterImg = loadImage("jupiter.jpg");
  saturnImg = loadImage("saturn.jpg");
  uranusImg = loadImage("uranus.jpg");
  neptuneImg = loadImage("neptune.jpg");
  plutoImg = loadImage("pluto.jpg");
  sunImg = loadImage("sun.jpg");
println(neptuneOrbitAdj);
}
 
 
//Determining Planet's Rotational Location
float orbit_x(float center_x, float theta_x, float radius_x){
   return center_x + radius_x * sin(theta_x * 3.14159 / 180); 
}
 
float orbit_y(float center_y, float theta_y, float radius_y){
   return center_y + radius_y * cos(theta_y * 3.14159 / 180); 
}

// Initalizing x & y location
int x= 0;
int y= 0;

 
void draw() {
  background(30);
// Functions for each individual planet
  mercury(mercAdj, orbit_x(cent, x / mercOrbit_yrs, mercOrbitAdj), orbit_y(cent, y / mercOrbit_yrs, mercOrbitAdj));
  venus(venusAdj, orbit_x(cent, x / venusOrbit_yrs, venusOrbitAdj), orbit_y(cent, y / venusOrbit_yrs, venusOrbitAdj));
  earth(earthAdj, orbit_x(cent, x / earthOrbit_yrs, earthOrbitAdj), orbit_y(cent, y / earthOrbit_yrs, earthOrbitAdj));
  mars(marsAdj, orbit_x(cent, x / marsOrbit_yrs, marsOrbitAdj), orbit_y(cent, y / marsOrbit_yrs, marsOrbitAdj));
  jupiter(jupiterAdj, orbit_x(cent, x / jupiterOrbit_yrs, jupiterOrbitAdj), orbit_y(cent, y / jupiterOrbit_yrs, jupiterOrbitAdj));
  saturn(saturnAdj, orbit_x(cent, x / saturnOrbit_yrs, saturnOrbitAdj), orbit_y(cent, y / saturnOrbit_yrs, saturnOrbitAdj));
  uranus(uranusAdj, orbit_x(cent, x / uranusOrbit_yrs, uranusOrbitAdj), orbit_y(cent, y / uranusOrbit_yrs, uranusOrbitAdj));
  neptune(neptuneAdj, orbit_x(cent, x / neptuneOrbit_yrs, neptuneOrbitAdj), orbit_y(cent, y / neptuneOrbit_yrs, neptuneOrbitAdj));
  pluto(plutoAdj, orbit_x(cent, x / plutoOrbit_yrs, plutoOrbitAdj), orbit_y(cent, y / plutoOrbit_yrs, plutoOrbitAdj));

// This section is for Sun placement
sun(sunAdj, cent, cent);

// Rotation speed
  x = x + speedOrbit;
  y = y + speedOrbit;
}
