
#import "NSObject+PropertiesAsDictionary.h"
#import <objc/runtime.h>

@implementation NSObject (PropertiesAsDictionary)


- (NSDictionary*) propertiesAsDictionary
{
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    
    unsigned count;
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        [dict setObject:[self valueForKey:key] forKey:key];
    }
    
    free(properties);
    
    return [NSDictionary dictionaryWithDictionary:dict];
}

@end
