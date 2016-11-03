#!/bin/bash

./configure --config=iPhoneSimulator-clang --static --omit=NetSSL_OpenSSL,Data/MySQL,Crypto,Data/ODBC,XML,Zip,JSON,MongoDB --prefix=ios/x86_64 --no-samples --no-tests
make -s -j4 IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=x86_64 -s -j4
make install IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=x86_64 -s -j4

./configure --config=iPhone-clang --static --omit=NetSSL_OpenSSL,Data/MySQL,Crypto,Data/ODBC,XML,Zip,JSON,MongoDB --prefix=ios/arm64 --no-samples --no-tests
make -s -j4 IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=arm64 -s -j4
make install IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=arm64 -s -j4

./configure --config=iPhone-clang --static --omit=NetSSL_OpenSSL,Data/MySQL,Crypto,Data/ODBC,XML,Zip,JSON,MongoDB --prefix=ios/armv7s --no-samples --no-tests
make -s -j4 IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=armv7s -s -j4
make install IPHONE_SDK_VERSION_MIN=8.0 POCO_TARGET_OSARCH=armv7s -s -j4

mkdir -p ios/universal/release
mkdir -p ios/universal/debug

lipo -create ios/armv7s/lib/libPocoData.a ios/arm64/lib/libPocoData.a -output ios/universal/release/libPocoData.a
lipo -create ios/armv7s/lib/libPocoDataSQLite.a ios/arm64/lib/libPocoDataSQLite.a -output ios/universal/release/libPocoDataSQLite.a
lipo -create ios/armv7s/lib/libPocoFoundation.a ios/arm64/lib/libPocoFoundation.a -output ios/universal/release/libPocoFoundation.a
lipo -create ios/armv7s/lib/libPocoData.a ios/arm64/lib/libPocoData.a ios/x86_64/lib/libPocoData.a -output ios/universal/debug/libPocoData.a
lipo -create ios/armv7s/lib/libPocoDataSQLite.a ios/arm64/lib/libPocoDataSQLite.a ios/x86_64/lib/libPocoDataSQLite.a -output ios/universal/debug/libPocoDataSQLite.a
lipo -create ios/armv7s/lib/libPocoFoundation.a ios/arm64/lib/libPocoFoundation.a ios/x86_64/lib/libPocoFoundation.a -output ios/universal/debug/libPocoFoundation.a
