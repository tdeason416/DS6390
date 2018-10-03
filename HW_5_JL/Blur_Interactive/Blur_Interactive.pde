// MSDS 6390
// Homework 5
// Travis Deason, Jeffrey Lancon

// Assistance from: Example: Sharpen with Convolution http://processing.org/tutorials/pixels
// https://en.wikipedia.org/wiki/Kernel_(image_processing)

// Initalizing Variables
PImage img;
int blurFactor = 1;

// Setting Size of Blurr window
int w = 100;

// Setting up window, frameRate and loading PImage
void setup() {
  size(687, 1024);
  frameRate(30);
  img = loadImage("mona_lisa.jpg");
}

void draw() {
  if (keyPressed == true) {
    if ((key >= 48) && (key <= 58)) {
      blurFactor = (key - 48);// Using keyboard input to dynamically alter blurr amount
      println(blurFactor);
     }
  }

  int matix_Dim = (2 * blurFactor) + 1;
  float[][] matrix = new float [matix_Dim][matix_Dim];
  
    float multiVal = 1.0 / (pow(matix_Dim, 2));  //Multiplication Factor for color
  for (int x = 0; x < matix_Dim; x++) {   
    for (int y = 0; y < matix_Dim; y++) {
     matrix[x][y] = multiVal;
    }
  } 
  
  //Refresh PImage every loop, to erase previous modifications
 image(img,0,0);
  
  // Identifying location of mouse, to determine center location
  // of box in which we will be modifying the pixels. we are going to modify
  // Added constranits to ensure box center remains on the image.
  int xStart = constrain(mouseX-w/2,0,img.width);
  int yStart = constrain(mouseY-w/2,0,img.height);
  int xEnd = constrain(mouseX+w/2,0,img.width);
  int yEnd = constrain(mouseY+w/2,0,img.height);
  int matrixsize = matix_Dim;
  
  loadPixels();
  // Using (2) nested for loops, we will use convolution to alter the pixels within the
  // subwindow, using the custom matrix defined by the blurFactor.
  for (int x = xStart; x < xEnd; x++) {
    for (int y = yStart; y < yEnd; y++ ) {
      // Each pixel location (x,y) gets passed into a function called convolution() 
      // which returns a new color value to be displayed.
      color c = convolution(x,y,matrix,matrixsize,img);
      int loc = x + y*img.width;
      pixels[loc] = c;
    }
  }
// Update modified pixels to the screen
  updatePixels();

  // Creation of blur window
  strokeWeight(2);
  stroke(230);
  noFill();
  rect(xStart,yStart,w,w);
}
