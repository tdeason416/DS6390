PShape a;
PShape b;
PShape c;
PShape d;
PShape f;
PShape g;
PShape h;

void setup() {
  size(1718, 1079);
  background(224, 226, 225);
  
  a = createShape();
  a.beginShape();
  a.fill(20, 24, 25);
  a.noStroke();
  a.vertex(426, 235);
  a.vertex(616, 238);
  a.vertex(613, 431);
  a.vertex(421, 431);
  a.endShape(CLOSE);
  
  b = createShape();
  b.beginShape();
  b.fill(20, 24, 25);
  b.noStroke();
  b.vertex(243, 388);
  b.vertex(317,345);
  b.vertex(411, 496);
  b.vertex(340, 541);
  b.endShape(CLOSE);
  
  c = createShape();
  c.beginShape();
  c.fill(200, 156, 0);
  c.noStroke();
  c.vertex(452, 510);
  c.vertex(775, 500);
  c.vertex(761, 727);
  c.vertex(447, 653);
  c.endShape(CLOSE);
  
  d = createShape();
  d.beginShape();
  d.fill(35, 23, 37);
  d.noStroke();
  d.vertex(1272, 202);
  d.vertex(1697, 521);
  d.vertex(1617, 859);
  d.vertex(1202, 637);
  d.endShape(CLOSE);
  
  fill(27, 124, 45);
  noStroke();
  ellipse(189, 634, 54, 54);
  
  //e = createShape();
  //e.beginShape();
  //e.fill(0, 0, 255);
  //e.noStroke();
  //e.vertex(0, 0);
  //e.vertex(0, 50);
  //e.vertex(50, 50);
  //e.vertex(50, 0);
  //e.endShape(CLOSE);
  
  f = createShape();
  f.beginShape();
  f.fill(190, 65, 47);
  f.noStroke();
  f.vertex(227, 578);
  f.vertex(243, 579);
  f.vertex(236, 737);
  f.vertex(219, 737);
  f.endShape(CLOSE);
  
  g = createShape();
  g.beginShape();
  g.fill(173, 43, 23);
  g.noStroke();
  g.vertex(246, 501);
  g.vertex(292, 496);
  g.vertex(305, 606);
  g.vertex(258, 611);
  g.endShape(CLOSE);
  
  h = createShape();
  h.beginShape();
  h.fill(6, 42, 84);
  h.noStroke();
  h.vertex(521, 171);
  h.vertex(551, 173);
  h.vertex(472, 889);
  h.vertex(443, 866);
  h.endShape(CLOSE);
  
}

void draw() {
  shape(d);
  shape(c);
  //shape(e, 25, 25);
  shape(f);
  shape(g);
  shape(h);
  shape(b);
  shape(a);
}
