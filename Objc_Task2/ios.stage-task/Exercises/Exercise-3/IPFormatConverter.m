#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSString *outOfRangeException = @"The numbers in the input array can be in the range from 0 to 255.";
    NSString *negativeNumberException = @"Negative numbers are not valid for input.";
    NSMutableString *result = [[NSMutableString alloc] initWithString:@""];
    NSMutableArray *formattedArray = [[NSMutableArray alloc] initWithArray:numbersArray];
    
    
    if (numbersArray == nil || [numbersArray isEqual:@[]]) {
        return  result;
    }
    if (numbersArray.count < 4) {
        while (formattedArray.count < 4) {
            [formattedArray addObject:@0];
        }
    }
    
    for (int i = 0; i < 4; i++) {
        if ([formattedArray[i] intValue] < 0) {
            return negativeNumberException;
        } else if ([formattedArray[i] intValue] > 255) {
            return outOfRangeException;
        } else {
            [result appendFormat:@"%@.", formattedArray[i]];
        }
    }
    return [result substringToIndex:[result length] - 1];
}

@end
