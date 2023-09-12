// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Referal is Ownable {
   

    mapping(address => address) public referedBy;
    mapping(address => address[]) public getRefrees;
    mapping(address => uint256) public referredTime;
    mapping(address => bool) public isWhitelisted;
    

    event Registered(address indexed user, address indexed referrer);

  
    constructor() {
        isWhitelisted[0xFCAd0B19bB29D4674531d6f115237E16AfCE377c] = true;
    }
      
    function register(address referrer) external{
        require(referrer!= msg.sender,"User can't refer himself");
        require(referedBy[msg.sender] == address(0),"Already registered");
        referedBy[msg.sender] = referrer;
        getRefrees[referrer].push(msg.sender);
        referredTime[msg.sender] = block.timestamp;
        emit Registered(msg.sender, referrer);
    }

    function getReferrer(address user) external  view returns(address){
        return(referedBy[user]);
    }

    function getAllRefrees(address user) external  view returns(address[] memory){
        return(getRefrees[user]);
    }        

    function handleWhitelist(address[] memory user, bool isTrue) external onlyOwner {
        for(uint256 i=0; i<user.length; i++){
            isWhitelisted[user[i]] = isTrue;
        }
    }                                               
}
