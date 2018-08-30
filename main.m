//
//  main.m
//  zaunzip
//
//  Created by Proteas on 2018/8/28.
//  Copyright © 2018年 Proteas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ZipArchive/ZipArchive.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        if (argc != 3) {
            NSLog(@"Usage: unzip zip-file-path dest-dir-path");
            exit(EXIT_FAILURE);
        }
        
        NSString *srcZipFilePath = [NSString stringWithUTF8String:argv[1]];
        NSLog(@"[+] src: %@", srcZipFilePath);
        
        NSString *destDirPath = [NSString stringWithUTF8String:argv[2]];
        NSLog(@"[+] dest: %@", destDirPath);
        
        BOOL ret = [SSZipArchive unzipFileAtPath:srcZipFilePath toDestination:destDirPath];
        if (ret == NO) {
            NSLog(@"[-] fail to unzip");
            exit(EXIT_FAILURE);
        }
        
        NSLog(@"[+] done");
    }
    
    return 0;
}
