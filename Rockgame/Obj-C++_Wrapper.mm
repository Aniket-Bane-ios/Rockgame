//
//  Obj-C++_Wrapper.m
//  Rockgame
//
//  Created by Aniket Bane on 12/02/24.
//

#import <Foundation/Foundation.h>
#import "C++_Logic.hpp"
#import "C++_Header.h"

Computer ComputerObject;

@implementation computer_Cpp_Wrapper

- (NSString *)playGame:(NSString *)userSelection;
{
    const std::string selectionOfUser = [userSelection UTF8String];
    std::string result = ComputerObject.playComputer(selectionOfUser);
 
    NSString *resultString = [NSString stringWithUTF8String:result.c_str()]; //Convert to NSString
    
    return resultString;
}

@end

