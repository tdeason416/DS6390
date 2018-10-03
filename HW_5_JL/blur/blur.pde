// *****   Manual Input - Level of Blur Requested:  *****
// *****   integer values between 0-30              *****

int blurFactor = 3;

//***********************************
//***********************************


PImage img; // Initalizing PImage variable

// Setting up the kernal matrix size and inital values 

int matix_Dim = (2 * blurFactor) + 1;
float[][] kernel = new float [matix_Dim][matix_Dim];


void setup() {
  
  size(1200, 1200); //Setting Screen size
  img = loadImage("mona_lisa.jpg"); // Loading original image
  noLoop();

  // Setting initial values of kernal
  float multiVal = 1.0 / (pow(matix_Dim, 2));  //Multiplication Factor for color
  for (int x = 0; x < matix_Dim; x++) {   
    for (int y = 0; y < matix_Dim; y++) {
     kernel[x][y] = multiVal;
    }
  }   
} 

void draw() {
  image(img, 0, 0); // Displays PImage from point (0,0) 
  img.loadPixels();

  // Create a second PImage same size as the original
  PImage edgeImg = createImage(img.width, img.height, RGB);

  // Loop through every pixel in the image
  for (int y = blurFactor; y < img.height - blurFactor; y++) {   // Skip top and bottom edges
    for (int x = blurFactor; x < img.width - blurFactor; x++) {  // Skip left and right edges
      float sumR = 0; // Kernel sum for red value of this pixel
      float sumG = 0; // Kernel sum for green value of this pixel
      float sumB = 0; // Kernel sum for blue value of this pixel
      
      for (int ky = -blurFactor; ky <= blurFactor; ky++) {
        for (int kx = -blurFactor; kx <= blurFactor; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*img.width + (x + kx);
          // Image is Color, extract RGB values for pixels
          float valR = red(img.pixels[pos]);
          float valG = green(img.pixels[pos]);
          float valB = blue(img.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          sumR += kernel[ky+blurFactor][kx+blurFactor] * valR;
          sumG += kernel[ky+blurFactor][kx+blurFactor] * valG;
          sumB += kernel[ky+blurFactor][kx+blurFactor] * valB;
        }
      }
      // For this pixel in the new image, set the color valuee
      // based on the sum from the kernel
      edgeImg.pixels[y*img.width + x] = color(sumR,sumG,sumB);
    }
  }
  //int pix = 6000;
  //println("Original",red(img.pixels[pix]),green(img.pixels[pix]),blue(img.pixels[pix]));
  //println("Blurred", red(edgeImg.pixels[pix]),green(edgeImg.pixels[pix]),blue(edgeImg.pixels[pix]));  

  // Updating pixels in edgeImg
  edgeImg.updatePixels();

  // Drawing new edgeImg
  image(edgeImg, width/2, 0); 
}
