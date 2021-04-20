import random
from automate import automate_not_win

# This function finds possible "empty" spots on the board AKA spaces occupied by " - "
# and appends them to a new list. This new list is used in the following function to provide a random
# location to place an "O"


def possibility(board):
    possible_spots = []

    for i in range(len(board)):
        for j in range(len(board)):

            if board[i][j] == "-":
                possible_spots.append((i, j))
    return possible_spots

# This function takes the list provided by the previous function and "picks" a spot to place an "O"


def randomize(board):
    selection = possibility(board)
    current_loc = random.choice(selection)
    print("\n")
    print("The computer makes a move!")
    print("\n")
    board[current_loc[0]][current_loc[1]] = "O"
    for row in board:
        print(row)
    print('\n')


# This program creates a game of tic tac toe using 2D lists aka matrices
# It creates 4 functions, 2 of which simply print out to the user the necessary instructions
# The function win runs through a bunch of if statements checking to see if either player has won
# The function tic tac toe is what creates the matrix and uses the win function as well as a simple tied variable
# along with a while loop to continuously run while checking for a winner.
# This function provides a simple greeting to the user about the program
def tictactoe_welcome():
    print("\n")
    print("This program allows two players to play Tic-Tac-Toe together")
    print("Player one is X and player two is O")
    print("This program terminates after a tie or one player wins")


# This function demonstrates the program to help the user understand its function
def tictactoe_input():
    print("\n")
    print("In order to access the grid, put in 0, 1, or 2 for the corresponding row")
    print("Follow this with the column in which you want to access")
    print("for instance 1 followed by a 2 would create the following:")
    print("\n")
    print(" -   -   - ")
    print(" -   -   X ")
    print(" -   -   - ")
    print("\n")


# This function provides a win function to be continuously checked for by the follow up program
def win(a):

    # Checks horizontally for either player winning in any of the rows
    if a[0][0] == 'X' and a[0][1] == 'X' and a[0][2] == 'X':
        print("Player One: You have won the game!")
        return True

    if a[0][0] == 'O' and a[0][1] == 'O' and a[0][2] == 'O':
        print("Player Two: You have won the game!")
        return True

    if a[1][0] == 'X' and a[1][1] == 'X' and a[1][2] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[1][0] == 'O' and a[1][1] == 'O' and a[1][2] == 'O':
        print("Player Two: You have won the game!")
        return True

    if a[2][0] == 'X' and a[2][1] == 'X' and a[2][2] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[2][0] == 'O' and a[2][1] == 'O' and a[2][2] == 'O':
        print("Player Two: You have won the game!")
        return True

    # vertically checks for either player winning in any of the columns

    if a[0][0] == 'X' and a[1][0] == 'X' and a[2][0] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[0][0] == 'O' and a[1][0] == 'O' and a[2][0] == 'O':
        print("Player Two: You have won the game!")
        return True

    if a[0][1] == 'X' and a[1][1] == 'X' and a[2][1] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[0][1] == 'O' and a[1][1] == 'O' and a[2][1] == 'O':
        print("Player Two: You have won the game!")
        return True

    if a[0][2] == 'X' and a[1][2] == 'X' and a[2][2] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[0][2] == 'O' and a[1][2] == 'O' and a[2][2] == 'O':
        print("Player Two: You have won the game!")
        return True

    # Diagonally checks if either player has one in either diagonal direction

    if a[0][0] == 'X' and a[1][1] == 'X' and a[2][2] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[0][0] == 'O' and a[1][1] == 'O' and a[2][2] == 'O':
        print("Player Two: You have won the game!")
        return True

    if a[0][2] == 'X' and a[1][1] == 'X' and a[2][0] == 'X':
        print("Player One: You have won the game!")
        return True
    if a[0][2] == 'O' and a[1][1] == 'O' and a[2][0] == 'O':
        print("Player Two: You have won the game!")
        return True

    return False

# This is the function that creates the 2D list and the game of tic tac toe


def tictactoe():
    tictactoe_board = [
        ["-", "-", "-"],
        ["-", "-", "-"],
        ["-", "-", "-"]
    ]

    print('Program Start:')
    print("\n")

    # This prints out the 2D list for the viewer
    for row in tictactoe_board:
        print(row)

    print("\n")

    # Initializing variables to be used later (Global Variables)
    player = 1
    tied = 0

    # This will only run while the win function returns false and the tied variable does not = 9
    # This works as there are only 9 possible indexes and if all 9 have been filled and neither player has won
    # Then the game is a tie
    # The rest of the code is just error checking to make sure integers are entered and that they are either
    # 0, 1, or 2 and not another integer as this breaks the game
    # The game switches between players by setting player to 1 and subtracting from 1 if player one is successful
    # If player two is successful on the other hand it adds 1 to the player variable and allows player one to go
    # Lastly, it adds one to the variable tied every time either player one or two is successful
    # if neither of them have won and the variable is at 9 then the game must be a tie
    while not(win(tictactoe_board)) and tied != 9:
        if player == 1:
            try:
                row_two = int(input("Player One: Please enter the row number: "))
                column = int(input("Player One: Please enter the column number: "))
                if row_two < 0 or row_two > 2:
                    print("\n")
                    print("You have entered an incorrect integer. Please try again")
                    print("\n")
                elif column < 0 or column > 2:
                    print("\n")
                    print("You have entered an incorrect integer. Please try again")
                    print("\n")
                elif tictactoe_board[row_two][column] == "O" or tictactoe_board[row_two][column] == "X":
                    print("\n")
                    print("You have entered digits that correspond to an already filled spot")
                    print('Please try again')
                    print('\n')
                else:
                    print("\n")
                    tictactoe_board[row_two][column] = "X"
                    player -= 1
                    tied += 1
                    for row in tictactoe_board:
                        print(row)
                    print('\n')

            except ValueError:
                print("\n")
                print("You have failed to enter an integer. Try again")
                print('\n')

        else:
            if automate_not_win(tictactoe_board):
                player += 1
                tied += 1
            else:
                possibility(tictactoe_board)
                randomize(tictactoe_board)
                player += 1
                tied += 1

    if tied == 9 and not(win(tictactoe_board)):
        print("The game has ended in a tie!")


# At this point the functions have been created. They are called in conjunction to create the program
tictactoe_welcome()

tictactoe_input()

tictactoe()
