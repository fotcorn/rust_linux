#!/bin/bash
make
rustc --emit obj hello-main.rs --crate-type lib -C no-stack-check -C relocation-model=static
make

