PImage img;
int[] original_pxls;
int rSelect;
int rSelectRow;
int rSelectCol;
int wormWidth = 20;
int halfWormWidth = wormWidth / 2;


void setup() {
  size(687,1024);
  img = loadImage("mona_lisa.jpg"); 
  image(img, 0, 0);
  loadPixels();
  original_pxls = pixels;
  for(int i = 0; i < 20; i++){
      rSelect = int(random(0, pixelWidth * pixelHeight));
      rSelectRow = int(rSelect / pixelWidth);
      rSelectCol = rSelect % pixelWidth;
      color c = color(255, 255, 255);
      for(int j=-halfWormWidth; j < halfWormWidth; j++){
          for( int k= -halfWormWidth ; k < halfWormWidth; k++){
              if((rSelectRow + j < pixelHeight) && (rSelectCol + k < pixelWidth) && (k > 0) && (j > 0)){
                  pixels[pixelWidth * (rSelectRow + j) + ( rSelectCol + k)] = c;
              }
          }  
      }
  }
  updatePixels();
  //image(img, 0, 0);
  //img = loadImage("mona_lisa.jpg"); 
}

//void draw() {
  
//}
