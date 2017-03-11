board = None
dataTable = None

def setup():
    global board
    global data
    size(500,300)
    board = loadImage("letterboard.png")
    
    
    
    
def draw():
    global board
    image(board,0,0,500,300)
    dataTable = loadTable("sampledata.csv", "header")
    noStroke()
    for i in range(0,dataTable.getRowCount()):
        row = dataTable.getRow(i)
        fill(color(255,0,0,25))
        ellipse(row.getInt("x"),row.getInt("y"),10,10)