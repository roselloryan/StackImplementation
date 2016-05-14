//
//  main.m
//  StackInterface


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *line = @"10 -2 3 4 5";
     
        NSMutableArray *lineComponents = [[line componentsSeparatedByString:@" "] mutableCopy];

        NSInteger numberOfNumbers = lineComponents.count;

        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        if (numberOfNumbers % 2 == 0) {
            NSInteger i = 0;
            for (i = 0; i < numberOfNumbers / 2; i ++) {
                NSString *numStr = [lineComponents objectAtIndex:lineComponents.count - 1];
                [solutionString appendFormat:@"%@ ", numStr];
                [lineComponents removeObjectAtIndex:lineComponents.count - 1];
                [lineComponents removeObjectAtIndex:lineComponents.count - 1];
            }
        }
        else {
            NSInteger j = 0;
            for (j = 0; j < numberOfNumbers / 2 + 1; j ++) {
                NSString *numStr = [lineComponents objectAtIndex:lineComponents.count - 1];
                [solutionString appendFormat:@"%@ ", numStr];
                [lineComponents removeObjectAtIndex:lineComponents.count - 1];
                if (lineComponents.count > 0) {
                    [lineComponents removeObjectAtIndex:lineComponents.count - 1];
                }
            }
        }
        NSRange lastSpaceRange = NSMakeRange(solutionString.length - 1, 1);
        [solutionString deleteCharactersInRange:lastSpaceRange];
        
        NSLog(@"solutionString: %@", solutionString);
        
    }
    return 0;
}

//  works fine, but CodeEval doesn not allow lastOject method, so must find alternate solution
/*
// even number of numbers in line
if (numberOfNumbers % 2 == 0) {
    
    NSInteger i = 0;
    for (i = 0; i < numberOfNumbers / 2; i ++) {
        NSString *numberString = [lineComponents lastObject];
        [solutionString appendFormat:@"%@ ", numberString];
        [lineComponents removeLastObject];
        [lineComponents removeLastObject];
    }
}
// odd number of numbers in line
else {
    NSInteger j = 0;
    for (j = 0; j < (numberOfNumbers / 2) + 1; j ++) {
        NSString *numberString = [lineComponents lastObject];
        [solutionString appendFormat:@"%@ ", numberString];
        [lineComponents removeLastObject];
        if (lineComponents.count > 0) {
            [lineComponents removeLastObject];
        }
    }
}
NSRange lastSpaceRange = NSMakeRange(solutionString.length - 1, 1);
[solutionString deleteCharactersInRange:lastSpaceRange];

NSLog(@"solutionString: %@", solutionString);
*/