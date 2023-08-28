/**
 *Submitted for verification at BscScan.com on 2022-12-15
 */

// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8 .9;
library SafeMath {
	/**
	 * @dev Returns the addition of two unsigned integers, with an overflow flag.
	 *
	 * _Available since v3.4._
	 */
	function tryAdd(uint256 a, uint256 b) internal pure returns(bool, uint256) {
		unchecked {
			uint256 c = a + b;
			if (c < a) return (false, 0);
			return (true, c);
		}
	}

	/**
	 * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
	 *
	 * _Available since v3.4._
	 */
	function trySub(uint256 a, uint256 b) internal pure returns(bool, uint256) {
		unchecked {
			if (b > a) return (false, 0);
			return (true, a - b);
		}
	}

	/**
	 * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
	 *
	 * _Available since v3.4._
	 */
	function tryMul(uint256 a, uint256 b) internal pure returns(bool, uint256) {
		unchecked {
			// Gas optimization: this is cheaper than requiring 'a' not being zero, but the
			// benefit is lost if 'b' is also tested.
			// See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
			if (a == 0) return (true, 0);
			uint256 c = a * b;
			if (c / a != b) return (false, 0);
			return (true, c);
		}
	}

	/**
	 * @dev Returns the division of two unsigned integers, with a division by zero flag.
	 *
	 * _Available since v3.4._
	 */
	function tryDiv(uint256 a, uint256 b) internal pure returns(bool, uint256) {
		unchecked {
			if (b == 0) return (false, 0);
			return (true, a / b);
		}
	}

	/**
	 * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
	 *
	 * _Available since v3.4._
	 */
	function tryMod(uint256 a, uint256 b) internal pure returns(bool, uint256) {
		unchecked {
			if (b == 0) return (false, 0);
			return (true, a % b);
		}
	}

	/**
	 * @dev Returns the addition of two unsigned integers, reverting on
	 * overflow.
	 *
	 * Counterpart to Solidity's `+` operator.
	 *
	 * Requirements:
	 *
	 * - Addition cannot overflow.
	 */
	function add(uint256 a, uint256 b) internal pure returns(uint256) {
		return a + b;
	}

	/**
	 * @dev Returns the subtraction of two unsigned integers, reverting on
	 * overflow (when the result is negative).
	 *
	 * Counterpart to Solidity's `-` operator.
	 *
	 * Requirements:
	 *
	 * - Subtraction cannot overflow.
	 */
	function sub(uint256 a, uint256 b) internal pure returns(uint256) {
		return a - b;
	}

	/**
	 * @dev Returns the multiplication of two unsigned integers, reverting on
	 * overflow.
	 *
	 * Counterpart to Solidity's `*` operator.
	 *
	 * Requirements:
	 *
	 * - Multiplication cannot overflow.
	 */
	function mul(uint256 a, uint256 b) internal pure returns(uint256) {
		return a * b;
	}

	/**
	 * @dev Returns the integer division of two unsigned integers, reverting on
	 * division by zero. The result is rounded towards zero.
	 *
	 * Counterpart to Solidity's `/` operator.
	 *
	 * Requirements:
	 *
	 * - The divisor cannot be zero.
	 */
	function div(uint256 a, uint256 b) internal pure returns(uint256) {
		return a / b;
	}

	/**
	 * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
	 * reverting when dividing by zero.
	 *
	 * Counterpart to Solidity's `%` operator. This function uses a `revert`
	 * opcode (which leaves remaining gas untouched) while Solidity uses an
	 * invalid opcode to revert (consuming all remaining gas).
	 *
	 * Requirements:
	 *
	 * - The divisor cannot be zero.
	 */
	function mod(uint256 a, uint256 b) internal pure returns(uint256) {
		return a % b;
	}

	/**
	 * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
	 * overflow (when the result is negative).
	 *
	 * CAUTION: This function is deprecated because it requires allocating memory for the error
	 * message unnecessarily. For custom revert reasons use {trySub}.
	 *
	 * Counterpart to Solidity's `-` operator.
	 *
	 * Requirements:
	 *
	 * - Subtraction cannot overflow.
	 */
	function sub(
		uint256 a,
		uint256 b,
		string memory errorMessage
	) internal pure returns(uint256) {
		unchecked {
			require(b <= a, errorMessage);
			return a - b;
		}
	}

	/**
	 * @dev Returns the integer division of two unsigned integers, reverting with custom message on
	 * division by zero. The result is rounded towards zero.
	 *
	 * Counterpart to Solidity's `/` operator. Note: this function uses a
	 * `revert` opcode (which leaves remaining gas untouched) while Solidity
	 * uses an invalid opcode to revert (consuming all remaining gas).
	 *
	 * Requirements:
	 *
	 * - The divisor cannot be zero.
	 */
	function div(
		uint256 a,
		uint256 b,
		string memory errorMessage
	) internal pure returns(uint256) {
		unchecked {
			require(b > 0, errorMessage);
			return a / b;
		}
	}

	/**
	 * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
	 * reverting with custom message when dividing by zero.
	 *
	 * CAUTION: This function is deprecated because it requires allocating memory for the error
	 * message unnecessarily. For custom revert reasons use {tryMod}.
	 *
	 * Counterpart to Solidity's `%` operator. This function uses a `revert`
	 * opcode (which leaves remaining gas untouched) while Solidity uses an
	 * invalid opcode to revert (consuming all remaining gas).
	 *
	 * Requirements:
	 *
	 * - The divisor cannot be zero.
	 */
	function mod(
		uint256 a,
		uint256 b,
		string memory errorMessage
	) internal pure returns(uint256) {
		unchecked {
			require(b > 0, errorMessage);
			return a % b;
		}
	}
}
abstract contract Context {
	function _msgSender() internal view virtual returns(address) {
		return msg.sender;
	}

	function _msgData() internal view virtual returns(bytes calldata) {
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

interface Referal {
	function getReferrer(address user) external view returns(address);

	function getAllRefrees(address user) external view returns(address[] memory);

	function isWhitelisted(address user) external view returns(bool);
}

interface Vesting {
	function vestTokens(address user, uint256 amount) external;
}

interface IUniswapV2Factory {
	event PairCreated(
		address indexed token0,
		address indexed token1,
		address pair,
		uint256
	);

	function feeTo() external view returns(address);

	function feeToSetter() external view returns(address);

	function getPair(address tokenA, address tokenB)
	external
	view
	returns(address pair);

	function allPairs(uint256) external view returns(address pair);

	function allPairsLength() external view returns(uint256);

	function createPair(address tokenA, address tokenB)
	external
	returns(address pair);

	// function setFeeTo(address) external;
	// function setFeeToSetter(address) external;
}



interface IUniswapV2Pair {
	event Approval(
		address indexed owner,
		address indexed spender,
		uint256 value
	);
	event Transfer(address indexed from, address indexed to, uint256 value);

	function name() external pure returns(string memory);

	function symbol() external pure returns(string memory);

	function decimals() external pure returns(uint8);

	function totalSupply() external view returns(uint256);

	function balanceOf(address owner) external view returns(uint256);

	function allowance(address owner, address spender)
	external
	view
	returns(uint256);

	function approve(address spender, uint256 value) external returns(bool);

	function transfer(address to, uint256 value) external returns(bool);

	function transferFrom(
		address from,
		address to,
		uint256 value
	) external returns(bool);

	function DOMAIN_SEPARATOR() external view returns(bytes32);

	function PERMIT_TYPEHASH() external pure returns(bytes32);

	function nonces(address owner) external view returns(uint256);

	function permit(
		address owner,
		address spender,
		uint256 value,
		uint256 deadline,
		uint8 v,
		bytes32 r,
		bytes32 s
	) external;

	event Mint(address indexed sender, uint256 amount0, uint256 amount1);
	event Burn(
		address indexed sender,
		uint256 amount0,
		uint256 amount1,
		address indexed to
	);
	event Swap(
		address indexed sender,
		uint256 amount0In,
		uint256 amount1In,
		uint256 amount0Out,
		uint256 amount1Out,
		address indexed to
	);
	event Sync(uint112 reserve0, uint112 reserve1);

	function MINIMUM_LIQUIDITY() external pure returns(uint256);

	function factory() external view returns(address);

	function token0() external view returns(address);

	function token1() external view returns(address);

	function getReserves()
	external
	view
	returns(
		uint112 reserve0,
		uint112 reserve1,
		uint32 blockTimestampLast
	);

	function price0CumulativeLast() external view returns(uint256);

	function price1CumulativeLast() external view returns(uint256);

	function kLast() external view returns(uint256);

	function mint(address to) external returns(uint256 liquidity);

	function burn(address to)
	external
	returns(uint256 amount0, uint256 amount1);

	function swap(
		uint256 amount0Out,
		uint256 amount1Out,
		address to,
		bytes calldata data
	) external;

	function skim(address to) external;

	function sync() external;

	function initialize(address, address) external;
}



interface IUniswapV2Router01 {
	function factory() external pure returns(address);

	function WETH() external pure returns(address);

	function addLiquidity(
		address tokenA,
		address tokenB,
		uint256 amountADesired,
		uint256 amountBDesired,
		uint256 amountAMin,
		uint256 amountBMin,
		address to,
		uint256 deadline
	)
	external
	returns(
		uint256 amountA,
		uint256 amountB,
		uint256 liquidity
	);

	function addLiquidityETH(
		address token,
		uint256 amountTokenDesired,
		uint256 amountTokenMin,
		uint256 amountETHMin,
		address to,
		uint256 deadline
	)
	external
	payable
	returns(
		uint256 amountToken,
		uint256 amountETH,
		uint256 liquidity
	);

	function removeLiquidity(
		address tokenA,
		address tokenB,
		uint256 liquidity,
		uint256 amountAMin,
		uint256 amountBMin,
		address to,
		uint256 deadline
	) external returns(uint256 amountA, uint256 amountB);

	function removeLiquidityETH(
		address token,
		uint256 liquidity,
		uint256 amountTokenMin,
		uint256 amountETHMin,
		address to,
		uint256 deadline
	) external returns(uint256 amountToken, uint256 amountETH);

	function removeLiquidityWithPermit(
		address tokenA,
		address tokenB,
		uint256 liquidity,
		uint256 amountAMin,
		uint256 amountBMin,
		address to,
		uint256 deadline,
		bool approveMax,
		uint8 v,
		bytes32 r,
		bytes32 s
	) external returns(uint256 amountA, uint256 amountB);

	function removeLiquidityETHWithPermit(
		address token,
		uint256 liquidity,
		uint256 amountTokenMin,
		uint256 amountETHMin,
		address to,
		uint256 deadline,
		bool approveMax,
		uint8 v,
		bytes32 r,
		bytes32 s
	) external returns(uint256 amountToken, uint256 amountETH);

	function swapExactTokensForTokens(
		uint256 amountIn,
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external returns(uint256[] memory amounts);

	function swapTokensForExactTokens(
		uint256 amountOut,
		uint256 amountInMax,
		address[] calldata path,
		address to,
		uint256 deadline
	) external returns(uint256[] memory amounts);

	function swapExactETHForTokens(
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external payable returns(uint256[] memory amounts);

	function swapTokensForExactETH(
		uint256 amountOut,
		uint256 amountInMax,
		address[] calldata path,
		address to,
		uint256 deadline
	) external returns(uint256[] memory amounts);

	function swapExactTokensForETH(
		uint256 amountIn,
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external returns(uint256[] memory amounts);

	function swapETHForExactTokens(
		uint256 amountOut,
		address[] calldata path,
		address to,
		uint256 deadline
	) external payable returns(uint256[] memory amounts);

	function quote(
		uint256 amountA,
		uint256 reserveA,
		uint256 reserveB
	) external pure returns(uint256 amountB);

	function getAmountOut(
		uint256 amountIn,
		uint256 reserveIn,
		uint256 reserveOut
	) external pure returns(uint256 amountOut);

	function getAmountIn(
		uint256 amountOut,
		uint256 reserveIn,
		uint256 reserveOut
	) external pure returns(uint256 amountIn);

	function getAmountsOut(uint256 amountIn, address[] calldata path)
	external
	view
	returns(uint256[] memory amounts);

	function getAmountsIn(uint256 amountOut, address[] calldata path)
	external
	view
	returns(uint256[] memory amounts);
}



interface IUniswapV2Router02 is IUniswapV2Router01 {
	function removeLiquidityETHSupportingFeeOnTransferTokens(
		address token,
		uint256 liquidity,
		uint256 amountTokenMin,
		uint256 amountETHMin,
		address to,
		uint256 deadline
	) external returns(uint256 amountETH);

	function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
		address token,
		uint256 liquidity,
		uint256 amountTokenMin,
		uint256 amountETHMin,
		address to,
		uint256 deadline,
		bool approveMax,
		uint8 v,
		bytes32 r,
		bytes32 s
	) external returns(uint256 amountETH);

	function swapExactTokensForTokensSupportingFeeOnTransferTokens(
		uint256 amountIn,
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external;

	function swapExactETHForTokensSupportingFeeOnTransferTokens(
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external payable;

	function swapExactTokensForETHSupportingFeeOnTransferTokens(
		uint256 amountIn,
		uint256 amountOutMin,
		address[] calldata path,
		address to,
		uint256 deadline
	) external;
}

abstract contract ReentrancyGuard {
	// Booleans are more expensive than uint256 or any type that takes up a full
	// word because each write operation emits an extra SLOAD to first read the
	// slot's contents, replace the bits taken up by the boolean, and then write
	// back. This is the compiler's defense against contract upgrades and
	// pointer aliasing, and it cannot be disabled.

	// The values being non-zero value makes deployment a bit more expensive,
	// but in exchange the refund on every call to nonReentrant will be lower in
	// amount. Since refunds are capped to a percentage of the total
	// transaction's gas, it is best to keep them low in cases like this one, to
	// increase the likelihood of the full refund coming into effect.
	uint256 private constant _NOT_ENTERED = 1;
	uint256 private constant _ENTERED = 2;

	uint256 private _status;

	/**
	 * @dev Unauthorized reentrant call.
	 */
	error ReentrancyGuardReentrantCall();

	constructor() {
		_status = _NOT_ENTERED;
	}

	/**
	 * @dev Prevents a contract from calling itself, directly or indirectly.
	 * Calling a `nonReentrant` function from another `nonReentrant`
	 * function is not supported. It is possible to prevent this from happening
	 * by making the `nonReentrant` function external, and making it call a
	 * `private` function that does the actual work.
	 */
	modifier nonReentrant() {
		_nonReentrantBefore();
		_;
		_nonReentrantAfter();
	}

	function _nonReentrantBefore() private {
		// On the first call to nonReentrant, _status will be _NOT_ENTERED
		if (_status == _ENTERED) {
			revert ReentrancyGuardReentrantCall();
		}

		// Any calls to nonReentrant after this point will fail
		_status = _ENTERED;
	}

	function _nonReentrantAfter() private {
		// By storing the original value once again, a refund is triggered (see
		// https://eips.ethereum.org/EIPS/eip-2200)
		_status = _NOT_ENTERED;
	}

	/**
	 * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
	 * `nonReentrant` function in the call stack.
	 */
	function _reentrancyGuardEntered() internal view returns(bool) {
		return _status == _ENTERED;
	}
}

contract BanqiroTokenICO is Ownable, ReentrancyGuard {
	using SafeMath
	for uint256;

	address public banqiro = 0x5C85F56e8D5Fde19C94cc32CC7a8135a63F864a0;
	uint256 public seedSaleStartime;
	uint256 public preRegisterationStartTime;
	uint256 public phase1StartTime;
	uint256 public endTime;
	uint256 public seedSaleAmountRaised;
	uint256 public amountRaised;
	address public referalContract = 0x39bB667955D2DbA945dA814f47685Ab644Af35dd;
	address public vestingContract = 0x3A987437b545A240079CAa091722239691A0A66D;
	uint256 public tokenSoldSeedSale;
	uint256 public tokensSold;
	address public busd = 0xf8B8dEF2Eb952156F8f97E91d6A183953622E6D1;
	address public usdt = 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c;
	address[] public investors;
	IUniswapV2Router02 public immutable uniswapV2Router; // uniswap dex router

	uint256 public phase0Supply = 3846154000000000000000000;
	uint256 public phase1Supply = 4500000000000000000000000;
	uint256 public phase2Supply = 9000000000000000000000000;
	uint256 public phase3Supply = 13750000000000000000000000;
	uint256 public phase4Supply = 20072917000000000000000000;
	uint256 public phase5Supply = 9803922000000000000000000;
	uint256 public phase6Supply = 9433962000000000000000000;

	mapping(address => uint256) public seedSaleTokenBoughtUser;
	mapping(address => uint256) public totalTokenBoughtUser;
	mapping(address => uint256) public saleTokenBoughtUser;
	mapping(address => uint256) public seedSaleUsdInvestedByUser;
	mapping(address => uint256) public preRegisterationUsdInvestedByUser;
	mapping(address => uint256) public totalUsdInvestedByUser;
	mapping(address => uint256) public saleUsdInvestedByUser;
	mapping(address => uint256) public bonusSaleUsdInvestedByUser;
	mapping(address => uint256) public bonusTokenBoughtUser;
	mapping(address => mapping(address => uint256)) public rewardFromUser;


	uint256 public minBuyAmount = 50000000000000000000;
	uint256 public maxBuyAmount = 50000000000000000000000;
	uint256 public seedSaleBuy = 50000000000000000000000;
	uint256 public preRegisterationBuyAmount = 50000000000000000000; //###
	uint256 public maxPurchaseByUser = 50000000000000000000000;
	uint256 public phase0Price = 130000000000000000;
	uint256 public phase1Price = 150000000000000000; //0.01
	uint256 public phase2Price = 180000000000000000;
	uint256 public phase3Price = 210000000000000000;
	uint256 public phase4Price = 240000000000000000;
	uint256 public phase5Price = 255000000000000000;
	uint256 public phase6Price = 265000000000000000;
	uint256 public poolAmount;
	uint256 public poolAmountDistributed; //###
	uint256 public unlockPrice = 50000000000000000000;
	uint256 public sepaCommision = 77000000000000000;
	address public sepaWallet;

	mapping(uint256 => uint256) public levelToCommision;
	mapping(uint256 => uint256) public poolToSale;
	mapping(address => bool) public added;
	mapping(address => uint256) public poolReward;
	mapping(address => uint256) public referalIncome;

	address public bnqEOOD;
	address public bnqTechJSC;
	address public salesWallet;
	address public bnqMarketingJSC;
	address public boardWallet;
	address public topAccount;

	uint256 public seedEOODPercentage = 3000;
	uint256 public seedTechJSCPercentage = 5000;
	uint256 public seedMarketingJSCPercentage = 1000;
	uint256 public seedAffiliatePercentage = 1000;

	uint256 public EOODPercentage = 3000;
	uint256 public techJSCPercentage = 3000;
	uint256 public salesPercentage = 400;
	uint256 public boardPercentage = 250;
	uint256 public marketingJSCPercentage = 350;
	uint256 public affiliatePercentage = 2500;
	uint256 public poolPercentage = 500;


	uint256 public bonusEOODPercentage = 2000;
	uint256 public bonusTechJSCPercentage = 4000;
	uint256 public bonusSalesPercentage = 400;
	uint256 public bonusBoardPercentage = 350;
	uint256 public bonusMarketingJSCPercentage = 250;



	struct Refer {
		address user;
		uint256 amount;

	}

	event TokensBought(address indexed investor, uint256 indexed usdAmount,
		uint256 indexed tokenAmount);

	event SupplyEdited(uint256 phase0Supply, uint256 phase1Supply, uint256 phase2Supply,
		uint256 phase3Supply, uint256 phase4Supply, uint256 phase5Supply, uint256 phase6Supply);

	event PriceUpdated(uint256 phase0Price, uint256 phase1Price, uint256 phase2Price,
		uint256 phase3Price, uint256 phase4Price, uint256 phase5Price, uint256 phase6Price);

	event TreasuryUpdated(address treasury);


	event ContractsUpdated(address referalContract, address vestingContract);

	event ReferalIncomeDistributed(address user, address referrer, uint256 amountPurchased,
		uint256 referalAmount, uint256 level);

	event WhitelistUpdated(address user, bool isWhitelisted);

	event BuyAmountUpdated(uint256 min, uint256 max);


	constructor(
		address banqiroToken,
		uint256 _start

	) {

		banqiro = (banqiroToken);
		seedSaleStartime = _start;
		levelToCommision[1] = 1000;
		levelToCommision[2] = 400;
		levelToCommision[3] = 300;
		levelToCommision[4] = 200;
		levelToCommision[5] = 200;
		levelToCommision[6] = 100;
		levelToCommision[7] = 100;
		levelToCommision[8] = 100;
		levelToCommision[9] = 50;
		levelToCommision[10] = 50;
		poolToSale[1] = 100000000000000000000000;
		poolToSale[2] = 250000000000000000000000;
		poolToSale[3] = 500000000000000000000000;
		poolToSale[4] = 1000000000000000000000000;
		poolToSale[5] = 5000000000000000000000000;
		IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(
			0xD99D1c33F9fC3444f8101754aBC46c52416550D1
		);
		uniswapV2Router = _uniswapV2Router;


	}

	function updateTime(uint256 _seedSaleStartime, uint256 _preRegisterationStartTime, uint256 _phase1StartTime, uint256 _endTime)
	external onlyOwner {
		seedSaleStartime = _seedSaleStartime;
		preRegisterationStartTime = _preRegisterationStartTime;
		phase1StartTime = _phase1StartTime;
		endTime = _endTime;

	}

	function updatebanqiroTokenAddress(address token) external onlyOwner {
		banqiro = token;
	}

	function updateWallet(address _bnqEOOD,
		address _bnqTechJSC,
		address _salesWallet,
		address _bnqMarketingJSC,
		address _boardWallet,
		address _topAccount, address _sepaWallet) external onlyOwner {
		bnqEOOD = _bnqEOOD;
		bnqTechJSC = _bnqTechJSC;
		salesWallet = _salesWallet;
		bnqMarketingJSC = _bnqMarketingJSC;
		boardWallet = _boardWallet;
		topAccount = _topAccount;
		sepaWallet = _sepaWallet;
	}

	function updateSeedPercentage(uint256 _seedEOODPercentage, uint256 _seedMarketingJSCPercentage,
		uint256 _seedTechJSCPercentage, uint256 _seedAffiliatePercentage) external onlyOwner {
		require(_seedEOODPercentage + _seedMarketingJSCPercentage +
			_seedTechJSCPercentage + _seedAffiliatePercentage == 10000, "Enter correct values");
		seedEOODPercentage = _seedEOODPercentage;
		seedMarketingJSCPercentage = _seedMarketingJSCPercentage;
		seedTechJSCPercentage = _seedTechJSCPercentage;
		seedAffiliatePercentage = _seedAffiliatePercentage;
		

	}

	function updateSalePercentage(uint256 _EOODPercentage,
		uint256 _techJSCPercentage,
		uint256 _salesPercentage,
		uint256 _boardPercentage,
		uint256 _marketingJSCPercentage,
		uint256 _affiliatePercentage,
		uint256 _poolPercentage) external onlyOwner {
		require(_EOODPercentage +
			_techJSCPercentage +
			_salesPercentage +
			_boardPercentage +
			_marketingJSCPercentage +
			_affiliatePercentage +
			_poolPercentage == 10000, "Enter correct values");
		EOODPercentage = _EOODPercentage;
		techJSCPercentage = _techJSCPercentage;
		salesPercentage = _salesPercentage;
		boardPercentage = _boardPercentage;
		marketingJSCPercentage = _marketingJSCPercentage;
		affiliatePercentage = _affiliatePercentage;
		poolPercentage = _poolPercentage;
		

	}

	function updateBonusPercentage(uint256 _EOODPercentage,
		uint256 _techJSCPercentage,
		uint256 _salesPercentage,
		uint256 _boardPercentage,
		uint256 _marketingJSCPercentage,
		uint256 _affiliatePercentage,
		uint256 _poolPercentage) external onlyOwner {
		require(_EOODPercentage +
			_techJSCPercentage +
			_salesPercentage +
			_boardPercentage +
			_marketingJSCPercentage +
			_affiliatePercentage +
			_poolPercentage == 10000, "Enter correct values");
		bonusEOODPercentage = _EOODPercentage;
		bonusTechJSCPercentage = _techJSCPercentage;
		bonusSalesPercentage = _salesPercentage;
		bonusBoardPercentage = _boardPercentage;
		bonusMarketingJSCPercentage = _marketingJSCPercentage;
		affiliatePercentage = _affiliatePercentage;
		poolPercentage = _poolPercentage;
	}

	function updateSupply(uint256 _phase0Supply, uint256 _phase1Supply, uint256 _phase2Supply,
		uint256 _phase3Supply, uint256 _phase4Supply, uint256 _phase5Supply, uint256 _phase6Supply) external onlyOwner {
		phase0Supply = _phase0Supply;
		phase1Supply = _phase1Supply;
		phase2Supply = _phase2Supply;
		phase3Supply = _phase3Supply;
		phase4Supply = _phase4Supply;
		phase5Supply = _phase5Supply;
		phase6Supply = _phase6Supply;

		emit SupplyEdited(_phase0Supply, _phase1Supply, _phase2Supply,
			_phase3Supply, _phase4Supply, _phase5Supply, _phase6Supply);

	}

	function editPrice(uint256 _phase0Price, uint256 _phase1Price, uint256 _phase2Price,
		uint256 _phase3Price, uint256 _phase4Price, uint256 _phase5Price, uint256 _phase6Price) external onlyOwner {
		phase0Price = _phase0Price;
		phase1Price = _phase1Price;
		phase2Price = _phase2Price;
		phase3Price = _phase3Price;
		phase4Price = _phase4Price;
		phase5Price = _phase5Price;
		phase6Price = _phase6Price;

		emit PriceUpdated(_phase0Price, _phase1Price, _phase2Price,
			_phase3Price, _phase4Price, _phase5Price, _phase6Price);
	}

	function updatePurchaseValue(uint256 minAmount, uint256 maxAmount) external onlyOwner {
		preRegisterationBuyAmount = minAmount;
		maxPurchaseByUser = maxAmount;

	}


	function updateMinMaxBuy(uint256 min, uint256 max) external onlyOwner {
		minBuyAmount = min;
		maxBuyAmount = max;

		emit BuyAmountUpdated(min, max);
	}


	function updateLevelToCommision(uint256 level, uint256 commision) external onlyOwner {
		require(level >= 1 && level <= 10, "Only 10 levels allowed");
		levelToCommision[level] = commision;
	}



	function updateContracts(address _referalContract, address _vestingContract) external onlyOwner {
		referalContract = _referalContract;
		vestingContract = _vestingContract;

		emit ContractsUpdated(_referalContract, _vestingContract);

	}

	function getStage() public view returns(uint256 stage) {
		require(block.timestamp > seedSaleStartime, "Sale not started");
		require(block.timestamp < endTime, "Sale Ended");

		if (block.timestamp > seedSaleStartime && block.timestamp < phase1StartTime) {
			return (0);
		} else if (tokensSold >= 0 && tokensSold < phase1Supply) {
			return (1);
		} else if (tokensSold >= phase1Supply && tokensSold < phase2Supply) {
			return (2);
		} else if (tokensSold >= phase2Supply && tokensSold < phase3Supply) {
			return (3);
		} else if (tokensSold >= phase3Supply && tokensSold < phase4Supply) {
			return (4);
		} else if (tokensSold >= phase4Supply && tokensSold < phase5Supply) {
			return (5);
		} else if (tokensSold >= phase5Supply && tokensSold <= phase6Supply) {
			return (6);
		}
	}

	function buyToken(address token, uint256 amount) external nonReentrant {
		if (!added[msg.sender]) {
			investors.push(msg.sender);
		}
		require(token == usdt || token == busd, "Invalid currency");
		require(block.timestamp > seedSaleStartime, "Sale not started");
		require(block.timestamp < endTime, "Sale Ended");
		uint256 stage = getStage();
		uint256 price;
		if (stage == 0) {
			price = phase0Price;
			require(Referal(referalContract).isWhitelisted(msg.sender) ||
				Referal(referalContract).getReferrer(msg.sender) != address(0), "Not Eligible, try later"); //###

			if (preRegisterationStartTime > block.timestamp) {
				require(seedSaleUsdInvestedByUser[msg.sender] + amount <= seedSaleBuy, "50.000 worth of tokens bought");
				seedSaleUsdInvestedByUser[msg.sender] += amount;

			} else {
				require(preRegisterationUsdInvestedByUser[msg.sender] + amount <= preRegisterationBuyAmount, "50 worth of tokens bought");
				preRegisterationUsdInvestedByUser[msg.sender] += amount;
			}
		} else if (stage == 1) {
			price = phase1Price;
		} else if (stage == 2) {
			price = phase2Price;
		} else if (stage == 3) {
			price = phase3Price;
		} else if (stage == 4) {
			price = phase4Price;
		} else if (stage == 5) {
			price = phase5Price;
		} else if (stage == 6) {
			price = phase6Price;
		}
		// uint256 tokenAmount = getTokensForPrice(amount, price);
		uint256 tokenAmount = amount / price;
		require(amount >= minBuyAmount, "Cannot buy less than minimum Buy Amount"); //###
		require(amount <= maxBuyAmount, "Cannot buy more than Max Buy Amount");
		if (stage == 0) {
			tokenSoldSeedSale += tokenAmount;
			require(tokenSoldSeedSale <= phase0Supply, "Seed Phase sold out");
			seedSaleAmountRaised += amount;
			seedSaleUsdInvestedByUser[msg.sender] += amount;
			seedSaleTokenBoughtUser[msg.sender] += tokenAmount;
			if (token == busd) {
				distributeSeedSaleRevenue(amount, msg.sender, busd);
			} else if (token == usdt) {
				distributeSeedSaleRevenue(amount, msg.sender, usdt);
			}
		} else if (stage >= 1 && stage <= 4) {
			tokensSold += tokenAmount;
			amountRaised += amount;
			saleUsdInvestedByUser[msg.sender] += amount;
			saleTokenBoughtUser[msg.sender] += tokenAmount;
			require(saleUsdInvestedByUser[msg.sender] <= maxPurchaseByUser, "Cannot Purchase more than $50.000 worth of token");
			if (token == busd) {
				distributeRevenue(amount, msg.sender, busd);
			} else if (token == usdt) {
				distributeRevenue(amount, msg.sender, usdt);
			}
		} else {
			tokensSold += tokenAmount;
			require(tokensSold <= phase6Supply, "SOLD OUT!!"); //###
			amountRaised += amount;
			bonusSaleUsdInvestedByUser[msg.sender] += amount;
			bonusTokenBoughtUser[msg.sender] += tokenAmount;
			require(bonusSaleUsdInvestedByUser[msg.sender] <= maxPurchaseByUser,
				"Cannot Purchase more than $50.000 worth of token in bonus Sale");
			if (token == busd) {
				distributeBonusRevenue(amount, msg.sender, busd);
			} else if (token == usdt) {
				distributeBonusRevenue(amount, msg.sender, usdt);
			}
		}

		totalUsdInvestedByUser[msg.sender] += amount;
		totalTokenBoughtUser[msg.sender] += tokenAmount;

		IERC20(banqiro).transfer(vestingContract, tokenAmount);
		Vesting(vestingContract).vestTokens(msg.sender, tokenAmount);
		emit TokensBought(msg.sender, amount, tokenAmount);

	}

	function distributeRevenue(uint256 amount, address user, address token) private {
		uint256 pool = (amount * poolPercentage) / 10000;
		if (token == usdt) {
			IERC20(token).transferFrom(user, address(this), pool);
			uint256 poolBusd = swapUsdtForBusd(pool);
			poolAmount += poolBusd;
		} else {
			poolAmount += pool;
			IERC20(token).transferFrom(user, address(this), pool);
		}
		uint256 EOODAmount = (amount * EOODPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqEOOD, EOODAmount);
		uint256 techAmount = (amount * techJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, sepaWallet, sepaCommision);
		IERC20(token).transferFrom(user, bnqTechJSC, techAmount - sepaCommision);
		uint256 salesAmount = (amount * salesPercentage) / 10000;
		IERC20(token).transferFrom(user, salesWallet, salesAmount);
		uint256 marketingAmount = (amount * marketingJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqMarketingJSC, marketingAmount);
		uint256 board = (amount * boardPercentage) / 10000;
		IERC20(token).transferFrom(user, boardWallet, board);
		uint256 referalTotalAmount = (amount * affiliatePercentage) / 10000;
		uint256 referalAmount = distributeToken(user, amount, token);
		if (referalTotalAmount > referalAmount) {
			IERC20(token).transferFrom(user, topAccount, referalTotalAmount - referalAmount);
		}
	}

	function distributeSeedSaleRevenue(uint256 amount, address user, address token) private {

		uint256 EOODAmount = (amount * seedEOODPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqEOOD, EOODAmount);
		uint256 techAmount = (amount * seedTechJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, sepaWallet, sepaCommision);
		IERC20(token).transferFrom(user, bnqTechJSC, techAmount - sepaCommision);
		uint256 marketingAmount = (amount * seedMarketingJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqMarketingJSC, marketingAmount);
		uint256 referalTotalAmount = (amount * seedAffiliatePercentage) / 10000;
		uint256 referalAmount;
		if (Referal(referalContract).getReferrer(user) != address(0)) {
			if (getLevelsUnlocked(Referal(referalContract).getReferrer(user)) >= 1) {
				IERC20(token).transferFrom(user, Referal(referalContract).getReferrer(user), amount * (levelToCommision[1]) / 10000);
				referalIncome[Referal(referalContract).getReferrer(user)] += amount * (levelToCommision[1]) / 10000;
				rewardFromUser[Referal(referalContract).getReferrer(user)][user] = amount * (levelToCommision[1]) / 10000;
				emit ReferalIncomeDistributed(user, Referal(referalContract).getReferrer(user), amount,
					amount * (levelToCommision[1]) / 10000, 1);
				referalAmount = amount * (levelToCommision[1]) / 10000;
			}
		}
		if (referalTotalAmount > referalAmount) {
			IERC20(token).transferFrom(user, topAccount, referalTotalAmount - referalAmount);
		}
	}

	function distributeBonusRevenue(uint256 amount, address user, address token) private {
		uint256 pool = (amount * poolPercentage) / 10000;
		if (token == usdt) {
			IERC20(token).transferFrom(user, address(this), pool);
			uint256 poolBusd = swapUsdtForBusd(pool);
			poolAmount += poolBusd;
		} else {
			poolAmount += pool;
			IERC20(token).transferFrom(user, address(this), pool);
		}
		uint256 EOODAmount = (amount * bonusEOODPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqEOOD, EOODAmount);
		uint256 techAmount = (amount * bonusTechJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, sepaWallet, sepaCommision);
		IERC20(token).transferFrom(user, bnqTechJSC, techAmount - sepaCommision);
		uint256 salesAmount = (amount * bonusSalesPercentage) / 10000;
		IERC20(token).transferFrom(user, salesWallet, salesAmount);
		uint256 marketingAmount = (amount * bonusMarketingJSCPercentage) / 10000;
		IERC20(token).transferFrom(user, bnqMarketingJSC, marketingAmount);
		uint256 board = (amount * bonusBoardPercentage) / 10000;
		IERC20(token).transferFrom(user, boardWallet, board);
		uint256 referalTotalAmount = (amount * affiliatePercentage) / 10000;
		uint256 referalAmount = distributeToken(user, amount, token);
		if (referalTotalAmount > referalAmount) {
			IERC20(token).transferFrom(user, topAccount, referalTotalAmount - referalAmount);
		}
	}
 

	function distributeToken(address user, uint256 amount, address token) private returns(uint256 total) {
		uint totalItemCount = 10;
		address _user = user;
		for (uint i = 1; i <= totalItemCount; i++) {
			if (Referal(referalContract).getReferrer(_user) != address(0)) {
				if (getLevelsUnlocked(Referal(referalContract).getReferrer(_user)) >= i) {
					IERC20(token).transferFrom(user, Referal(referalContract).getReferrer(_user), amount * (levelToCommision[i]) / 10000);
					referalIncome[Referal(referalContract).getReferrer(_user)] += amount * (levelToCommision[i]) / 10000;
					rewardFromUser[Referal(referalContract).getReferrer(_user)][_user] = amount * (levelToCommision[i]) / 10000;
					emit ReferalIncomeDistributed(user, Referal(referalContract).getReferrer(_user), amount,
						amount * (levelToCommision[i]) / 10000, i);
					total += amount * (levelToCommision[i]) / 10000;
				}
				_user = Referal(referalContract).getReferrer(_user);
			} else {
				return total;
			}
		}
	}


	function getStagePrice(uint256 stage) public view returns(uint256 price) {
		if (stage == 0) {
			price = phase0Price;
		} else if (stage == 1) {
			price = phase1Price;
		} else if (stage == 2) {
			price = phase2Price;
		} else if (stage == 3) {
			price = phase3Price;
		} else if (stage == 4) {
			price = phase4Price;
		} else if (stage == 5) {
			price = phase5Price;
		} else if (stage == 6) {
			price = phase6Price;
		}
	}

	function getIcoReferalTrail(address user, uint256 amount) public view returns(Refer[] memory trail) {
		uint totalItemCount = 10;
		uint itemCount = 0;
		uint currentIndex = 0;
		address _user = user;

		for (uint i = 1; i <= totalItemCount; i++) {
			if (Referal(referalContract).getReferrer(_user) != address(0) &&
				getLevelsUnlocked(Referal(referalContract).getReferrer(_user)) >= i) {
				_user = Referal(referalContract).getReferrer(_user);
				itemCount = itemCount + (1);
			}
		}
		_user = user;
		Refer[] memory items = new Refer[](itemCount);
		for (uint i = 1; i <= totalItemCount; i++) {
			if (Referal(referalContract).getReferrer(_user) != address(0) &&
				getLevelsUnlocked(Referal(referalContract).getReferrer(_user)) >= i) {
				Refer memory currentItem = Refer({
					user: _user,
					amount: (amount * (levelToCommision[i])) / 10000
				});
				_user = Referal(referalContract).getReferrer(_user);
				items[currentIndex] = currentItem;
				currentIndex = currentIndex + (1);
			}
		}
		return items;
	}

	function getLevelsUnlocked(address user) public view returns(uint256 levels) {
		uint256 totalActivePartners = Referal(referalContract).getAllRefrees(user).length;
		for (uint256 i = 0; i < totalActivePartners; i++) {
			if (totalUsdInvestedByUser[Referal(referalContract).getAllRefrees(user)[i]] >= unlockPrice) {
				levels++;
			}
		}
	}

	function getEligibleLevel(address user) external view returns(uint256 level) {
		address _user = user;
		for (uint i = 1; i <= 10; i++) {
			if (Referal(referalContract).getReferrer(_user) != address(0)) {
				_user = Referal(referalContract).getReferrer(_user);
			} else {
				return (i - 1);
			}
		}
		return (10);
	}

	receive() external payable {}

	/*
	@param token address of token to be withdrawn
	@param wallet wallet that gets the token
	*/

	function withdrawTokens(IERC20 token, address wallet) external onlyOwner {
		uint256 balanceOfContract = token.balanceOf(address(this));
		token.transfer(wallet, balanceOfContract);
	}

	/*
    @param wallet address that gets the Eth
     */

	function withdrawFunds(address wallet) external onlyOwner {
		uint256 balanceOfContract = address(this).balance;
		payable(wallet).transfer(balanceOfContract);
	}

	function getEligibleAmount(address user) public view returns(uint256 amount, address highest, uint256 otherAmount,
		uint256 highestAmount) {
		address[] memory getRefrees = Referal(referalContract).getAllRefrees(user);
		uint256 total = getRefrees.length;
		for (uint256 i = 0; i < total; i++) {
			if (totalUsdInvestedByUser[getRefrees[i]] > totalUsdInvestedByUser[highest]) {
				highest = getRefrees[i];
				otherAmount += highestAmount;
				highestAmount = totalUsdInvestedByUser[getRefrees[i]];
			} else {
				otherAmount += totalUsdInvestedByUser[getRefrees[i]];
			}

		}

		if (otherAmount < highestAmount) {
			// amount = 2 * otherAmount;
			amount = 0; //###
		} else {
			amount = otherAmount + highestAmount;
		}

	}

	function getPoolAndAmount(address user) external view returns(uint256 pool, uint256 amountRemaining) {
		(uint256 amount, , , ) = getEligibleAmount(user);
		if (amount < poolToSale[1]) {
			pool = 1;
			amountRemaining = poolToSale[1] - amount;
		}
		if (amount >= poolToSale[1] && amount < poolToSale[2]) {
			pool = 2;
			amountRemaining = poolToSale[2] - amount;
		}
		if (amount >= poolToSale[2] && amount < poolToSale[3]) {
			pool = 3;
			amountRemaining = poolToSale[3] - amount;
		}
		if (amount >= poolToSale[3] && amount < poolToSale[4]) {
			pool = 4;
			amountRemaining = poolToSale[4] - amount;
		}
		if (amount >= poolToSale[4] && amount <= poolToSale[5]) {
			pool = 5;
			amountRemaining = poolToSale[5] - amount;
		}
		if (amount > poolToSale[5]) {
			pool = 5;
			amountRemaining = 0;

		}

	}

	function distributePoolAmount() external onlyOwner {
		uint256 totalUsers = investors.length;
		uint256 poolShare = (poolAmount - poolAmountDistributed) / 5;
		for (uint256 i = 1; i <= 5; i++) {
			for (uint256 j = 0; j < totalUsers; j++) {
				(uint256 amount, , , ) = getEligibleAmount(investors[j]);
				if (amount >= poolToSale[i]) {
					uint256 userAmount = ((totalUsdInvestedByUser[investors[j]]) * poolShare) / amountRaised;
					IERC20(busd).transfer(investors[j], userAmount);
					poolAmountDistributed += userAmount;
					poolReward[investors[j]] += userAmount;
				}

			}
		}
	}

	function swapUsdtForBusd(uint256 usdtAmount) private returns(uint256 busdAmount) {

		address[] memory path = new address[](2);
		path[0] = usdt;
		path[1] = busd;
		uint[] memory amounts = new uint[](2);
		amounts = uniswapV2Router.swapExactTokensForTokens(
			usdtAmount,
			0,
			path,
			address(this),
			block.timestamp + 1000
		);
		return (amounts[1]);
	}

	function getTotalSales() external view returns(uint256 sales) {
		uint256 totalUsers = investors.length;
		for (uint256 i = 0; i < totalUsers; i++) {
			sales += totalUsdInvestedByUser[investors[i]];
		}
	}


}
