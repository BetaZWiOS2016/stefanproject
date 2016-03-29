//
//  Item.m
//  MyTableView
//
//  Created by user116472 on 3/29/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import "Item.h"

@implementation Item

-(instancetype)init{
    self = [super init];
    if (self) {
        self.date = achternaam;
        self.title = @"empty";
        self.price = 0;
    }
    return self;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %ld",self.date,self.title,(long)self.price ];
}

@end
