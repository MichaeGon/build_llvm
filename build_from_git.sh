#!/bin/sh -x

PREFIX=/usr/local/llvm
DIR=./build
TYPE=Release
#PROJS="clang;clang-tools-extra;libcxx;libcxxabi;compiler-rt;lld;polly;lldb"
PROJS="clang;clang-tools-extra;libcxx;libcxxabi;compiler-rt;lld;polly"

if [ $# -lt 1 ] ; then \
    echo "no arguments"
    exit 1
fi

if [ $# -gt 1 ] ; then 
    echo "too many arguments"
    exit 1
fi 

TAG=tags/llvmorg-${1}

rm -rf ${DIR}
git stash 
git checkout ${TAG}

mkdir ${DIR}
cd ${DIR}
cmake -G Ninja -DLLVM_TARGETS_TO_BUILD=all -DCMAKE_INSTALL_PREFIX=${PREFIX} -DLLVM_ENABLE_PROJECTS=${PROJS} -DCMAKE_BUILD_TYPE=${TYPE} ../llvm
ninja
