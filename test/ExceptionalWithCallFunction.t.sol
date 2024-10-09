// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import { Test, console } from "forge-std/Test.sol";
import { Callee, Caller } from "../src/exception/ExceptionWithCallFunction.sol";

contract ExceptionWithCallFunctionTest is Test {
	Callee public callee;
	Caller public caller;

	function setUp() public {
		callee = new Callee();
		caller = new Caller(address(callee));
	}

	function testCallCalleeFunction() public {
		uint8 doubledValue = caller.callCalleeFunction(200);
		assertEq(doubledValue, 100);
	}
}
