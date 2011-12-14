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
@synthesize categories;
@synthesize auther;
@synthesize comments;
@synthesize pubDate;
@synthesize attributes;
@synthesize source;

-(id)init{
    self = [super init];
    title = [[NSString alloc]init];
    itemDiscription = [[NSString alloc]init];
    link = [[NSURL alloc]init];
    categories = [[NSMutableArray alloc]init];
    auther = [[NSString alloc]init];
    comments = [[NSURL alloc]init];
    pubDate = [[NSDate alloc]init];
    
    return self;
}

@end
