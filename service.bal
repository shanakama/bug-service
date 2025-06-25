import ballerina/http;

type Greeting record {|
    string to;
    string content;
|};

configurable Greeting greeting = ?;

service http:Service / on new http:Listener(9090) {
    resource function post greeting() returns string {
        string message = string `Hello ${greeting.to}! ${greeting.content}`;
        return message;
    }
}
