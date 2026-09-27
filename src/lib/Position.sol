// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

library Position {
    struct Info {
        uint128 liquidity;
    }

    function update(
        Info storage self,
        int24 tick,
        uint128 liquidityDelta
    ) internal returns (bool flipped) {
        uint128 liquidityBefore = self.liquidity;
        uint128 liquidityAfter = liquidityBefore + liquidityDelta;

        flipped = (liquidityAfter == 0) != (liquidityBefore == 0);

        self.liquidity = liquidityAfter;
    }

    function get(
        mapping(bytes32 => Info) storage self,
        address owner,
        int24 lowerTick,
        int24 upperTick
    ) internal view returns (Position.Info storage position) {
        position = self[
            keccak256(abi.encodePacked(owner, lowerTick, upperTick))
        ];
    }
}
