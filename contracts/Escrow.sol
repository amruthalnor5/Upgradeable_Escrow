//SPDX-License-Identifier: MIT

// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

pragma solidity ^0.8.2;

contract Escrow {

    struct Trade {
        address partyA;
        address partyB;
        uint val;
        bool isSuccess;
    }

    mapping(uint => Trade) trades;

    uint public tradeId;

    // function initialize() public initializer {}

    receive() external payable {}

    function makeTrade(address _partyB) public payable returns(bool) {
        require(msg.value > 0, "Amount must be grater than zero!");
        tradeId++;
        trades[tradeId] = Trade(msg.sender, _partyB, msg.value, false);
        return true;
    }

    function makeRelease(uint _tradeId) public returns(bool) {
        require(_tradeId > 0, "TradeId Require");
        Trade memory _trade = trades[_tradeId];
        require(!_trade.isSuccess, "Trade is already success");
        require(msg.sender == _trade.partyA, "Not valid party");
        _trade.isSuccess = true;
        trades[_tradeId] = _trade; 
        (bool succ, ) = _trade.partyB.call{value:_trade.val}("");
        require(succ, "Transaction fail!");
        return succ;
    }

    function getTrade(uint _tradeId) public view returns(Trade memory)  {
        return trades[_tradeId];
    }

}


//0x1E2eA8CDFDB8152F599b5Ab3b444F14b239fe54e