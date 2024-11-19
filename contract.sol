
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
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
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
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
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)

pragma solidity ^0.8.20;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
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
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
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

// File: @openzeppelin/contracts/security/ReentrancyGuard.sol


// OpenZeppelin Contracts (last updated v4.9.0) (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
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
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

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
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == _ENTERED;
    }
}

// File: contracts/Staking.sol


pragma solidity 0.8.28;




contract StakingContract is Ownable, ReentrancyGuard {
    // Cooldown period for unstaking
    uint256 public constant COOLDOWN_PERIOD = 4 hours;
    uint256 public constant UNSTAKE_COOLDOWN = 4 hours;

    // Fee wallet address to collect fees
    address public feeWallet;

    // Fee percentages (as basis points, e.g., 200 = 2%)
    uint256 public depositFeeBps = 200; // 2%
    uint256 public withdrawalFeeBps = 500; // 5%

    struct Pool {
        uint256 apy;                   // Annual Percentage Yield for rewards
        uint256 totalStaked;           // Total amount staked in this pool
        IERC20 stakingToken;           // Staking token for this pool
        IERC20 rewardToken;            // Reward token for this pool
        bool active;                   // Status of the pool (active/inactive)
        mapping(address => uint256) stakedAmounts;  // Staked amount per user
        mapping(address => uint256) lastStakedTime; // Last time the user staked
    }

    // Pool management
    mapping(uint256 => Pool) public pools;  // Mapping pool ID to Pool data
    uint256 public poolCount;               // Number of pools created

    // Events
    event PoolCreated(uint256 indexed poolId, uint256 apy, address stakingToken, address rewardToken);
    event Staked(address indexed user, uint256 poolId, uint256 amount);
    event Unstaked(address indexed user, uint256 poolId, uint256 amount);
    event RewardClaimed(address indexed user, uint256 poolId, uint256 reward);
    event APYAdjusted(uint256 indexed poolId, uint256 newAPY);
    event FeesUpdated(uint256 newDepositFeeBps, uint256 newWithdrawalFeeBps);
    event PoolDeactivated(uint256 indexed poolId);
    event PoolActivated(uint256 indexed poolId);

    modifier feeWalletSet() {
        require(feeWallet != address(0), "Fee wallet not set");
        _;
    }

    modifier validAddress(address _address) {
        require(_address != address(0), "Invalid address");
        _;
    }

    modifier poolIsActive(uint256 _poolId) {
        require(pools[_poolId].active, "Pool is not active");
        _;
    }

    // Pass msg.sender to the Ownable constructor to set the initial owner
    constructor() Ownable(msg.sender) {}

    function setFeeWallet(address _feeWallet) external onlyOwner validAddress(_feeWallet) {
        feeWallet = _feeWallet;
    }

    function updateFees(uint256 _depositFeeBps, uint256 _withdrawalFeeBps) external onlyOwner {
        depositFeeBps = _depositFeeBps;
        withdrawalFeeBps = _withdrawalFeeBps;
        emit FeesUpdated(_depositFeeBps, _withdrawalFeeBps);
    }

    function addPool(uint256 _apy, address _stakingToken, address _rewardToken) external onlyOwner validAddress(_stakingToken) validAddress(_rewardToken) {
        Pool storage newPool = pools[poolCount];
        newPool.apy = _apy;
        newPool.stakingToken = IERC20(_stakingToken);
        newPool.rewardToken = IERC20(_rewardToken);
        newPool.active = true;
        poolCount++;
        emit PoolCreated(poolCount - 1, _apy, _stakingToken, _rewardToken);
    }

    function deactivatePool(uint256 _poolId) external onlyOwner {
        require(_poolId < poolCount, "Pool does not exist");
        pools[_poolId].active = false;
        emit PoolDeactivated(_poolId);
    }

    function activatePool(uint256 _poolId) external onlyOwner {
        require(_poolId < poolCount, "Pool does not exist");
        pools[_poolId].active = true;
        emit PoolActivated(_poolId);
    }

    function stake(uint256 _poolId, uint256 _amount) external nonReentrant feeWalletSet poolIsActive(_poolId) {
        require(_amount > 0, "Amount must be greater than zero");

        Pool storage pool = pools[_poolId];
        uint256 fee = (_amount * depositFeeBps) / 10000;
        uint256 amountAfterFee = _amount - fee;

        require(pool.stakingToken.transferFrom(msg.sender, address(this), amountAfterFee), "Transfer failed");
        require(pool.stakingToken.transferFrom(msg.sender, feeWallet, fee), "Fee transfer failed");

        pool.stakedAmounts[msg.sender] += amountAfterFee;
        pool.totalStaked += amountAfterFee;
        pool.lastStakedTime[msg.sender] = block.timestamp;

        adjustAPY(_poolId); // Adjust APY based on the updated total staked amount

        emit Staked(msg.sender, _poolId, amountAfterFee);
    }

    function unstake(uint256 _poolId, uint256 _amount) external nonReentrant feeWalletSet poolIsActive(_poolId) {
        require(_amount > 0, "Amount must be greater than zero");

        Pool storage pool = pools[_poolId];
        uint256 stakedAmount = pool.stakedAmounts[msg.sender];

        require(stakedAmount >= _amount, "Insufficient staked balance");
        require(block.timestamp >= pool.lastStakedTime[msg.sender] + UNSTAKE_COOLDOWN, "Cooldown period not over");

        uint256 fee = (_amount * withdrawalFeeBps) / 10000;
        uint256 amountAfterFee = _amount - fee;

        pool.stakedAmounts[msg.sender] -= _amount;
        pool.totalStaked -= _amount;

        require(pool.stakingToken.transfer(msg.sender, amountAfterFee), "Transfer failed");
        require(pool.stakingToken.transfer(feeWallet, fee), "Fee transfer failed");

        adjustAPY(_poolId); // Adjust APY based on the updated total staked amount

        emit Unstaked(msg.sender, _poolId, amountAfterFee);
    }

    function adjustAPY(uint256 _poolId) internal {
        Pool storage pool = pools[_poolId];
        
        // Dynamic APY adjustment based on TVL thresholds
        if (pool.totalStaked >= 100000 ether) {
            pool.apy = 20; // Reduce to 20% APY for high TVL
        } else if (pool.totalStaked >= 50000 ether) {
            pool.apy = 30; // Medium 30% APY for moderate TVL
        } else {
            pool.apy = 200; // 200% APY initially to attract users
        }

        emit APYAdjusted(_poolId, pool.apy);
    }

    function calculateReward(uint256 _poolId, address _user) public view returns (uint256) {
        Pool storage pool = pools[_poolId];
        uint256 stakedAmount = pool.stakedAmounts[_user];

        if (stakedAmount == 0) {
            return 0;
        }

        uint256 stakingDuration = block.timestamp - pool.lastStakedTime[_user];
        return (stakedAmount * pool.apy * stakingDuration) / (365 days * 100);
    }

    function claimRewards(uint256 _poolId) external nonReentrant poolIsActive(_poolId) {
        Pool storage pool = pools[_poolId];
        uint256 reward = calculateReward(_poolId, msg.sender);
        require(reward > 0, "No rewards available");

        pool.lastStakedTime[msg.sender] = block.timestamp;
        require(pool.rewardToken.transfer(msg.sender, reward), "Reward transfer failed");

        emit RewardClaimed(msg.sender, _poolId, reward);
    }

    function getPoolInfo(uint256 _poolId) external view returns (uint256, address, address, uint256, bool) {
        require(_poolId < poolCount, "Pool does not exist");
        Pool storage pool = pools[_poolId];
        return (pool.apy, address(pool.stakingToken), address(pool.rewardToken), pool.totalStaked, pool.active);
    }

    function getUserStakedAmount(uint256 _poolId, address _user) external view returns (uint256) {
        require(_poolId < poolCount, "Pool does not exist");
        return pools[_poolId].stakedAmounts[_user];
    }

    function getUserLastStakedTime(uint256 _poolId, address _user) external view returns (uint256) {
        require(_poolId < poolCount, "Pool does not exist");
        return pools[_poolId].lastStakedTime[_user];
    }

    function getPoolCount() external view returns (uint256) {
        return poolCount;
    }

    function getCurrentAPY(uint256 _poolId) external view returns (uint256) {
        require(_poolId < poolCount, "Pool does not exist");
        Pool storage pool = pools[_poolId];
        return pool.apy;
    }

    function isPoolActive(uint256 _poolId) external view returns (bool) {
        require(_poolId < poolCount, "Pool does not exist");
        return pools[_poolId].active;
    }
}

