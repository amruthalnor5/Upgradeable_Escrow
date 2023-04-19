/** @type import('hardhat/config').HardhatUserConfig */

require('@openzeppelin/hardhat-upgrades');
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");

const { APP_URL, PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.2",
  networks: {
    hardhat: {},
    mumbai: {
       url: APP_URL,
       accounts: [`0x${PRIVATE_KEY}`]
    }
 },
};
