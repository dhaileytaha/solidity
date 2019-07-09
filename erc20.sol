pragma solidity ^0.4.0;

import "browser/safemath.sol";

contract MyToken {
    
    
    using SafeMath for uint;
    
    string public constant name = "My Token";
    string public constant symbol = "MTK";
    uint public constant decimals = 18;  // 18 is the most common number of decimal places

    uint private constant _totalSupply = 1000;

    mapping (address=>uint) balances;
    
    mapping (address => mapping (address => uint )) allowed;
    

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    
    
    function balanceOf(address tokenOwner) public constant returns (uint balance){
         return balances[tokenOwner];
    }
    
   function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        Transfer(msg.sender, to, tokens);
        return true;
    }
    
    function totalSupply() public constant returns (uint){
        return _totalSupply;
    }
    
    function transferFrom(address from, address to, uint tokens) public returns (bool success){
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].sub(tokens);
        Transfer(from, to, tokens);
        return true;
    }
    
    function approve(address spender, uint tokens) public returns (bool success){
        allowed[msg.sender][spender] = tokens;
        Approval(msg.sender, spender, tokens);
        return true;
    }
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
}