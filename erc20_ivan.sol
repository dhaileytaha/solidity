pragma solidity ^0.4.0;

contract NewCoin {
    
    mapping(address => uint)balances;
    uint supply;
    mapping(address=>mapping(address=>uint))approved;
    
    //approved[_owner][_spender]
    
    //ERC20
    function totalSupply() constant returns (uint totalSupply){
            return supply = 10000;
    }    
    function balanceOf(address _owner) constant returns (uint balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value && _value > 0){
            
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            
            return true;
        } else {
            
            //failed transaction
            return false;
        }
    }
        function transferFrom(address _from, address _to, uint _value) returns (bool success){
            
            if(balances[_from] >= _value &&
                approved[_from][msg.sender] >= _value &&
                _value >0){
                    balances[_from] -= _value;
                    approved[_from][msg.sender] -= _value;
                    balances[_to] += _value;
                    return true;
                }
        }
function allowance(address _owner, address _spender) constant returns (uint remaining){
                return approved[_owner][_spender];
    }
    
    function approve(address _spender, uint _value) returns (bool success){
            if(balances[msg.sender] > _value && _value > 0){
                approved[msg.sender][_spender] = _value;
                return true;
            } else {
                return false;
            }
    }
    
    //our own
    function mint(uint numberOfCoin) public {
        balances[msg.sender] += numberOfCoin;
        supply += numberOfCoin;
    }    
    
    function getMyBalance () returns (uint amount){
        return balances[msg.sender];
    }
    
}