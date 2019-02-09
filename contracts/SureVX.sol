pragma solidity ^0.5.1;

import 'SafeMath.sol';

/// @title
/// @author Radial Manner
/// @notice Factory contract creating a simple collateral position between two counterparties.

contract CollatFactory {
    address[] private collatAddresses;
    mapping (address => address) private collatCPTY1;
    
    function createCollat() public returns(address) {
        Collat c = new Collat();
        collatAddresses.push(address(c));
        collatCPTY1[msg.sender] = address(c);
        return address(c);
    }
    
    function getCollatCount() public view returns(uint collatCount) {
        return collatAddresses.length;
    }
    
    /// @return array of addresses of ALL Collats
    function getCollatAddresses() public view returns(address[] memory) {
        return collatAddresses;
    }
    
}

contract Collat { 
    
    // Variables here
    // At this point I'm just testing Github access from the desktop app
    
    constructor () public {
        // TODO
    }
}