// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

import "abdk-math/ABDKMath64x64.sol";

import "../src/UniswapV3Pool.sol";

abstract contract TestUtils {
    function tick(uint256 price) internal pure returns (int24 tick_) {
        tick_ = TickMath.getTickAtSqrtRatio(
            uint160(
                int160(
                    ABDKMath64x64.sqrt(int128(int256(price << 64))) <<
                        (FixedPoint96.RESOLUTION - 64)
                )
            )
        );
    }

    function encodeError(
        string memory err
    ) internal pure returns (bytes memory encoded) {
        encoded = abi.encodeWithSignature(err);
    }

    function encodeExtra(
        address token0_,
        address token1_,
        address payer
    ) internal pure returns (bytes memory) {
        return
            abi.encode(
                UniswapV3Pool.CallbackData({
                    token0: token0_,
                    token1: token1_,
                    payer: payer
                })
            );
    }
}
