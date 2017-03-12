from scrollbar import *

board = None
dataTable = None
button = 0
def setup():
    global board
    global data
    size(1050,400)
    board = loadImage("letterboard.png")
    
    
def draw():
    global board
    global button
    background(255)
    image(board,0,0,500,300)
    image(board,550,0,500,300)
    dataTable = loadTable("sampledata2.csv", "header")
    
    button = inc_button(500,300)
    button.make()
    
    noStroke()
    for i in range(0,button.returnCount()):
        row = dataTable.getRow(i)
        fill(color(255,0,0,50))
        ellipse(row.getInt("x"),row.getInt("y"),10,10)
        fill(color(0,0,255,50))
        ellipse(row.getInt("x2"),row.getInt("y2"),10,10)

def mousePressed():
    button.inc()
    
class inc_button:
    def __init__(self,x,y):
        self.x = x
        self.y = y
        self.count = 0
    def make(self):
        fill(0)
        rect(self.x,self.y, 50, 50)
    def inc(self):
        self.count += 1
    def returnCount(self):
        return self.count