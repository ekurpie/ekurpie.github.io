import sys
import requests

# print("This program is a basic HTTP client. It can perform both GET and PUT requests")
# print("The format of this program is like such: HTTPClient.py Host Port Operation Filename")


# initializaed main method
if __name__ == '__main__':

    try:
    # This yells at the user to make sure they are using enough arguments
        if len(sys.argv) < 4:
            print("you did not enter enough arguments")
            print("Remember the format is like such: HTTPClient.py Host Port Operation Filename")

        # if there are just 4 arguments, the program assumes the last one is missing and tries to do a GET request
        # and then prints off the values instead of storing them.
        elif len(sys.argv) == 4:
            host = sys.argv[1]
            port = sys.argv[2]
            operation = sys.argv[3]

            if operation == "GET":
                full_request = "http://" + host + ":" + port
                connection = requests.get(full_request)
                print(connection.content)

        # If there are 5 arguments then it assigns each argument to a variable for later use
        elif len(sys.argv) == 5:
            host = sys.argv[1]
            port = sys.argv[2]
            operation = sys.argv[3]
            filename = sys.argv[4]

        # If the operaton value is GET then it performs a get request. It does this using the request library and by
        # concatenating the variable values to get the correct url/port/filename format
            if operation == "GET":
                full_request = "http://" + host + ":" + port + "/" + filename
                connection = requests.get(full_request)

                # it then writes the file to the same folder as the client. If its successful it prints success!.
                with open(filename, "wb") as f:
                    f.write(connection.content)
                if connection.status_code == 200:
                    print("success!")

        # If the operaton value is PUT then it performs a PUT request. It does this using the request library and by
        # concatenating the variable values to get the correct url/port/filename format. It opens the file in question for reading
        # and has to be organized properly to work. It also sends the filename as a parameter which makes it easier for the
        # server to operate.
            if operation == "PUT":
                put_request = "http://" + host + ":" + port
                files = open(filename,"rb")

                connection = requests.put(put_request,data = files, params = filename)
                if connection.status_code == 200:
                    print("success!")
    except:
        print("Something has gone wrong. Please try again.")
        print("Remember the format is like such: HTTPClient.py Host Port Operation Filename")











#   python HTTPClient.py en.wikipedia.org 80 GET wiki/Black_hole
#   python HTTPClient.py localhost 10000 PUT test5.txt