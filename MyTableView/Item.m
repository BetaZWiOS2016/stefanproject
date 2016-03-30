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
    return [self initWithTitle:@"empty" andPrice:0];
}

-(id) initWithTitle:(NSString*)title andPrice:(NSInteger)price{
    
    self = [super init];
    if (self) {
        self.date = [NSDate date];
        self.title = title;
        self.price = price;
    }
    return self;
    
}



-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %ld",self.date,self.title,(long)self.price ];
}

+(NSArray *) fetchdata{
    
    Item *item1 = [[Item alloc] initWithTitle:@"TV" andPrice:3];
    Item *item2 = [[Item alloc] initWithTitle:@"Radio" andPrice:10];
    Item *item3 = [[Item alloc] initWithTitle:@"Car" andPrice:45];
    Item *item4 = [[Item alloc] initWithTitle:@"Table" andPrice:87];
    Item *item5 = [[Item alloc] initWithTitle:@"Chair" andPrice:444];
    Item *item6 = [[Item alloc] initWithTitle:@"Laptop" andPrice:35];
    Item *item7 = [[Item alloc] initWithTitle:@"Desktop" andPrice:6];
    Item *item8 = [[Item alloc] initWithTitle:@"Headphones" andPrice:7];
    Item *item9 = [[Item alloc] initWithTitle:@"House" andPrice:875];

    
    
    return @[item1,item2,item3,item4,item5,item6,item7,item8,item9];
}


@end
