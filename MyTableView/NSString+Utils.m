//
//  NSString+Utils.m
//  MyTableView
//
//  Created by user116472 on 3/15/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString(NSStringUtils)


-(NSString *) firstLetterInUpperCase{
    
    NSString *letter = @"";
    if (self.length > 0){
        letter = [[self substringToIndex:1]capitalizedString];
    }
    return letter;
}

@end
