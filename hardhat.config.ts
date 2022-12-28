import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-etherscan";
import "hardhat-deploy";

import * as dotenv from 'dotenv';

dotenv.config();


const { ALCHEMY_API_KEY, PRIVATE_KEY, POLYGONSCAN_API_KEY } = process.env;
// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
export default {
  solidity: {
    compilers: [
      {
        version: "0.8.9",
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
        url: `https://eth-mainnet.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
        blockNumber: 12956195
      }
    },
    mumbai: {
      url: "https://matic-mumbai.chainstacklabs.com",
      accounts: [PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      matic: POLYGONSCAN_API_KEY,
      mumbai: POLYGONSCAN_API_KEY
    },
    customChains: [
      {
        network: "matic",
        chainId: 137,
        urls: {
          apiURL: "https://api.polygonscan.com",
          browserURL: "https://polygonscan.com"
        }
      },
      {
        network: "mumbai",
        chainId: 80001,
        urls: {
          apiURL: "https://api-testnet.polygonscan.com",
          browserURL: "https://mumbai.polygonscan.com"
        }
      }]
  }

};