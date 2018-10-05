PImage img;
int[] originalPxls;
int rSelect;
int[] blemishes_x = new int[20];
int[] blemishes_y = new int[20];
int wormWidth = 10;
int halfWormWidth = wormWidth / 2;
int[] basePixels;
Snake iSnake;


void setup() {
  size(687,1024);
  img = loadImage("mona_lisa.jpg"); 
  image(img, 0, 0);
  loadPixels();
  originalPxls = pixels;
  for(int i = 0; i < 20; i++){
      rSelect = int(random(0, pixelWidth * pixelHeight));
      //rSelectRow = int(rSelect / pixelWidth);
      blemishes_y[i] = int(rSelect / pixelWidth);
      //blemishes_x[i] = rSelectRow;
      //rSelectCol = rSelect % pixelWidth;
      blemishes_x[i] = rSelect % pixelWidth;
      //blemishes_y[i] = rSelectCol;
      color c = color(255, 255, 255);
      for(int j=-halfWormWidth; j < halfWormWidth; j++){
          for( int k= -halfWormWidth ; k < halfWormWidth; k++){
              if((blemishes_y[i] + j < pixelHeight) && (blemishes_x[i] + k < pixelWidth) && (k > 0) && (j > 0)){
                  pixels[pixelWidth * (blemishes_x[i] + j) + ( blemishes_y[i] + k)] =  c;
              }
          }  
      }
  }
  updatePixels();
  basePixels = pixels;
  iSnake =  new Snake(5, 10, blemishes_x, blemishes_y, wormWidth);
}

void draw() {
  pixels = basePixels;
  iSnake.moveWorm();
  updatePixels();
}
