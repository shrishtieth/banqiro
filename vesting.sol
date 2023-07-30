    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.9;

interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}
library Counters {
    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
        unchecked {
            counter._value += 1;
        }
    }

    function decrement(Counter storage counter) internal {
        uint256 value = counter._value;
        require(value > 0, "Counter: decrement overflow");
        unchecked {
            counter._value = value - 1;
        }
    }

    function reset(Counter storage counter) internal {
        counter._value = 0;
    }
}


    contract Vesting is  Ownable {
    using Counters for Counters.Counter;
    mapping(address => bool) public allowedToCall;
    address public banqiroToken;
    uint256 public totalTokensVested;
    uint256 public totalTokensUnvested;
    uint256 public preSaleEnd;
    uint256 public cliff = 15780000;
    
    address[] public allUsers;
    mapping(address => bool) public added;
    mapping(address => uint256) public userVestedAmount;
    mapping(address => uint256) public userClaimedAmount;
    mapping(uint256 => uint256) public monthToPercentage;
    
    event Vested(address indexed user, uint256 amount);
    event Unvested(address indexed user, uint256 amount);

    constructor(address token) {
       banqiroToken = token;
    

    }

    function vestTokens(address user, uint256 amount) public {
        // require(allowedToCall[msg.sender],"Access Denied");
         if(added[user] == false){
           allUsers.push(user);
           added[user] = true;
         }
         userVestedAmount[user] += amount;
         totalTokensVested += amount;
         emit Vested(user, amount);
    }

    function withdrawTokens() external{
        uint256 unlockedAmount = getUserUnlockedAmount(msg.sender);
        if(unlockedAmount - userVestedAmount[msg.sender] > 0){
            IERC20(banqiroToken).transfer(msg.sender, unlockedAmount - userVestedAmount[msg.sender]);
            emit Unvested(msg.sender, unlockedAmount - userVestedAmount[msg.sender]);
        }

    }

    function getUserUnlockedAmount(address user) public view returns(uint256 amount){
        
        if(block.timestamp < preSaleEnd + cliff || block.timestamp -(preSaleEnd + cliff) % 2630000 < 1 ){
            amount = 0;
        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 1 && block.timestamp -(preSaleEnd + cliff) % 2630000 < 7 ){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            amount = (200*userVestedAmount[user]*months)/10000;

        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 7 && block.timestamp -(preSaleEnd + cliff) % 2630000 < 13 ){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            amount = ((1200 + (225 * (months-6)))*userVestedAmount[user])/10000;

        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 13 && block.timestamp -(preSaleEnd + cliff) % 2630000 < 19 ){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            amount = ((2550 + (275 * (months-12)))*userVestedAmount[user])/10000;

        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 19 && block.timestamp -(preSaleEnd + cliff) % 2630000 < 25 ){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            amount = ((4200 + (300 * (months-18)))*userVestedAmount[user])/10000;

        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 25 && block.timestamp -(preSaleEnd + cliff) % 2630000 < 31 ){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            amount = ((6000 + (325 * (months-24)))*userVestedAmount[user])/10000;

        }
        else if(block.timestamp -(preSaleEnd + cliff) % 2630000 >= 31){
            uint256 months = block.timestamp -(preSaleEnd + cliff) % 2630000;
            if(months > 36){
                months = 36;
            }
            amount = ((7950 + (350 * (months-30)))*userVestedAmount[user])/10000;

        }
    

    }

    function updateAllowed(address user, bool allowed) external onlyOwner{
        allowedToCall[user] = allowed;
    }




}
