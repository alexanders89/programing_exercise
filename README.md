# Programing Exercise

## Objective
Write a program that makes http (and https) requests to specified URLs and to report on certain properties of the responses it receives

## Main Requirements

• The program is invoked from the command line and it consumes its input from stdin.
• The program output is written to stdout and errors are written to stderr.
• Input format is a newline separated list of public web addresses, such as
http://www.bbc.co.uk/iplayer
https://google.com
bad://address
http://www.bbc.co.uk/missing/thing
http://not.exists.bbc.co.uk/
http://www.oracle.com/technetwork/java/javase/downloads/index.html https://www.pets4homes.co.uk/images/articles/1646/large/kitten-emergencies-signs-to-look-out-for- 537479947ec1c.jpg
http://site.mockito.org/
• The program should make an http GET request to each valid address in its input and record particular properties of the http response in the program output.
• The properties of interest are status code, content length and date-time of the response. These are normally available in the http response headers.
• Output is a stream of JSON format documents that provide information about the http response for each address in the input, such as
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
• The program should identify and report invalid URLs, e.g. those that don't start with http:// or https://, or contain characters not allowed in a URL.
• The program should cope gracefully when it makes a request to a slow or non-responsive web server, e.g. it could time out the request after ten seconds.
• The program should have a good set of unit tests.
• It must be possible to perform a test run, consisting of all unit tests, without accessing the Internet.
## My Approach
