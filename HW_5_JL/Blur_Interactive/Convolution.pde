color convolution(int x, int y, float[][] matrix, int matrixSize, PImage img) {

  // Initalize RGB variable that will be used in calculations
  float rTotal = 0.0, gTotal = 0.0, bTotal = 0.0;
  
  int offset = matrixSize / 2;
  // Loop through convolution matrix
  for (int i = 0; i < matrixSize; i++){
    for (int j= 0; j < matrixSize; j++){
      // What pixel are we testing.  This set which pixels are being looked at: ± pixel of interest
      // in both the x and y directions
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we have not walked off the edge of the pixel array
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      // We sum all the neighboring pixels multiplied by the values in the convolution matrix.
      rTotal += (red(img.pixels[loc]) * matrix[i][j]);
      gTotal += (green(img.pixels[loc]) * matrix[i][j]);
      bTotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rTotal = constrain(rTotal,0,255);
  gTotal = constrain(gTotal,0,255);
  bTotal = constrain(bTotal,0,255);
  // Return the resulting color
  return color(rTotal,gTotal,bTotal);
}
