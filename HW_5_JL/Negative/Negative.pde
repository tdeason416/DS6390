// *****   Creating Negative of PImage  *****

PImage img; // Initalizing PImage variable

void setup() {
  
  size(1200, 1200); //Setting Screen size
  img = loadImage("mona_lisa.jpg"); // Loading original image
  noLoop();
} 

void draw() {
  image(img, 0, 0); // Displays PImage from point (0,0) 
  img.loadPixels();

  // Create a second PImage same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);

  // Loop through every pixel in the image
  for (int y = 0; y < img.height; y++) {   
    for (int x = 0; x < img.width; x++) {  
      int pos = (y)*img.width + (x);
      // Image is Color, extract RGB values for pixels
      float valR = red(img.pixels[pos]);
      float valG = green(img.pixels[pos]);
      float valB = blue(img.pixels[pos]);
      // Invert Color by subtracting RGB values from 255
      valR = 255 - valR;
      valG = 255 - valG;
      valB = 255 - valB;
      
      // Set new RGB values for pixels 
      edgeImg.pixels[y*img.width + x] = color(valR,valG,valB);
    }
  }
  // Checking random pixel values
  int pix = 6000;
  println("Original",red(img.pixels[pix]),green(img.pixels[pix]),blue(img.pixels[pix]));
  println("Negative", red(edgeImg.pixels[pix]),green(edgeImg.pixels[pix]),blue(edgeImg.pixels[pix]));  

  // Updating pixels in edgeImg
  edgeImg.updatePixels();

  // Drawing new edgeImg
  image(edgeImg, width/2, 0); 
}
