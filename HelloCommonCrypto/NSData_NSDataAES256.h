//
//  NSData_NSDataAES256.h
//  HelloCommonCrypto
//
//  Created by Jordan Focht on 10/30/13.
//  Copyright (c) 2013 Jordan Focht. All rights reserved.
//

#import <CommonCrypto/CommonCryptor.h>
#import <Foundation/Foundation.h>

@interface NSData (AES256)
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end