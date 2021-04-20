# -- This is an iteration of code done for CSC 500 at UNCW for the final project -- Drunken Cockroach

# -- importing relevant libraries
import random
import turtle
import math

# -- This is creating a new class called Drunk. It is inheriting functionality from the Turtle class and thus is a
# -- subclass of the Turtle class. It has a randomly initiated position but done so in ranges of 40 so that it always
# -- starts the center of a grid. It also has initiated y and x coordinate values and has destination y and x values
# -- that can be used to calculate the distance traveled.
class Drunk(turtle.Turtle):
    def __init__(self):
        super().__init__()
        self.speed = 0
        self.penup()
        self.setposition(random.randrange(-400, 400, 40), random.randrange(-400, 400, 40))
        self.pendown()
        self.dot(20, 'black')
        self.pensize(3)
        self.shape()
        self.pencolor('red')
        self.homeY = self.setY()
        self.homeX = self.setX()
        self.destinationX = self.destX()
        self.destinationY = self.destY()

# -- This method chooses a random angle in 45 degree increments and sets the heading of the object to that angle as well
# -- as returning that value so that it can be used by other functions
    def setAngle(self):
        angle = [0, 45, 90, 135, 180, 225, 270, 315]
        angle2 = angle[random.randint(0, 7)]
        self.setheading(angle2)
        return angle2

# -- This function is what moves the object. Due to the diagonals being a longer distance, the function determines first
# -- the angle. If it is moving horizontally or vertically it will move 40. If it is moving diagonally it will move
# -- 56.57. This will keep in on the center of the grids (nearly).
    def move(self, Angle2):
        if Angle2 in [0, 90, 180, 270]:
            self.forward(40)
        else:
            self.forward(56.57)

# -- the following methods allow the programmer to set new values to the home and destination coordinates as well as
# -- return those values if need be.
    def setX(self):
        homeX = self.xcor()

        return homeX

    def setY(self):
        homeY = self.ycor()

        return homeY

    def destX(self):
        destX = self.xcor()

        return destX

    def destY(self):
        destY = self.ycor()

        return destY

    def setDestX(self):
        self.destinationX = self.destX()

    def setDestY(self):
        self.destinationY = self.destY()

    def returnHomeX(self):
        return self.homeX

    def returnHomeY(self):
        return self.homeY

    def returnDestX(self):
        return self.destinationX

    def returnDestY(self):
        return self.destinationY

# -- This method is used to calculate the distance between the two points of the object -- Its home coordinates which
# -- are set when the object is initiated and its destination coordinates which are updated every time it moves.
    def calcDistance(self):
        distance = math.sqrt(((self.destinationX - self.homeX)**2) + ((self.destinationY - self.homeY)**2))

        return distance

# -- This function simply draws the distance between its home and destination coordinates in blue
    def DrawDistance(self):
        self.penup()
        self.goto(self.homeX, self.homeY)
        self.pencolor("blue")
        self.pendown()
        self.goto(self.destinationX, self.destinationY)
        self.penup()

# -- These functions are taken from the bouncing balls example in our book and stop the Drunk objects from going outside
# -- of the grid. There is one small change of an additional + or -1. This is to fix a bug caused by the computer being
# -- very accurate and not rounding. It would take something like 399.9999 as not being on 400 and would allow the Drunk
# -- object to leave the grid
    def atLeftEdge(self, screen_width):
        if (self.xcor() - 40) <= ((-screen_width / 2) + 1):
            return True
        else:
            return False

    def atRightEdge(self, screen_width):
        if (self.xcor() + 40) >= ((screen_width / 2) - 1):
            return True
        else:
            return False

    def atTopEdge(self, screen_height):
        if (self.ycor() + 40) >= ((screen_height / 2) - 1):
            return True
        else:
            return False

    def atBottomEdge(self, screen_height):
        if (self.ycor() - 40) <= ((-screen_height / 2) + 1):
            return True
        else:
            return False

# -- This function sets the amount of moves the player would like and does so in an error catching way
def setMoves():
    flag = True
    while flag:
        try:
            moves = int(input("Enter a number of moves to make: "))
            if moves > 0:
                flag = False
            else:
                print('You have entered a negative number of seconds or zero!')
        except:
            print('You have entered wrong format for a number of seconds!')
    return moves

# -- This function sets the "key" or how many creatures the user wants and does so in an error catching way.
def setKey():
    flag = True
    while flag:
        try:
            key = int(input("how many creatures would you like?"))
            if key > 0:
                flag = False
            else:
                print('You have entered a negative number of seconds or zero!')
        except:
            print('You have entered wrong format for a number of creatures!')
    return key

# -- This creates the grid used for the program
def grid(obj, window):
    width = window.window_width()
    halfW = width // 2
    height = window.window_height()
    halhH = height // 2
    obj.speed(0)
    for x in range(-halfW, halfW + 40, 40):
        obj.penup()
        obj.setposition(x, halhH)
        obj.pendown()
        obj.setposition(x, -halhH)
    for y in range(-halhH, halhH + 40, 40):
        obj.penup()
        obj.setposition(halfW, y)
        obj.pendown()
        obj.setposition(-halfW, y)

def calc_total_dist(creatures):
    total_dist = 0
    for x in creatures:
        total_dist += (Drunk.calcDistance(x))
    return total_dist

def calc_avg_dist(creatures):
    total_dist = 0
    for x in creatures:
        total_dist += (Drunk.calcDistance(x))
    avg_dist = total_dist/len(creatures)
    return avg_dist
# -- Main --

print("This program simulates a random (Drunkard's) Walk")

# -- These functions capture the amount of moves and amount of creatures the user wants
moves = int(setMoves())
key = int(setKey())

# -- This sets up the windows an even 800 by 800
turtle.setup(800, 800)
screen_width = 800
screen_height = 800
window = turtle.Screen()
window.title('My first turtle graphic program')
drunkTurtle = turtle.getturtle()

# -- This creates the grid in the same window we previously created
grid(drunkTurtle, window)

# -- This creates an empty list -- creatures. It then iterates using a for loop in range from 0 to the "key" or
# -- the amount of creatures the player wants to be created. Each loop it iterates a new instance of the Object "Drunk".
# -- The objects are initialized at random on the board.
creatures = []
for k in range(0, key):
    creatures.append(Drunk())

# -- This creates the movement of the creatures. For range of 0 to the amount of moves the user wants to goes through
# -- each Drunk object in the creature list one at a time. It generates a random angle and then checks the creature to
# -- see if the creature is on an edge. If it is on an edge it changes the angle to the opposite direction of the edge
# -- and then moves. If it is not on an edge it moves based on the random angle generated initially. It also sets the
# -- destination value in each object to the new location it has moved too.
for a in range(0, moves):
    for b in creatures:
        i = Drunk.setAngle(b)
        if Drunk.atLeftEdge(b, screen_width):
            b.setheading(0)
            Drunk.move(b, 0)
            Drunk.setDestX(b)
            Drunk.setDestY(b)
        elif Drunk.atRightEdge(b, screen_width):
            b.setheading(180)
            Drunk.move(b, 180)
            Drunk.setDestX(b)
            Drunk.setDestY(b)
        elif Drunk.atTopEdge(b, screen_height):
            b.setheading(270)
            Drunk.move(b, 270)
            Drunk.setDestX(b)
            Drunk.setDestY(b)
        elif Drunk.atBottomEdge(b, screen_height):
            b.setheading(90)
            Drunk.move(b, 90)
            Drunk.setDestX(b)
            Drunk.setDestY(b)
        else:
            Drunk.move(b, i)
            Drunk.setDestX(b)
            Drunk.setDestY(b)

# -- This function then iterates through each Drunk object in the list creatures and uses the DrawDistance function
# -- to draw a blue line from its starting point to its final destination.
for c in creatures:
    Drunk.DrawDistance(c)

# -- This prints out the starting x and y coordinates and the ending x and y coordinates as well as the distance
# -- travelled by the creature at the end
for d in creatures:
    print(str(Drunk.returnHomeX(d)) + " starting x coordinate , "+str(Drunk.returnHomeY(d))+" :starting y coordinate")
    print(str(Drunk.returnDestX(d)) + " :ending x coordinate , " + str(Drunk.returnDestY(d))+ " :ending y coordinate")
    print(str(Drunk.calcDistance(d)) + " distance moved")

# -- This makes it so the turtle window only closes after a click and will stay open for observation until that has
# -- happened.
window.exitonclick()
