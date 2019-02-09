pragma solidity ^0.5.1;

// Import statements here
// Import statements here

/**
  * @title
  * @author Radial Manner
  * @notice Factory contract creating a simple collateral position
  *         between two counterparties.
 */

contract CollatFactory {
    address[] public collatAddresses;
    
    function createCollat() public {
        Collat c = new Collat();
        collatAddresses.push(address(c));
    }
    
    function getCollatCount() public view returns(uint collatCount) {
        return collatAddresses.length;
    }
}

contract Collat { 
    
    // Variables here
    // At this point I'm just testing Github access from the desktop app
    
    constructor () public {
        // TODO
    }
}