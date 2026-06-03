// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
/**
 * @title Big
 * @dev A clean, minimal template demonstrating cryptographic identity and access control.
 * Designed as a foundational blueprint for secure, ownership-gated smart contracts.
 */
contract Big {
    // The address of the developer/account that deployed the contract
    address public immutable owner;

    // Custom error for gas-efficient access control failure
    error Unauthorized();

    /**
     * @dev Sets the deployer as the initial owner of the contract. dot forget initialization

     */
    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Verifies if the caller is the registered owner.
     * @dev Serves as a cryptographic handshake to validate the caller's identity.
     * @return bool True if the caller is the owner.
     */
    function verifyBadge() external view returns (bool) {
        return msg.sender == owner;
    }

    /**
     * @notice Example modifier for access control.
     * @dev Reverts with a custom error if called by any account other than the owner.
     */
    modifier onlyOwner() {
        if (msg.sender != owner) {
            revertedWithUnauthorized();
        }
        _;
    }

    // Internal helper function to optimize gas overhead on modifier execution
    function revertedWithUnauthorized() internal pure {
        revert Unauthorized();
    }
}
