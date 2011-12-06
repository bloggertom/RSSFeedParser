//
//  RSSItem.m
//  Shopshire App
//
//  Created by Thomas Wilson on 05/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "RSSItem.h"

@implementation RSSItem
@synthesize title;
@synthesize itemDiscription;
@synthesize link;
@synthesize catagory;

-(id)init{
    self = [super init];
    title = [[NSString alloc]init];
    itemDiscription = [[NSString alloc]init];
    link = [[NSURL alloc]init];
    catagory = [[NSString alloc]init];
    
    return self;
}

@end
