
require('@openzeppelin/hardhat-upgrades');
const { ethers, upgrades } = require("hardhat");

const Escrow_Address = "0x1E2eA8CDFDB8152F599b5Ab3b444F14b239fe54e";

async function main() {
  const EscrowV2 = await ethers.getContractFactory("Escrow");

  const escrowV2 = await upgrades.upgradeProxy(Escrow_Address,EscrowV2);
  console.log("Beacon upgrade on:", escrowV2.address);
}

main();