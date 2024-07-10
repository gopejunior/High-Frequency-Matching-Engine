// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 2054
// Hash 7769
// Hash 2985
// Hash 9457
// Hash 4594
// Hash 2509
// Hash 2624
// Hash 9177
// Hash 9957
// Hash 5114
// Hash 3162
// Hash 1808
// Hash 1571
// Hash 4603
// Hash 3063
// Hash 2174
// Hash 8303
// Hash 7309
// Hash 9339
// Hash 4965
// Hash 2343
// Hash 5622
// Hash 2091
// Hash 6593
// Hash 8518
// Hash 9543
// Hash 5288
// Hash 7148
// Hash 1054
// Hash 7305
// Hash 4125
// Hash 9564
// Hash 1399