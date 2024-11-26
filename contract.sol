
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

// File: @openzeppelin/contracts/utils/introspection/IERC165.sol


// OpenZeppelin Contracts (last updated v5.1.0) (utils/introspection/IERC165.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC-165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[ERC].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[ERC section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

// File: @openzeppelin/contracts/token/ERC721/IERC721.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC721/IERC721.sol)

pragma solidity ^0.8.20;


/**
 * @dev Required interface of an ERC-721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon
     *   a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC-721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must have been allowed to move this token by either {approve} or
     *   {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon
     *   a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Note that the caller is responsible to confirm that the recipient is capable of receiving ERC-721
     * or else they may be permanently lost. Usage of {safeTransferFrom} prevents loss, though the caller must
     * understand this adds an external call which potentially creates a reentrancy vulnerability.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the address zero.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool approved) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);
}

// File: @openzeppelin/contracts/token/ERC721/IERC721Receiver.sol


// OpenZeppelin Contracts (last updated v5.1.0) (token/ERC721/IERC721Receiver.sol)

pragma solidity ^0.8.20;

/**
 * @title ERC-721 token receiver interface
 * @dev Interface for any contract that wants to support safeTransfers
 * from ERC-721 asset contracts.
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be
     * reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
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


pragma solidity ^0.8.28;






interface INonfungiblePositionManager {
    function positions(uint256 tokenId)
        external
        view
        returns (
            uint96 nonce,
            address operator,
            address token0,
            address token1,
            uint24 fee,
            int24 tickLower,
            int24 tickUpper,
            uint128 liquidity,
            uint256 feeGrowthInside0LastX128,
            uint256 feeGrowthInside1LastX128,
            uint128 tokensOwed0,
            uint128 tokensOwed1
        );
}

contract StakingAndFarming is Ownable, ReentrancyGuard, IERC721Receiver {
    uint256 public constant UNSTAKE_COOLDOWN = 4 hours;

    address public feeWallet;
    uint256 public depositFeeBps = 200; // 2%
    uint256 public withdrawalFeeBps = 500; // 5%
    address public positionManager; // Uniswap V3 NonfungiblePositionManager contract

    struct Pool {
        uint256 apy;
        uint256 totalStaked;
        IERC20 stakingToken;
        IERC721 nftToken;
        IERC20 rewardToken;
        bool supportsNFT;
        bool active;
        uint24 feeTier; // Changed from uint256 to uint24
        address lpPairContract; // LP pair contract address
        mapping(address => uint256) userStakes;
        mapping(address => uint256[]) userNFTs;
        mapping(address => uint256) lastStakeTime;
        uint256 totalRewardsDistributed; // Track total rewards distributed per pool
        uint256[] lpPositions; // Array to store LP token IDs for the pool
    }

    mapping(uint256 => Pool) public pools;
    uint256 public poolCount;
    mapping(uint256 => address[]) private poolUsers; // Mapping to track users per pool
    mapping(uint256 => mapping(address => bool)) private poolUserExists; // Efficient user existence check
    mapping(uint256 => mapping(uint256 => address)) private nftOwner; // Mapping to track NFT owners

    event PoolCreated(
        uint256 poolId,
        uint256 apy,
        address stakingToken,
        address rewardToken,
        bool supportsNFT,
        uint24 feeTier, // Changed from uint256 to uint24
        address lpPairContract
    );
    event Staked(address indexed user, uint256 poolId, uint256 amount, uint256[] nftIds);
    event Unstaked(address indexed user, uint256 poolId, uint256 amount, uint256[] nftIds);
    event RewardClaimed(address indexed user, uint256 poolId, uint256 reward);
    event PoolActivated(uint256 poolId);
    event PoolDeactivated(uint256 poolId);
    event FeesUpdated(uint256 depositFee, uint256 withdrawalFee);
    event RewardsDeposited(uint256 indexed poolId, uint256 amount); // New event for depositRewards
    event MinimumStakeSet(uint256 indexed poolId, uint256 minimumStake); // New event for setMinimumStake

    modifier onlyValidFeeWallet() {
        require(feeWallet != address(0), "Fee wallet not set");
        _;
    }

    modifier onlyActivePool(uint256 poolId) {
        require(poolId < poolCount, "Invalid pool ID");
        require(pools[poolId].active, "Inactive pool");
        _;
    }

    modifier meetsMinimumStake(uint256 poolId, uint256 amount) {
        require(amount >= minimumStake[poolId], "Stake amount too low");
        _;
    }

    constructor(address _feeWallet, address _positionManager, address initialOwner) Ownable(initialOwner) {
        require(_feeWallet != address(0), "Invalid fee wallet");
        require(_positionManager != address(0), "Invalid position manager");
        feeWallet = _feeWallet;
        positionManager = _positionManager;
    }

    function setFeeWallet(address _feeWallet) external onlyOwner {
        require(_feeWallet != address(0), "Invalid fee wallet");
        feeWallet = _feeWallet;
    }

    function updateFees(uint256 _depositFeeBps, uint256 _withdrawalFeeBps) external onlyOwner {
        require(_depositFeeBps <= 1000 && _withdrawalFeeBps <= 1000, "Fees too high");
        depositFeeBps = _depositFeeBps;
        withdrawalFeeBps = _withdrawalFeeBps;
        emit FeesUpdated(_depositFeeBps, _withdrawalFeeBps);
    }

    function createPool(
        uint256 _apy,
        address _stakingToken,
        address _rewardToken,
        address _nftToken,
        bool _supportsNFT,
        uint24 _feeTier,
        address _lpPairContract
    ) external onlyOwner {
        require(_rewardToken != address(0), "Invalid reward token");
        if (!_supportsNFT) require(_stakingToken != address(0), "Invalid staking token");
        if (_supportsNFT) require(_nftToken != address(0), "Invalid NFT token");

        Pool storage pool = pools[poolCount];
        pool.apy = _apy;
        pool.stakingToken = IERC20(_stakingToken);
        pool.rewardToken = IERC20(_rewardToken);
        pool.supportsNFT = _supportsNFT;
        pool.feeTier = _feeTier;
        pool.active = true;
        if (_supportsNFT) pool.nftToken = IERC721(_nftToken);
        pool.lpPairContract = _lpPairContract; // Store LP pair contract address

        emit PoolCreated(poolCount, _apy, _stakingToken, _rewardToken, _supportsNFT, _feeTier, _lpPairContract);
        poolCount++;
    }

    function activatePool(uint256 poolId) external onlyOwner {
        pools[poolId].active = true;
        emit PoolActivated(poolId);
    }

    function deactivatePool(uint256 poolId) external onlyOwner {
        pools[poolId].active = false;
        emit PoolDeactivated(poolId);
    }

    function stake(
        uint256 poolId,
        uint256 amount,
        uint256[] calldata nftIds
    ) external nonReentrant onlyValidFeeWallet onlyActivePool(poolId) meetsMinimumStake(poolId, amount) {
        Pool storage pool = pools[poolId];
        require(amount > 0 || nftIds.length > 0, "Must stake tokens or NFTs");

        if (amount > 0) {
            uint256 fee = (amount * depositFeeBps) / 10000;
            uint256 netAmount = amount - fee;

            require(pool.stakingToken.transferFrom(msg.sender, address(this), netAmount), "Token transfer failed");
            require(pool.stakingToken.transferFrom(msg.sender, feeWallet, fee), "Fee transfer failed");

            pool.userStakes[msg.sender] += netAmount;
            pool.totalStaked += netAmount;
        }

        if (nftIds.length > 0) {
            require(pool.supportsNFT, "NFTs not supported");
            for (uint256 i = 0; i < nftIds.length; i++) {
                INonfungiblePositionManager(positionManager).positions(nftIds[i]);
                pool.nftToken.transferFrom(msg.sender, address(this), nftIds[i]);
                pool.userNFTs[msg.sender].push(nftIds[i]);
                nftOwner[poolId][nftIds[i]] = msg.sender; // Assign NFT owner
            }
        }

        if (!poolUserExists[poolId][msg.sender]) {
            poolUserExists[poolId][msg.sender] = true;
            poolUsers[poolId].push(msg.sender);
        }

        pool.lastStakeTime[msg.sender] = block.timestamp;
        emit Staked(msg.sender, poolId, amount, nftIds);
    }

    function unstake(
        uint256 poolId,
        uint256 amount,
        uint256[] calldata nftIds
    ) external nonReentrant onlyValidFeeWallet onlyActivePool(poolId) {
        Pool storage pool = pools[poolId];
        require(amount > 0 || nftIds.length > 0, "Must unstake tokens or NFTs");
        require(block.timestamp >= pool.lastStakeTime[msg.sender] + UNSTAKE_COOLDOWN, "Cooldown active");

        if (amount > 0) {
            require(pool.userStakes[msg.sender] >= amount, "Insufficient tokens");

            uint256 fee = (amount * withdrawalFeeBps) / 10000;
            uint256 netAmount = amount - fee;

            pool.userStakes[msg.sender] -= amount;
            pool.totalStaked -= amount;

            require(pool.stakingToken.transfer(msg.sender, netAmount), "Token transfer failed");
            require(pool.stakingToken.transfer(feeWallet, fee), "Fee transfer failed");
        }

        if (nftIds.length > 0) {
            require(pool.supportsNFT, "NFTs not supported");
            for (uint256 i = 0; i < nftIds.length; i++) {
                uint256 index = findNFTIndex(pool.userNFTs[msg.sender], nftIds[i]);
                require(index < pool.userNFTs[msg.sender].length, "NFT not staked");

                pool.nftToken.transferFrom(address(this), msg.sender, nftIds[i]);
                delete nftOwner[poolId][nftIds[i]]; // Remove NFT owner
                pool.userNFTs[msg.sender][index] = pool.userNFTs[msg.sender][pool.userNFTs[msg.sender].length - 1];
                pool.userNFTs[msg.sender].pop();
            }
        }

        emit Unstaked(msg.sender, poolId, amount, nftIds);
    }

    function claimRewards(uint256 poolId) external nonReentrant onlyActivePool(poolId) {
        Pool storage pool = pools[poolId];
        uint256 reward = calculateReward(poolId, msg.sender);
        require(reward > 0, "No rewards available");

        pool.lastStakeTime[msg.sender] = block.timestamp;
        pool.rewardToken.transfer(msg.sender, reward);
        pool.totalRewardsDistributed += reward; // Track total rewards
        emit RewardClaimed(msg.sender, poolId, reward);
    }

    function calculateReward(uint256 poolId, address user) public view returns (uint256) {
        Pool storage pool = pools[poolId];
        uint256 userStake = pool.userStakes[user];
        uint256[] memory userNFTs = pool.userNFTs[user];
        uint256 totalLiquidity = 0;

        if (userStake > 0) {
            uint256 timeStaked = block.timestamp - pool.lastStakeTime[user];

            // Example multiplier logic
            uint256 multiplier;
            if (timeStaked > 90 days) {
                multiplier = 150; // 50% boost
            } else if (timeStaked > 30 days) {
                multiplier = 120; // 20% boost
            } else {
                multiplier = 100;
            }
            return (userStake * pool.apy * timeStaked * multiplier) / (365 days * 10000);
        }

        if (pool.supportsNFT && userNFTs.length > 0) {
            for (uint256 i = 0; i < userNFTs.length; i++) {
                uint256 liquidity;
                (, , , , , , , liquidity, , , , ) = INonfungiblePositionManager(positionManager).positions(userNFTs[i]);
                totalLiquidity += liquidity;
            }

            // Example multiplier logic for NFT liquidity
            uint256 nftMultiplier;
            if (totalLiquidity > 100000) {
                nftMultiplier = 130; // 30% boost
            } else if (totalLiquidity > 50000) {
                nftMultiplier = 120; // 20% boost
            } else {
                nftMultiplier = 100;
            }
            return (totalLiquidity * pool.apy * block.timestamp / pool.lastStakeTime[user] * nftMultiplier) / (365 days * 10000);
        }

        return 0;
    }

    function findNFTIndex(uint256[] storage nftArray, uint256 nftId) internal view returns (uint256) {
        for (uint256 i = 0; i < nftArray.length; i++) {
            if (nftArray[i] == nftId) {
                return i;
            }
        }
        revert("NFT not found");
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external pure override returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }

    // Function to fetch LP pair contract address
    function getLpPairContract(uint256 poolId) public view returns (address) {
        require(poolId < poolCount, "Invalid pool ID");
        return pools[poolId].lpPairContract;
    }

    // Function to fetch total liquidity in the LP pair
    function getTotalLiquidity(uint256 poolId) public view returns (uint128) {
        require(poolId < poolCount, "Invalid pool ID");
        uint128 totalLiquidity = 0;
        uint256[] memory tokenIds = pools[poolId].lpPositions;

        for (uint256 i = 0; i < tokenIds.length; i++) {
            (, , , , , , , uint128 liquidity, , , , ) = INonfungiblePositionManager(positionManager).positions(tokenIds[i]);
            totalLiquidity += liquidity;
        }

        return totalLiquidity;
    }

    // Function to fetch user-specific data
    function getUserInfo(uint256 poolId, address user)
        external
        view
        returns (uint256 userStake, uint256[] memory userNFTs, uint256 lastStakeTime, uint256 pendingRewards)
    {
        Pool storage pool = pools[poolId];
        uint256 rewards = calculateReward(poolId, user);
        return (
            pool.userStakes[user],
            pool.userNFTs[user],
            pool.lastStakeTime[user],
            rewards
        );
    }

    // Function to fetch all active pools
    function getActivePools() external view returns (uint256[] memory) {
        uint256[] memory activePools = new uint256[](poolCount);
        uint256 count = 0;

        for (uint256 i = 0; i < poolCount; i++) {
            if (pools[i].active) {
                activePools[count] = i;
                count++;
            }
        }

        // Resize the array to match the count of active pools
        assembly {
            mstore(activePools, count)
        }

        return activePools;
    }

    // Function to fetch pending rewards for a user
    function getPendingRewards(uint256 poolId, address user) external view returns (uint256) {
        require(poolId < poolCount, "Invalid pool ID");
        return calculateReward(poolId, user);
    }

    // Function to allow emergency withdrawal of staked tokens and NFTs
    function emergencyWithdraw(uint256 poolId) external nonReentrant {
        require(poolId < poolCount, "Invalid pool ID");
        Pool storage pool = pools[poolId];

        uint256 stakedAmount = pool.userStakes[msg.sender];
        require(stakedAmount > 0, "No stake to withdraw");

        pool.userStakes[msg.sender] = 0;
        pool.totalStaked -= stakedAmount;

        require(pool.stakingToken.transfer(msg.sender, stakedAmount), "Withdrawal failed");

        uint256[] memory userNFTs = pool.userNFTs[msg.sender];
        for (uint256 i = 0; i < userNFTs.length; i++) {
            pool.nftToken.transferFrom(address(this), msg.sender, userNFTs[i]);
        }
        delete pool.userNFTs[msg.sender];

        emit Unstaked(msg.sender, poolId, stakedAmount, userNFTs);
    }

    // Function to update certain details of a pool
    function updatePoolDetails(
        uint256 poolId,
        uint256 newApy,
        bool newActiveStatus
    ) external onlyOwner {
        require(poolId < poolCount, "Invalid pool ID");

        Pool storage pool = pools[poolId];
        pool.apy = newApy;
        pool.active = newActiveStatus;
    }

    // Function to set minimum stake requirement for a pool
    mapping(uint256 => uint256) public minimumStake;

    function setMinimumStake(uint256 poolId, uint256 amount) external onlyOwner {
        require(poolId < poolCount, "Invalid pool ID");
        minimumStake[poolId] = amount;
        emit MinimumStakeSet(poolId, amount);
    }

    // Function to deposit additional reward tokens for a specific pool
    function depositRewards(uint256 poolId, uint256 amount) external onlyOwner {
        require(poolId < poolCount, "Invalid pool ID");
        Pool storage pool = pools[poolId];

        require(pool.rewardToken.transferFrom(msg.sender, address(this), amount), "Deposit failed");
        emit RewardsDeposited(poolId, amount);
    }

    // Fallback function to prevent accidental ETH transfers
    fallback() external {
        revert("Direct ETH transfers not allowed");
    }
}


