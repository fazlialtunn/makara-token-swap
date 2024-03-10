async function main() {
    const BalanceDecreasingTransactionChecker = await ethers.getContractFactory("BalanceDecreasingTransactionChecker");
    const balanceDecreasingTransactionChecker = await BalanceDecreasingTransactionChecker.deploy();
  
    await balanceDecreasingTransactionChecker.deployed();
  
    console.log("BalanceDecreasingTransactionChecker deployed to:", balanceDecreasingTransactionChecker.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });
  