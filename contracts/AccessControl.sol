// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import { IAccessControl } from "./interfaces/IAccessControl.sol";

contract AccessControl is IAccessControl {
    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    
    mapping (bytes32 => mapping(address => bool)) private roles;

    modifier onlyRole(bytes32 role) {
        if(_has(role, msg.sender) == false) revert RoleNotGranted(role, msg.sender);
        _;
    }

    modifier onlyAdmin() {
        if(_has(ADMIN_ROLE, msg.sender) == false) revert RoleNotAdmin(ADMIN_ROLE, msg.sender);
        _;
    }

    constructor() {
        _grant(ADMIN_ROLE, msg.sender);
    }

    function has (bytes32 _role, address _account) external view override returns (bool) {
        return _has(_role, _account);
    }

    function grant (bytes32 _role, address _account) external override onlyAdmin {
        _grant(_role, _account);

        emit RoleGranted(_role, _account, msg.sender);
    }

    function revoke (bytes32 _role, address _account) external override onlyAdmin {
        if(_has(_role, _account) == false) revert RoleNotGranted(_role, _account);
        roles[_role][_account] = false;

        emit RoleRevoked(_role, _account, msg.sender);
    }

    function renounce (bytes32 _role) external override {
        if(_has(_role, msg.sender) == false) revert RoleNotGranted(_role, msg.sender);
        roles[_role][msg.sender] = false;

        emit RoleRevoked(_role, msg.sender, msg.sender);
    }

    function _has(bytes32 _role, address _account) internal view returns (bool){
        return roles[_role][_account];
    }

    function _grant(bytes32 _role, address _account) internal {
        if(_has(_role, _account) == true) revert RoleAlreadyGranted(_role, _account);
        roles[_role][_account] = true;
    }
}