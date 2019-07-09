pragma solidity ^0.4.0;

contract Owned {
    
    address creator;
    
    function Owned() {
        creator = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == creator);
        _;
    }
}

contract Voting is Owned {

    
    mapping(string => bool) check;
    // other stuff
    mapping(address => string) users;
    
    //mapping(string => User) public check;

    function Owner() view public returns (address){
        return creator;
    }

    function createUser(string _email) public {
        users[msg.sender] = _email;
    }
    function checkUser(string _email) public view returns(bool){
        return check[_email];
    }
    function approveUser(string _email) public onlyOwner {
        check[_email] = true;
    }
}
