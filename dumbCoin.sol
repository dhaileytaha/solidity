// pragma solidity ^0.4.0;

// contract DumbCoin {
    
//     address deployer;
//     mapping(address=>uint) balances;
    
//     function DumbCoin() public {
//         deployer = msg.sender;
//     }
    
//     function createCoins(uint amount, address receiver) public {
        
//         if(msg.sender == deployer){
//                 balances[receiver] += amount;    
//         } else {
//             throw;
//         }
//     }
//     function viewBalance() returns(uint) {
//         return balances[msg.sender];
//     }
// }
// pragma solidity ^0.4.X;

pragma solidity ^0.4.24;

contract Coin {
    
    address creator;
    mapping(address => uint) public balance;
    
    function Coin(){
        creator = msg.sender;
    }
    
    function createCoin(address receiver, uint amount) public {
        if(msg.sender == creator){
            balance[receiver] += amount;
        } else {
            throw;
        }
     }
     
    function transfer(address receiver, uint amount) {
        require(amount > 0 && balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
    }

}
