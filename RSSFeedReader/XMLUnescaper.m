//
//  HTMLToPlainTextTranslator.m
//  RSSFeedReader
//
//  Created by Thomas Wilson on 07/12/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "XMLUnescaper.h"

@implementation XMLUnescaper

-(id)init{
    return self = [super init];
    
}

- (NSMutableString *)xmlSimpleUnescapeString:(NSMutableString *)thisString{
    [thisString replaceOccurrencesOfString:@"&amp;"  withString:@"&"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&quot;" withString:@"\"" options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&#x27;" withString:@"'"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&#x39;" withString:@"'"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&#x92;" withString:@"'"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&#x96;" withString:@"'"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&gt;"   withString:@">"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];
    [thisString replaceOccurrencesOfString:@"&lt;"   withString:@"<"  options:NSLiteralSearch range:NSMakeRange(0, [thisString length])];

    return thisString;
}

@end
