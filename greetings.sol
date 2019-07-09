pragma solidity ^0.4.0;

contract HelloWorld {
    
    address myAddress;
    string greeting;
    
    function HelloWorld() {
        
        myAddress = msg.sender;
    }
    
    function greet() constant returns (string) {
        return greeting;
    }
    function setGreeting(string _greeting) {
        greeting = _greeting;
    }
}