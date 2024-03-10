"use client";
import { SquidWidget } from "@0xsquid/widget";
export default function Swap() {
  return (
    <section className="h-[85vh] flex items-center justify-center">
      <div className="w-fit border-2 p-5 rounded-xl">
      <SquidWidget
        config={{
          integratorId: "0xSquid",
        }}
        />
        </div>
    </section>
  );
}
