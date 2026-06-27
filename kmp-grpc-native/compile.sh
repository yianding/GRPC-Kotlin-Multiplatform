#!/usr/bin/env bash
set -e

profile="${1:-dev}"

targets=("aarch64-apple-darwin" "aarch64-apple-ios" "aarch64-apple-ios-sim" "x86_64-apple-ios" "x86_64-apple-darwin")

for target in "${targets[@]}"; do
    echo "Adding Rust target: $target"
    rustup target add "$target" 2>/dev/null || true
done

args=()
for target in "${targets[@]}"; do
    args+=(--target "$target")
done

cargo build "${args[@]}" --profile "${profile}"
