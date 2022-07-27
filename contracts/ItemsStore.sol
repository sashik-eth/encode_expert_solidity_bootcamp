// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.15;

error WrongIndex();

contract ItemsStore {
    uint256[] public items;

    function getItems() external view returns (uint256[] memory) {
        return items;
    }

    function addItem(uint256 item) external {
        items.push(item);
    }

    function deleteItem(uint256 index) external {
        uint256 length = items.length;
        if (index >= length) revert WrongIndex();
        items[index] = items[length - 1];
        items.pop();
    }

    function deleteItemWithSavingOrder(uint256 index) external {
        uint256 length = items.length;
        if (index >= length) revert WrongIndex();
        for (uint256 i = index; i < length - 1; ) {
            items[i] = items[i + 1];
            unchecked {
                ++i;
            }
        }
        items.pop();
    }
}
