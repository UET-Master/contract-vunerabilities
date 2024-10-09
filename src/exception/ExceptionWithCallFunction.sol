// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Callee {
	function doubleValue(uint8 value) external pure returns (uint8) {
		return value * 2;
	}
}

contract Caller {
	address calleeAddress;

	constructor(address _calleeAddress) {
		calleeAddress = _calleeAddress;
	}

	function callCalleeFunction(uint8 value) public returns (bytes memory) {
		(, bytes memory bytesValue) = calleeAddress.call(
			abi.encodeWithSignature("doubleValue(uint8)", value)
		);

		return bytesValue;
	}
}
