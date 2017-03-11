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
    for i in range(0,4):
        row = dataTable.getRow(i)
        ellipse(row.getInt("x"),row.getInt("y"),10,10)