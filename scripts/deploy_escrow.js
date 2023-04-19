
require('@openzeppelin/hardhat-upgrades');
const { ethers, upgrades } = require("hardhat");

async function main() {
  const Escrow = await ethers.getContractFactory("Escrow");

  const escrow = await upgrades.deployProxy(Escrow,[]);
  await escrow.deployed();
  console.log("Beacon deployed to:", escrow.address);
}

main();