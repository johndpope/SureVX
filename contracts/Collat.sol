pragma solidity ^0.5.0;

import './SafeMath.sol';

contract Collat {
    
    using SafeMath for uint256;
    
    address payable public poster;
    address payable public benef;

    bool public posterStatus = false;
    bool public benefStatus = false;
    
    uint256 public collatVal;
    
    event PosterValidated(address indexed poster, bool posterStatus);
    event BenefValidated(address indexed, bool benefStatus);
    event PosterWithdrew(address indexed poster, uint amount);
    event BenefClaimed(address indexed benef, uint amount);

    constructor(address payable _cpty2) public payable {
        poster = msg.sender;
        benef = _cpty2;
        collatVal = msg.value;
    }
    
    function benefValidate() public {
        require(msg.sender == benef);
        require(!benefStatus);
        benefStatus = true;
        emit BenefValidated(msg.sender, benefStatus);
    }
    
    function posterValidate() public {
        require(msg.sender == poster);
        require(!posterStatus);
        posterStatus = true;
        emit PosterValidated(msg.sender, posterStatus);
    }
    
    function posterWithdraw() public {
        require(msg.sender == poster);
        require(!benefStatus);
        poster.transfer(collatVal);
        emit PosterWithdrew(msg.sender, collatVal);
        collatVal = 0;
    }
    
    function benefClaimFunds() public {
        require(msg.sender == benef);
        require(benefStatus && posterStatus);
        benef.transfer(collatVal);
        emit BenefClaimed(msg.sender, collatVal);
        collatVal = 0;
    }
    
}

