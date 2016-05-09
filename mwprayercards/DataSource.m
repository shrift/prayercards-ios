#import "DataSource.h"

static DataSource* sharedDataSource = nil;

@implementation DataSource

@synthesize cards;
@synthesize cardIndex;

#pragma mark Singleton Methods
+ (id)sharedDataSource {
    @synchronized(self) {
        if (sharedDataSource == nil)
            sharedDataSource = [[self alloc] init];
    }
    return sharedDataSource;
}

- (id)init {
    if (self = [super init]) {
        
        [self initCards];
    }
    return self;
}


/*
- (void)dealloc {
    // Should never be called, but just here for clarity really.
}
*/

-(void) initCards {
    
    self.cards = [NSMutableArray arrayWithCapacity:10];
    
    NSMutableDictionary* d0 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d1 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d2 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d3 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d4 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d5 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d6 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d7 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d8 = [NSMutableDictionary dictionaryWithCapacity:5];
    NSMutableDictionary* d9 = [NSMutableDictionary dictionaryWithCapacity:5];
    
    [d0 setObject:@"Introduction" forKey:@"display title"];
    [d0 setObject:@"prayer_practice_cards" forKey:@"resource"];
    
    [d1 setObject:@"Act of Surrender" forKey:@"display title"];
    [d1 setObject:@"act_of_surrender" forKey:@"resource"];
    
    [d2 setObject:@"Adore God Through Focused Attention" forKey:@"display title"];
    [d2 setObject:@"adore_god" forKey:@"resource"];
    
    [d3 setObject:@"Be Still Meditation" forKey:@"display title"];
    [d3 setObject:@"be_still_meditation" forKey:@"resource"];
    
    [d4 setObject:@"Gratitude Examen" forKey:@"display title"];
    [d4 setObject:@"gratitude_examen" forKey:@"resource"];
    
    [d5 setObject:@"Prayer of Love and Remembrance" forKey:@"display title"];
    [d5 setObject:@"prayer_of_love" forKey:@"resource"];
    
    [d6 setObject:@"Scripture Meditation" forKey:@"display title"];
    [d6 setObject:@"scripture_meditation" forKey:@"resource"];
    
    [d7 setObject:@"The Divine Hours" forKey:@"display title"];
    [d7 setObject:@"the_divine_hours" forKey:@"resource"];
    
    
    [d8 setObject:@"The Jesus Prayer" forKey:@"display title"];
    [d8 setObject:@"the_jesus_prayer" forKey:@"resource"];
    
    [d9 setObject:@"The Serenity Prayer" forKey:@"display title"];
    [d9 setObject:@"serenity_prayer" forKey:@"resource"];
    
    
    [cards addObject:d0];
    [cards addObject:d1];
    [cards addObject:d2];
    [cards addObject:d3];
    [cards addObject:d4];
    [cards addObject:d5];
    [cards addObject:d6];
    [cards addObject:d7];
    [cards addObject:d8];
    [cards addObject:d9];
    
    self.cardIndex = 0;
}


-(NSMutableDictionary*) getCurrentCard {
    
    NSMutableDictionary* info = [self.cards objectAtIndex: cardIndex];
    return info;
}

-(void) incrementCardIndex {
    NSInteger currentIndex = self.cardIndex;
    currentIndex++;
    
    if (currentIndex >= [self.cards count]) {
        currentIndex = 0;
    }
    
    self.cardIndex = currentIndex;
}

-(void) decrementCardIndex {
    NSInteger currentIndex = self.cardIndex;
    currentIndex--;
    
    if (currentIndex < 0) {
        currentIndex = (NSInteger) [self.cards count] -1;
    }
    
    self.cardIndex = currentIndex;
}



@end