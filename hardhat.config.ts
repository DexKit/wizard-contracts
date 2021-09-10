import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-ethers";

import * as dotenv from 'dotenv';

dotenv.config();


const { ALCHEMY_API } = process.env;
// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 export default {
  solidity: {
    compilers: [
      {
        version: "0.8.2",
      },
      {
        version: "0.6.0",
        settings: {},
      },
    ],
  },
  networks: {
    hardhat: {
      forking: {
        url: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_API}`,
        blockNumber: 12956195
      }
    }
  }
};