# Programing Exercise

## Objective
Write a program that makes http (and https) requests to specified URLs and to report on certain properties of the responses it receives

## Main Requirements

* The program is invoked from the command line and it consumes its input from stdin.
* The program output is written to stdout and errors are written to stderr.
* Input format is a newline separated list of public web addresses, such as
http://www.bbc.co.uk/iplayer
https://google.com
bad://address
http://www.bbc.co.uk/missing/thing
http://not.exists.bbc.co.uk/
http://www.oracle.com/technetwork/java/javase/downloads/index.html https://www.pets4homes.co.uk/images/articles/1646/large/kitten-emergencies-signs-to-look-out-for- 537479947ec1c.jpg
http://site.mockito.org/
* The program should make an http GET request to each valid address in its input and record particular properties of the http response in the program output.
* The properties of interest are status code, content length and date-time of the response. These are normally available in the http response headers.
* Output is a stream of JSON format documents that provide information about the http response for each address in the input, such as
{
"Url": "http://www.bbc.co.uk/iplayer", "Status_code": 200,
"Content_length": 209127,
"Date": "Tue, 25 Jul 2017 17:00:55 GMT"
} {
} {
"Error": "invalid url" }
"Url": "https://google.com", "Status_code": 302,
"Content_length": 262,
"Date": "Tue, 25 Jul 2017 17:00:55 GMT"
"Url": "bad://address",
Programming Exercise, September 2017
* The program should identify and report invalid URLs, e.g. those that don't start with http:// or https://, or contain characters not allowed in a URL.
* The program should cope gracefully when it makes a request to a slow or non-responsive web server, e.g. it could time out the request after ten seconds.
* The program should have a good set of unit tests.
* It must be possible to perform a test run, consisting of all unit tests, without accessing the Internet.

## How to use

Note - This was built using Ruby 2.4.0

1. Clone this repo and run bundle to install the necessary gems
2. Change into the lib directory and run ruby interface.rb
3. This will open the user interface
* 1 - This is used to check individual URL's one at a time
* 2 - Check multiple URL will let you build a list to check in one go
* 3 - This will show a list from the directory 'sample_data' and receive a filename to load.
3. The checker can also be run in irb by requiring './lib/report', creating a new report with a given url and printing the output to the terminal
4. To run the rspec tests, in the main directory run rspec. Note if you are also running multireport spec there will need to be data in the sample_data folder.


## My Approach

Using a tdd approach I started by first building a report class that can handle single url requests.
This created a new report object with each url passed into it on initialization.
From here there are individual methods to fetch each bit of info needed using the HTTParty client. If I were doing this again I would probably refactor so only one request is made for each report to speed things up.

Once the report class was built and tested I went to work building a class that can handle multiple url's as I didn't want this functionality in the one class.

Once the working components were tested and functional I built a simple interface to take input from the user and run the test.

Git commit history included.
