//
//  Item.h
//  MyTableView
//
//  Created by user116472 on 3/29/16.
//  Copyright © 2016 user116472. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property(strong,nonatomic) NSString* title;
@property(assign,nonatomic) NSInteger price;
@property(strong,nonatomic) NSDate* date;

+(NSArray *) fetchdata;

-(id) initWithTitle:(NSString*)title andPrice:(NSInteger)price;


@end
