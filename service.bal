import ballerina/http;

type Greeting record {|
    string to;
    string content;
|};

configurable int port = 9090;
Greeting greeting = {to: "World", content: "Welcome to Ballerina!"};
service http:Service / on new http:Listener(port) {
    resource function get greeting() returns string {
        string message = string `Hello ${greeting.to}! ${greeting.content}`;
        return message;
    }
}
