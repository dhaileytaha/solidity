pragma solidity ^0.4.18;

contract DragonStone {
    
    address public creator;
    mapping (address => uint) public balances;
    uint constant public PRICE = 5000000000000000000; // 5 ether;
    
    function DragonStone() {
         creator = msg.sender;
    }
    
    function create() payable {
        require(msg.value > 0 && msg.value % PRICE == 0 );
        balances[msg.sender] += (msg.value/PRICE);
    }
    
    function transfer(address receiver, uint amount){
        if(balances[msg.sender] < amount) throw;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }
}