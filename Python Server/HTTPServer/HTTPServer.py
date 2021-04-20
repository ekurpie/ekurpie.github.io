import http.server
import socketserver
import os
import sys

#This file is an HTTP Server. It was much harder than the HTTP Server at least as far as PUT requests go.
# I created my own class called MyServer which extends the SimpleHTTPRequestHandler. I created a method/function within
# the file that deals with PUT requests.

class MyServer(http.server.SimpleHTTPRequestHandler):
    def do_PUT(self):
        """
        This functions deals with PUT requests and writes to the same folder the HTTPServer.py file is in

        """
        #This path variable gets the path to the server file location.
        path = self.translate_path(self.path)

        #This gets the length of the content being sent.
        length = int(self.headers['Content-Length'])

        #This section here is how we get the filename from the PUT request.
        filename = ""
        count = 0
        for i in str(self.requestline):
            if i == "?":
                count += 1
            elif count > 0:
                if i == " ":
                    break
                else:
                    filename += i

        #This combines the path with the filename so that we can write to a new file with the same name as the file
        # Being sent.
        path2 = os.path.join(path, filename)

        #this creates a new variable data that reads the data of the length noted in the header.
        data = self.rfile.read(length)


        #This writes the file to the path in question.
        with open(path2, 'wb') as f:
            f.write(data)

        #This sends back an OK response. The self.end_headers is necessary for everything to work correctly.
        self.send_response(200)
        self.send_header("Content-Type","text/html")
        self.end_headers()

        #This sets the main method
if __name__ == '__main__':

    try:
    #This gets the PORT number in question from the arguments at command line
        PORT = int(sys.argv[1])

        #These create the actual server with the PORT number in question. It serves forever until interrupted.
        Handler = MyServer
        with socketserver.TCPServer(("",PORT), Handler) as httpd:
            print("Serving at port",PORT)
            httpd.serve_forever()
    except:
        print("Something has gone wrong. Please try again.")
        print("Remember the format is like such: HTTPServer.py Port")