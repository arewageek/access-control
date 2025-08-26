# Access Control

Access Control is a Solidity library for implementing role-based access control mechanisms in smart contracts. It provides a simple and effective way to manage permissions and enforce authorization through customizable roles.

## Features

- Role-based access control for Solidity contracts.
- Default ADMIN_ROLE for managing other roles.
- Functions to grant, revoke, and renounce roles.
- Easy integration with other contracts.

## Installation

You can install the package using your preferred package manager:

```bash
npm install arewageek/access-control
# or
bun add arewageek/access-control
# or
yarn add arewageek/access-control
# or
pnpm install arewageek/access-control
```

## Usage

To integrate `AccessControl` into your contract:

```solidity
import {AccessControl} from '@arewageek/access-control/contracts/AccessControl.sol';

contract Token {
    // Your contract code here
    AccessControl public ac;
}
```

### Granting Roles

Only accounts with `ADMIN_ROLE` can grant roles:

```solidity
ac.grant(MY_ROLE, _walletAddress);
```

### Revoking Roles

Only accounts with ADMIN_ROLE can revoke roles:

```solidity
ac.revoke(MY_ROLE, _walletAddress);
```

### Renouncing Roles

Any account can renounce a role it holds:

```solidity
ac.renounce(MY_ROLE);
```

## Contract Details

- `ADMIN_ROLE`: Default admin role with privileges to grant or revoke other roles.
- `onlyRole(bytes32 role)`: Modifier to restrict access to specific roles.
- `onlyAdmin`: Modifier to restrict access to admin-only functions.

## Key Functions

- `hasRole(bytes32 role, address account)`: Returns whether an account holds a given role.
- `grantRole(bytes32 role, address account)`: Assigns a role to an account.
- `revokeRole(bytes32 role, address account)`: Removes a role from an account.
- `renounceRole(bytes32 role)`: Allows the caller to relinquish a role.

## License

This project is licensed under the MIT License.

## Issues

Report bugs or request features at: [https://github.com/arewageek/access-control/issues](https://github.com/arewageek/access-control/issues)

## How to Contribute

Contributions are very welcome from the community! Here's how to do that:

- Fork the repository on GitHub.
- Clone your fork and create a new branch:

```bash
git clone https://github.com/your-username/access-control.git
git checkout -b feature/your-feature-name
```

- Make your changes, ensuring they follow the existing style and structure.
- Write tests for your changes if applicable.
- Run tests to verify: `npx hardhat test`
- Commit your changes and push the branch: `git push origin feature/your-feature-name`
- Open a Pull Request from your branch to the `main` branch of the original repository.
