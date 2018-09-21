void saturn(float saturnDiam, float saturn_x, float saturn_y) {
  pushMatrix();
    translate(saturn_x, saturn_y);
    globe = createShape(SPHERE, saturnDiam/2);
    globe.setTexture(saturnImg);
    noStroke();
    noFill();
    shape(globe);
  popMatrix();
}
