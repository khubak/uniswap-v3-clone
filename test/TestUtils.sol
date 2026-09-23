pragma solidity ^0.8.14;

import "../src/UniswapV3Pool.sol";

abstract contract TestUtils {
    function encodeError(
        string memory err
    ) internal pure returns (bytes memory encoded) {
        encoded = abi.encodeWithSignature(err);
    }

    // function encodeExtra(
    //     address token0_,
    //     address token1_,
    //     address payer
    // ) internal pure returns (bytes memory) {
    //     return
    //         abi.encode(
    //             UniswapV3Pool.CallbackData({
    //                 token0: token0_,
    //                 token1: token1_,
    //                 payer: payer
    //             })
    //         );
    // }
}
