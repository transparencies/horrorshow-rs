#!/bin/bash
set -e

awk '!(/# target: / && !/\<'$TRAVIS_RUST_VERSION'\>/) { print($0); }' Cargo.toml > Cargo.toml.tmp
mv Cargo.toml.tmp Cargo.toml
if [ ! "$TRAVIS_RUST_VERSION" = "nightly" ]; then
    rm -r benches
fi
