//
//  com_example_HelloCommonCryptoViewController.m
//  HelloCommonCrypto
//
//  Created by Jordan Focht on 10/30/13.
//  Copyright (c) 2013 Jordan Focht. All rights reserved.
//

#import "com_example_HelloCommonCryptoViewController.h"
#import "NSData_NSDataAES256.h"

@interface com_example_HelloCommonCryptoViewController ()

@end

@implementation com_example_HelloCommonCryptoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSString *key = @"my password";
	NSString *secret = @"text to encrypt";

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults synchronize];
    NSData *cipher = [defaults dataForKey:@"encryptedData"];
    NSData *plain;

    if (cipher == nil) {
        plain = [secret dataUsingEncoding:NSUTF8StringEncoding];
        cipher = [plain AES256EncryptWithKey:key];
        [defaults setObject:cipher forKey:@"encryptedData"];
        [defaults synchronize];
    }

	plain = [cipher AES256DecryptWithKey:key];
    printf("%s\n", [[cipher description] UTF8String]);
	printf("%s\n", [[plain description] UTF8String]);
	printf("%s\n", [[[NSString alloc] initWithData:plain
                                          encoding:NSUTF8StringEncoding] UTF8String]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
