pragma solidity ^0.4.0;

contract StateModifiers {
     
     uint private constant constantVariable = 55;
     uint private stateVariable;
    
    function stateFunction() public returns(uint){
        stateVariable = 10;
        return stateVariable;
    }
    
    function constantFunction() public constant returns(uint){
        return stateVariable;
    }
    function viewFunction() public view returns(uint){
        return stateVariable;
    }
    function pureFunction() public pure returns(uint){
        return constantVariable;
    }
    
}