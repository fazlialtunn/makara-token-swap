"use client";
import Header from "@/components/header";
import Swap from "@/components/swap";
import Image from "next/image";
import { MetaMaskUIProvider } from "@metamask/sdk-react-ui";
import { useEffect, useState } from "react";

export default function Home() {
  useEffect(() => {
    (async () => {
      if (window.ethereum !== undefined) {
        await window.ethereum.request({
          method: "wallet_addEthereumChain",
          params: [
            {
              chainId: "0xa86a",
              chainName: "Avalanche Mainnet",
              nativeCurrency: {
                name: "AVAX",
                symbol: "AVAX",
                decimals: 18,
              },
              rpcUrls: ["https://api.avax.network/ext/bc/C/rpc"],
              blockExplorerUrls: ["https://cchain.explorer.avax.network/"],
            },
          ],
        });

        await window.ethereum.request({
          method: "wallet_switchEthereumChain",
          params: [
            {
              chainId: "0xa86a",
            },
          ],
        });
      }
    })();
  }, []);

  return (
    <>
      <MetaMaskUIProvider
        sdkOptions={{
          defaultReadOnlyChainId: "0x1",
          dappMetadata: {
            name: "Example React UI Dapp",
          },
          // Other options
        }}
      >
        <Header />
        <Swap />
      </MetaMaskUIProvider>
    </>
  );
}
