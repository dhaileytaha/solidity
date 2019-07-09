pragma solidity ^0.4.0;

contract Transaction {
    
    event SenderLog(address);
    event ValueLog(uint);
    event BlockTimestamp(uint);
    event gasPrice(uint);
    event orginOfTranx(address);
    event BlockNumber(uint);
    
    function () payable {
        SenderLog(msg.sender);
        ValueLog(msg.value);
        BlockTimestamp(now);
        gasPrice(tx.gasprice);
        orginOfTranx(tx.origin);
        BlockNumber(block.number);
    }
       
}