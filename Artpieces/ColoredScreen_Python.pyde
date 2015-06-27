resolution = 3 #Change this parameter to change the square size

def setup():
    size(1200,600)
    rectMode(CENTER)
    noStroke()

def draw():
    for i in range(resolution/2, width, resolution):
        for j in range(resolution/2,height,resolution):
            fill(random(0,255),random(0,255),random(0,255))
            rect(i,j,resolution, resolution)