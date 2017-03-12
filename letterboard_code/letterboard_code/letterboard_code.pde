PImage board;
import controlP5.*;


Slider timeSlider;
ControlP5 p5;
void setup() {
  size(1050,400);
  board = loadImage("letterboard.png");
  p5 = new ControlP5(this);
  timeSlider = p5.addSlider("timeSlider")
                 .setPosition(width / 2 - 45, 350)
                 .setValue(0)
                 .setMax(1000);
}

void draw() {
  background(255);
  image(board,0,0,500,300);
  image(board,550,0,500,300);
  
  Table dataTable = loadTable("sampledata2.csv", "header");
  int val = floor(int(timeSlider.getValue()));
  noStroke();
  for(int i = 0; i < val; i++) {
    TableRow row = dataTable.getRow(i);
    fill(color(255,0,0,50));
    ellipse(row.getInt("x"),row.getInt("y"),10,10);
    fill(color(0,0,255,50));
    ellipse(row.getInt("x2"),row.getInt("y2"),10,10);
  }
}
