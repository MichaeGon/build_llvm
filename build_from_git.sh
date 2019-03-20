#!/bin/sh -x

PREFIX=/usr/local/llvm
DIR=./build
TYPE=Release
PROJS="clang;clang-tools-extra;libcxx;libcxxabi;lldb;compiler-rt;lld;polly"

rm -rf ${DIR}
git pull origin master
mkdir ${DIR}
cd ${DIR}
cmake -G Ninja -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=WebAssembly -DLLVM_TARGETS_TO_BUILD=all -DCMAKE_INSTALL_PREFIX=${PREFIX} -DLLVM_ENABLE_PROJECTS=${PROJS} -DCMAKE_BUILD_TYPE=${TYPE} ../llvm
ninja
