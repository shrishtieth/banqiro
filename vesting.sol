    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.19;

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
    	function totalSupply() external view returns(uint256);

    	/**
    	 * @dev Returns the amount of tokens owned by `account`.
    	 */
    	function balanceOf(address account) external view returns(uint256);

    	/**
    	 * @dev Moves `amount` tokens from the caller's account to `to`.
    	 *
    	 * Returns a boolean value indicating whether the operation succeeded.
    	 *
    	 * Emits a {Transfer} event.
    	 */
    	function transfer(address to, uint256 amount) external returns(bool);

    	/**
    	 * @dev Returns the remaining number of tokens that `spender` will be
    	 * allowed to spend on behalf of `owner` through {transferFrom}. This is
    	 * zero by default.
    	 *
    	 * This value changes when {approve} or {transferFrom} are called.
    	 */
    	function allowance(address owner, address spender) external view returns(uint256);

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
    	function approve(address spender, uint256 amount) external returns(bool);

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
    	) external returns(bool);
    }
    abstract contract Context {
    	function _msgSender() internal view virtual returns(address) {
    		return msg.sender;
    	}

    	function _msgData() internal view virtual returns(bytes calldata) {
    		return msg.data;
    	}
    }

	library Address {
    /**
     * @dev The ETH balance of the account is not enough to perform the operation.
     */
    error AddressInsufficientBalance(address account);

    /**
     * @dev There's no code at `target` (it is not a contract).
     */
    error AddressEmptyCode(address target);

    /**
     * @dev A call to an address target failed. The target may have reverted.
     */
    error FailedInnerCall();

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://consensys.net/diligence/blog/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.8.20/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        if (address(this).balance < amount) {
            revert AddressInsufficientBalance(address(this));
        }

        (bool success, ) = recipient.call{value: amount}("");
        if (!success) {
            revert FailedInnerCall();
        }
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason or custom error, it is bubbled
     * up by this function (like regular Solidity function calls). However, if
     * the call reverted with no returned reason, this function reverts with a
     * {FailedInnerCall} error.
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     */
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        if (address(this).balance < value) {
            revert AddressInsufficientBalance(address(this));
        }
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResultFromTarget(target, success, returndata);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and reverts if the target
     * was not a contract or bubbling up the revert reason (falling back to {FailedInnerCall}) in case of an
     * unsuccessful call.
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata
    ) internal view returns (bytes memory) {
        if (!success) {
            _revert(returndata);
        } else {
            // only check if target is a contract if the call was successful and the return data is empty
            // otherwise we already know that it was a contract
            if (returndata.length == 0 && target.code.length == 0) {
                revert AddressEmptyCode(target);
            }
            return returndata;
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and reverts if it wasn't, either by bubbling the
     * revert reason or with a default {FailedInnerCall} error.
     */
    function verifyCallResult(bool success, bytes memory returndata) internal pure returns (bytes memory) {
        if (!success) {
            _revert(returndata);
        } else {
            return returndata;
        }
    }

    /**
     * @dev Reverts with returndata if present. Otherwise reverts with {FailedInnerCall}.
     */
    function _revert(bytes memory returndata) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert FailedInnerCall();
        }
    }
}

interface IERC20Permit {
    /**
     * @dev Sets `value` as the allowance of `spender` over ``owner``'s tokens,
     * given ``owner``'s signed approval.
     *
     * IMPORTANT: The same issues {IERC20-approve} has related to transaction
     * ordering also apply here.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `deadline` must be a timestamp in the future.
     * - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
     * over the EIP712-formatted function arguments.
     * - the signature must use ``owner``'s current nonce (see {nonces}).
     *
     * For more information on the signature format, see the
     * https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
     * section].
     *
     * CAUTION: See Security Considerations above.
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /**
     * @dev Returns the current nonce for `owner`. This value must be
     * included whenever a signature is generated for {permit}.
     *
     * Every successful call to {permit} increases ``owner``'s nonce by one. This
     * prevents a signature from being used multiple times.
     */
    function nonces(address owner) external view returns (uint256);

    /**
     * @dev Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}

library SafeERC20 {
    using Address for address;

    /**
     * @dev An operation with an ERC20 token failed.
     */
    error SafeERC20FailedOperation(address token);

    /**
     * @dev Indicates a failed `decreaseAllowance` request.
     */
    error SafeERC20FailedDecreaseAllowance(address spender, uint256 currentAllowance, uint256 requestedDecrease);

    /**
     * @dev Transfer `value` amount of `token` from the calling contract to `to`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeTransfer(IERC20 token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeCall(token.transfer, (to, value)));
    }

    /**
     * @dev Transfer `value` amount of `token` from `from` to `to`, spending the approval given by `from` to the
     * calling contract. If `token` returns no value, non-reverting calls are assumed to be successful.
     */
    function safeTransferFrom(IERC20 token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeCall(token.transferFrom, (from, to, value)));
    }

    /**
     * @dev Increase the calling contract's allowance toward `spender` by `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeIncreaseAllowance(IERC20 token, address spender, uint256 value) internal {
        uint256 oldAllowance = token.allowance(address(this), spender);
        forceApprove(token, spender, oldAllowance + value);
    }

    /**
     * @dev Decrease the calling contract's allowance toward `spender` by `requestedDecrease`. If `token` returns no value,
     * non-reverting calls are assumed to be successful.
     */
    function safeDecreaseAllowance(IERC20 token, address spender, uint256 requestedDecrease) internal {
        unchecked {
            uint256 currentAllowance = token.allowance(address(this), spender);
            if (currentAllowance < requestedDecrease) {
                revert SafeERC20FailedDecreaseAllowance(spender, currentAllowance, requestedDecrease);
            }
            forceApprove(token, spender, currentAllowance - requestedDecrease);
        }
    }

    /**
     * @dev Set the calling contract's allowance toward `spender` to `value`. If `token` returns no value,
     * non-reverting calls are assumed to be successful. Meant to be used with tokens that require the approval
     * to be set to zero before setting it to a non-zero value, such as USDT.
     */
    function forceApprove(IERC20 token, address spender, uint256 value) internal {
        bytes memory approvalCall = abi.encodeCall(token.approve, (spender, value));

        if (!_callOptionalReturnBool(token, approvalCall)) {
            _callOptionalReturn(token, abi.encodeCall(token.approve, (spender, 0)));
            _callOptionalReturn(token, approvalCall);
        }
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address-functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data);
        if (returndata.length != 0 && !abi.decode(returndata, (bool))) {
            revert SafeERC20FailedOperation(address(token));
        }
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     *
     * This is a variant of {_callOptionalReturn} that silents catches all reverts and returns a bool instead.
     */
    function _callOptionalReturnBool(IERC20 token, bytes memory data) private returns (bool) {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We cannot use {Address-functionCall} here since this should return false
        // and not revert is the subcall reverts.

        (bool success, bytes memory returndata) = address(token).call(data);
        return success && (returndata.length == 0 || abi.decode(returndata, (bool))) && address(token).code.length > 0;
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
    	function owner() public view virtual returns(address) {
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

    	function current(Counter storage counter) internal view returns(uint256) {
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


    contract Vesting is Ownable {
    	using Counters for Counters.Counter;
		using SafeERC20 for IERC20;
		
    	mapping(address => bool) public allowedToCall;
    	address public banqiroToken;
    	uint256 public totalTokensVested;
    	uint256 public totalTokensUnvested;
    	uint256 public preSaleEnd = 1712577600 ;
    	uint256 public cliff = 15780000;
        uint256 public monthSeconds = 2592000;

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

    	function updatebanqiroTokenAddress(address token) external onlyOwner {
    		banqiroToken = token;
    	}

    	function setPreSaleEnd(uint256 endTime) external onlyOwner {
    		preSaleEnd = endTime;
    	}

    	function updateCliff(uint256 _cliff) external onlyOwner {
    		cliff = _cliff;
    	}

    	function vestTokens(address user, uint256 amount) public {
    		require(allowedToCall[msg.sender], "Access Denied");
    		if (added[user] == false) {
    			allUsers.push(user);
    			added[user] = true;
    		}
    		userVestedAmount[user] += amount;
    		totalTokensVested += amount;
    		emit Vested(user, amount);
    	}

    	function withdrawTokens() external {
    		uint256 unlockedAmount = getUserUnlockedAmount(msg.sender);
    		uint256 claimableAmount = unlockedAmount - userClaimedAmount[msg.sender];
    		if (claimableAmount > 0) {
    			IERC20(banqiroToken).safeTransfer(msg.sender, claimableAmount);
    			userClaimedAmount[msg.sender] += claimableAmount;
    			emit Unvested(msg.sender, claimableAmount);
    		}

    	}

		function getMonth() external  view returns (uint256 months){
			return((block.timestamp - (preSaleEnd + cliff)) / monthSeconds);
		}

    	function getUserUnlockedAmount(address user) public view returns(uint256 amount) {
            if (block.timestamp < preSaleEnd + cliff ){
                amount = 0;
            }
    		else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 1) {
				uint256 currentBlock = getMonthBlock(((block.timestamp - (preSaleEnd + cliff)) / monthSeconds) + 1);
				uint256 blockAmount = (currentBlock * ((200 * userVestedAmount[user]) / 10000))/864000;
    			amount = 0 + blockAmount;
    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 1 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 7) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 6){
                blockAmount = (currentBlock * ((225 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((200 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = ((200 * userVestedAmount[user] * months) / 10000) + blockAmount ;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 7 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 13) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 12){
                blockAmount = (currentBlock * ((275 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((225 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = (((1200 + (225 * (months - 6))) * userVestedAmount[user]) / 10000) + blockAmount;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 13 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 19) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 18){
                blockAmount = (currentBlock * ((300 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((275 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = (((2550 + (275 * (months - 12))) * userVestedAmount[user]) / 10000) + blockAmount;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 19 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 25) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 24){
                blockAmount = (currentBlock * ((325 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((300 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = (((4200 + (300 * (months - 18))) * userVestedAmount[user]) / 10000) + blockAmount;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 25 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 31) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 30){
                blockAmount = (currentBlock * ((350 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((325 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = (((6000 + (325 * (months - 24))) * userVestedAmount[user]) / 10000) + blockAmount;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 31 && (block.timestamp - (preSaleEnd + cliff)) / monthSeconds < 36) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
				uint256 currentBlock = getMonthBlock(months + 1);
				uint256 blockAmount;
				if(months == 35){
                blockAmount = (currentBlock * ((300 * userVestedAmount[user]) / 10000))/864000;
				}
				else{
				blockAmount = (currentBlock * ((350 * userVestedAmount[user]) / 10000))/864000;
				}
    			amount = (((7950 + (350 * (months - 30))) * userVestedAmount[user]) / 10000) + blockAmount;

    		} else if ((block.timestamp - (preSaleEnd + cliff)) / monthSeconds >= 36) {
    			uint256 months = (block.timestamp - (preSaleEnd + cliff)) / monthSeconds;
    			if (months > 36) {
    				months = 36;
    			}
    			amount = (10000 * userVestedAmount[user]) / 10000;
    		}

    	}


		function getMonthBlock(uint256 month) public view returns(uint256 currentBlock){
			uint256 monthStart = preSaleEnd + cliff + ((month - 1) * monthSeconds);
			currentBlock = (block.timestamp - monthStart)/3;
		}

    	function updateAllowed(address user, bool allowed) external onlyOwner {
    		allowedToCall[user] = allowed;
    	}

    	function withdrawTokens(IERC20 token, address wallet) external onlyOwner {
    		uint256 balanceOfContract = token.balanceOf(address(this));
    		token.safeTransfer(wallet, balanceOfContract);
    	}

    }
