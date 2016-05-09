

@interface DataSource : NSObject {
    
    NSMutableArray* cards;
    NSInteger cardIndex;
}

@property (strong, readwrite, nonatomic) NSMutableArray* cards;
@property (readwrite, nonatomic) NSInteger cardIndex;

+(DataSource*) sharedDataSource;

-(void) initCards;

-(void) incrementCardIndex;
-(void) decrementCardIndex;
-(NSMutableDictionary*) getCurrentCard;

@end
