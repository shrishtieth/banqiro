// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8 .9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

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

interface ICO {
	function tokenSoldSeedSale() external view returns(uint256);

	function tokensSold() external view returns(uint256);

	function endTime() external view returns(uint256);

}

contract Banqiro is ERC20, Ownable {

	uint256 maxSupply = 175000000000000000000000000;

	address public icoContract;
	address public vestingContract;
	address public stakingWallet;
	address public liquidityWallet;
	address public marketingWallet;
	address public ecosystemReserveWallet;
	address public topWallet;

	uint256 public softCapTokenAmount = 51169071000000000000000000;
	uint256 public hardCapTokenAmount = 70406955000000000000000000;

	uint256 public liquidityTokens = 51169071000000000000000000;
	uint256 public stakingTokens = 15350721000000000000000000;
	uint256 public marketingTokens = 12500000000000000000000000;
	uint256 public ecosystemTokens = 89209374000000000000000000;
	uint256 public bonusLiquidityTokens = 9905660000000000000000000;
	uint256 public bonusStakingTokens = 21122087000000000000000000;
	uint256 public bonusMarketingTokens = 12500000000000000000000000;
	uint256 public bonusEcosystemTokens = 61065298000000000000000000;

	bool public minted;


	constructor(string memory name, string memory symbol) ERC20(name, symbol) {


	}

	function setAddress(address _ico, address _vesting, address _staking, address _liquidity,
		address _marketing, address _ecosystem, address _top)
	external onlyOwner {
		icoContract = _ico;
		vestingContract = _vesting;
		liquidityWallet = _liquidity;
		stakingWallet = _staking;
		marketingWallet = _marketing;
		ecosystemReserveWallet = _ecosystem;
		topWallet = _top;
	}

	function setAmount(uint256 _softCapAmount, uint256 _liquidityTokens,
		uint256 _stakingTokens,
		uint256 _marketingTokens,
		uint256 _ecosystemTokens) external onlyOwner {
		require(!minted, "Already minted");
		require(_softCapAmount + _liquidityTokens + _marketingTokens +
			_stakingTokens + _ecosystemTokens == maxSupply, "Invalid values");
		softCapTokenAmount = _softCapAmount;
		liquidityTokens = _liquidityTokens;
		stakingTokens = _stakingTokens;
		marketingTokens = _marketingTokens;
		ecosystemTokens = _ecosystemTokens;
	}

	function setBonusAmount(uint256 _hardCapAmount, uint256 _bonusLiquidityTokens,
		uint256 _bonusStakingTokens,
		uint256 _bonusMarketingTokens,
		uint256 _bonusEcosystemTokens) external onlyOwner {
		require(!minted, "Already minted");
		require(_hardCapAmount + _bonusLiquidityTokens +
			_bonusStakingTokens +
			_bonusMarketingTokens +
			_bonusEcosystemTokens == maxSupply, "Invalid values");
		hardCapTokenAmount = _hardCapAmount;
		bonusLiquidityTokens = _bonusLiquidityTokens;
		bonusStakingTokens = _bonusStakingTokens;
		bonusMarketingTokens = _bonusMarketingTokens;
		bonusEcosystemTokens = _bonusEcosystemTokens;
	}


	function generateTokens() external onlyOwner {
		require(block.timestamp > ICO(icoContract).endTime(), "Cannot Generate before end time");
		require(!minted, "Already minted");
		minted = true;
		if (ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold() > softCapTokenAmount) {

			_mint(vestingContract, ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold());
			if (ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold() < hardCapTokenAmount) {
				_mint(topWallet, hardCapTokenAmount - (ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold()));
			}
			_mint(liquidityWallet, bonusLiquidityTokens);
			_mint(stakingWallet, bonusStakingTokens);
			_mint(marketingWallet, bonusMarketingTokens);
			_mint(ecosystemReserveWallet, bonusEcosystemTokens);
		} else {

			_mint(vestingContract, ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold());
			if (ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold() < softCapTokenAmount) {
				_mint(topWallet, softCapTokenAmount - (ICO(icoContract).tokenSoldSeedSale() + ICO(icoContract).tokensSold()));
			}
			_mint(liquidityWallet, liquidityTokens);
			_mint(stakingWallet, stakingTokens);
			_mint(marketingWallet, marketingTokens);
			_mint(ecosystemReserveWallet, ecosystemTokens);

		}
	}


}
