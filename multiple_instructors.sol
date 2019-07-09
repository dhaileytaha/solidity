pragma solidity ^0.4.0;

contract Owned {
    
    address contractCreator;
    
    function Owned(){
        contractCreator = msg.sender;
    }
    modifier onlyOwner() {
        require(msg.sender == contractCreator);
        _;
    }
}

contract Instructor is Owned {
    
        address creator;
        struct Instructors {
            string fname;
            string lname;
            uint age;
        }
        
        
    mapping (address => Instructors) mapInstructor;
    
    address[] public InstructorAddr;
    
    function Instructor() {
        creator = msg.sender;
    }
    
    function setInstructor(address _address, string _fname, string _lname, uint _age) onlyOwner  {
        var Instructors = mapInstructor[_address];
        
        Instructors.fname = _fname;
        Instructors.lname = _lname;
        Instructors.age = _age;
        
        InstructorAddr.push(_address);
    }
    
    function getInstructorAddr() view public returns(address[]){
        return InstructorAddr;
    }
    function getInstructor(address _address) view public returns (string, string, uint){
        return (mapInstructor[_address].fname, mapInstructor[_address].lname, mapInstructor[_address].age);   
    }
    function countInstructor() view public returns(uint){
        return InstructorAddr.length;
    }
}