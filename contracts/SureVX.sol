pragma solidity ^0.5.0;

//import 'SafeMath.sol';
//import 'Ownable.sol';

/// @title SureVX
/// @author Radial Manner
/// @notice Factory contract creating a simple collateral position between two counterparties.

contract CollatFactory {
    address[] private collatAddresses;
    mapping (address => address) private collatCPTY1;
    
    /// @return address of newly created Collat
    function createCollat(address _cpty2, uint _amount) public returns(address) {
        address cpty1 = msg.sender;
        Collat c = new Collat(cpty1, _cpty2, _amount);
        collatAddresses.push(address(c));
        collatCPTY1[msg.sender] = address(c);
        return address(c);
    }
    
    /// @return uint - number of collats
    function getCollatCount() public view returns(uint collatCount) {
        return collatAddresses.length;
    }
    
    /// @return array of addresses of ALL Collats
    function getCollatAddresses() public view returns(address[] memory) {
        return collatAddresses;
    }
    
}

contract Collat { 
    
        address public cpty1;
        address public cpty2;
        uint public amount;

    constructor (address _cpty1, address _cpty2, uint _amount) public {
            cpty1 = _cpty1;
            cpty2 = _cpty2;
            amount = _amount;
    }
    
    function getCollatInfo() public view returns (address, address, uint) {
        return (cpty1, cpty2, amount);
    }
}