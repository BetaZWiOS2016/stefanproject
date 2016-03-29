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
    return [self inittitle:@"empty" initprice:0];
}

-(id) initTitle:(NSString*)title initPrice:(NSInteger*)price{
    
    self = [super init];
    if (self) {
        self.date = [NSDate date];
        self.title = title;
        self.price = *(price);
    }
    return self;
    
}



-(NSString *)description{
    return [NSString stringWithFormat:@"%@ %@ %ld",self.date,self.title,(long)self.price ];
}

//+(NSArray *) fetchpeople{
    
//    Item *item1 = [[Item alloc] initWithFname:@"Florian" andLName:@"Praile"];

    
    
  //  return @[item1];
//}


@end
