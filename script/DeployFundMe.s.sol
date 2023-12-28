// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from 'forge-std/Script.sol';
import {FundMe} from '../src/FundMe.sol';
import {HelperConfig} from './HelperConfig.s.sol';


contract DeployFundMe is Script{
    
    function run() external returns (FundMe){
        HelperConfig helperConfig = new HelperConfig();
        address ethUsdPricFeed = helperConfig.activeNetworkConfig();
        //before broadcast means no gas used, not real transaction
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPricFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}