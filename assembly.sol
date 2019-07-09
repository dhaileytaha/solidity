pragma solidity ^0.4.0;

contract Assembly {
    function nativeLoop() public returns(uint _r){
        for(uint i=0; i < 10 ; i++){
            _r++;
        }
    }
    function asmLoop() public returns(uint _r){
        assembly {
            let i := 0
            loop:
            i := add(1, i)
            _r := add(1, _r)
            jumpi(loop, lt(i, 10))
        }
    }
    function nativeCondition(uint _v) public returns (uint){
        if(5 == _v){
            return 55;
        }
        if(6 == _v){
            return 66;
        }
        return 11;
    }
    function asmCondition(uint _v) public returns(uint _r){
        assembly {
            switch _v 
            case 5 {
                _r := 55
            }
            case 6 {
                _r := 66
            }
            default {
                _r := 11
            }
        }
    }
}

