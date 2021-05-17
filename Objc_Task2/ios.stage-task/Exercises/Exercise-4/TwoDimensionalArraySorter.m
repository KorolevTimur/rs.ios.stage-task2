#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray<NSNumber *> *numbersArray = [NSMutableArray new];
    NSMutableArray<NSString *> *stringsArray = [NSMutableArray new];
    
    if (![array[0] isKindOfClass: [NSArray class]]) {
        return @[];
    }
    for (NSArray *subarray in array) {
        for (id item in subarray) {
            if ([item isKindOfClass: NSString.class]) {
                [stringsArray addObject:item];
            } else if ([item isKindOfClass: NSNumber.class]) {
                [numbersArray addObject:item];
            }
        }
    }
    if (numbersArray.count == 0) {
        return [stringsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    } else if (stringsArray.count == 0) {
        return [numbersArray sortedArrayUsingSelector:@selector(compare:)];
    } else {
        
        return [NSArray arrayWithObjects:[numbersArray sortedArrayUsingSelector:@selector(compare:)],
                [[[stringsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] reverseObjectEnumerator] allObjects], nil];
    }
}

@end
