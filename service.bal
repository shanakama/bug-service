import ballerina/http;

type Greeting record {|
    string to;
    string content;
|};

Greeting greeting = {to: "World", content: "Welcome to Ballerina!"};
service http:Service / on new http:Listener(9090) {
    resource function get greeting() returns string {
        string message = string `Hello ${greeting.to}! ${greeting.content}`;
        return message;
    }
}
