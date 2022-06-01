// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeCast.sol";

library ArrayUint96 {
    using SafeCast for int256;
    using SafeCast for uint256;

    function includes(uint96[] storage _array, uint96 _value)
        internal
        view
        returns (bool)
    {
        require(_array.length > 0, "ArrayUint96: array should not be empty");
        for (uint256 i = 0; i < _array.length; i++) {
            if (_array[i] == _value) return true;
        }
        return false;
    }

    function indexOf(uint96[] storage _array, uint96 _value)
        internal
        view
        returns (int256)
    {
        require(_array.length > 0, "ArrayUint96: array should not be empty");
        for (uint256 i = 0; i < _array.length; i++) {
            if (_array[i] == _value) return i.toInt256();
        }
        return -1;
    }

    function lastIndexOf(uint96[] storage _array, uint96 _value)
        internal
        view
        returns (int256 r)
    {
        require(_array.length > 0, "ArrayUint96: array should not be empty");
        r = -1;
        for (uint256 i = 0; i < _array.length; i++) {
            if (_array[i] == _value) r = i.toInt256();
        }
    }

    function at(uint96[] storage _array, int256 _index)
        internal
        view
        returns (uint96)
    {
        require(_array.length > 0, "ArrayUint96: array should not be empty");
        uint256 index = _index < 0
            ? (_array.length.toInt256() + _index).toUint256()
            : _index.toUint256();
        require(
            index < _array.length,
            "ArrayUint96: index should not be greater than array length"
        );
        return _array[index];
    }

    // mutates the original array
    function remove(uint96[] storage _array, uint256 _index) internal {
        require(_array.length > 0, "ArrayUint96: array should not be empty");
        require(
            _index < _array.length,
            "ArrayUint96: index should not be greater than array length"
        );
        _array[_index] = _array[_array.length - 1];
        _array.pop();
    }
}
