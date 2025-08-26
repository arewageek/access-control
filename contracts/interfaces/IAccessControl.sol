// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

interface IAccessControl {
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    function has(bytes32 role, address account) external view returns (bool);

    function grant(bytes32 role, address account) external;

    function revoke(bytes32 role, address account) external;

    function renounce(bytes32 role) external;

    error RoleNotFound(bytes32 role);
    error RoleNotAdmin(bytes32 role, address account);
    error RoleAlreadyGranted(bytes32 role, address account);
    error RoleNotGranted(bytes32 role, address account);
    error RoleNotRenounced(bytes32 role, address account);
    error RoleNotRevoked(bytes32 role, address account);
}