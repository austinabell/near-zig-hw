# Zig hello world contract

```bash
# Builds to zig-out/lib/hello.wasm
zig build -Dtarget=wasm32-freestanding -Drelease-small=true

# Deploy contract (swap hlo.testnet with account)
near deploy hlo.testnet ./zig-out/hello.wasm

# Send transaction to contract
near call hlo.testnet hello --accountId hlo.testnet --args '{"name": "Austin"}'

# Or make a view call
near view hlo.testnet hello --args '{"name": "Austin"}'
```