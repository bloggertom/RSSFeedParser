//
//  RSSXMLParsingDelegate.m
//  Shopshire App
//
//  Created by Thomas Wilson on 16/11/2011.
//  Copyright (c) 2011 aberystwyth university. All rights reserved.
//

#import "RSSNSXMLParsingDelegate.h"

@implementation RSSNSXMLParsingDelegate
@synthesize url, parser;
@synthesize currentItem;
@synthesize currentArray;
@synthesize currentString;

-(id)init{
    return [self initWithURL:@""];
}

-(id)initWithURL:(NSString *)thisURL{
    self = [super init];
    url = [[NSURL alloc]initWithString:thisURL];
    //parser = [[NSXMLParser alloc]init];
    return self;
}

-(NSMutableArray *) getRSSArray{
    if(parser == nil){
        parser = [[NSXMLParser alloc]initWithContentsOfURL:url];
    }
    parser.delegate = self;
    
    if ([[url absoluteString] isEqualToString:@""]) {
        NSLog(@"No Url Input");
        return nil;
    }
    if ([parser parse]) {
        NSLog(@"RSS parsing Success");
        NSLog(@"Number of items added: %d",currentArray.count);
         return currentArray;
    }else {
        NSLog(@"RSS parsing failed");
        return nil;
    }
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"channel"]) {
        if (currentArray == nil) {
            currentArray = [[NSMutableArray alloc]init];
        }
        
        return;
    }
    if ([elementName isEqualToString:@"item"]) {
        if (currentItem == nil) {
            currentItem = [[RSSItem alloc]init];
        }
        return;
    }
    
    
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    currentString = nil;
    if (!currentString) {
		currentString =[[NSMutableString alloc]init];
	}
    currentString = [NSMutableString stringWithString:string];
    currentString = [self xmlSimpleUnescapeString:currentString];
	
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqualToString:@"title"]) {
        if (currentItem) {
            currentItem.title = (NSString *)currentString;
        }
        return;
    }
    if ([elementName isEqualToString:@"description"]) {
        if (currentItem) {
            currentItem.itemDiscription = (NSString *)currentString;
        }
        return;
    }
    if ([elementName isEqualToString:@"link"]) {
        if (currentItem) {
            currentItem.link = [NSURL URLWithString:currentString];
        }
        return;
    }
    if ([elementName isEqualToString:@"catagory"]) {
        if (currentItem) {
            currentItem.catagory = (NSString *) currentString;
        }
        return;
    }
    if ([elementName isEqualToString:@"item"]) {
        [currentArray addObject:currentItem];
        currentItem = nil;
        return;
    }
    
    
}

- (NSMutableString *)xmlSimpleUnescapeString:(NSMutableString *)thisString
{
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
