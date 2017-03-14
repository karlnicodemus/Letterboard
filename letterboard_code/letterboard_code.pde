PImage board;
import controlP5.*;
import java.io.*;
import java.nio.charset.*;
import java.util.*;

Slider timeSlider;
ControlP5 p5;
void setup() {
  size(1050,400);
  board = loadImage("letterboard.png");
  p5 = new ControlP5(this);
  timeSlider = p5.addSlider("timeSlider")
                 .setPosition(width / 2 - 45, 350)
                 .setValue(0)
                 .setMax(100);

}
LinkedList<point> points = new LinkedList<point>();
public class point {
  int x;
  int y;
  public point (int x, int y) {
    this.x = x;
    this.y = y;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
}

void draw() {
  background(255);
  image(board,0,0,500,300);
  image(board,550,0,500,300);
  timeSlider.setValue(timeSlider.getValue() + .05);
  
  String line;
  try {
    InputStream fis = new FileInputStream("documents/realdata.txt");
    InputStreamReader isr = new InputStreamReader(fis, Charset.forName("UTF-8"));
    BufferedReader br = new BufferedReader(isr);
    int xVal, yVal;

    while ((line = br.readLine()) != null) {
        String[] words = line.split(",");
        if (int(words[0]) / 1000.0 < timeSlider.getValue()) {
          xVal = 500 - Integer.parseInt(words[1].trim()) * 500 / 33;
          yVal = Integer.parseInt(words[2].trim()) * 300 / 27;
          points.add(new point(xVal, yVal));
          if (points.size() > 10) {
            points.remove();
          }
          fill(color(255, 0, 0, 50));
          //System.out.println("points length: " + points.size());          
        }
    }
  } catch (Exception e) {
    System.out.println(e);
  }
  for (point point : points) {
    ellipse(point.getX(), point.getY(), 10, 10);
  }
  //Table dataTable = loadTable("sampledata2.csv", "header");
  //int val = floor(int(timeSlider.getValue()));
  //noStroke();
  //for(int i = 0; i < val; i++) {
  //  TableRow row = dataTable.getRow(i);
  //  fill(color(255,0,0,50));
  //  ellipse(row.getInt("x"),row.getInt("y"),10,10);
  //  fill(color(0,0,255,50));
  //  ellipse(row.getInt("x2"),row.getInt("y2"),10,10);
  //}
}