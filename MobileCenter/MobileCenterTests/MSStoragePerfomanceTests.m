#import <XCTest/XCTest.h>
#import "MSStartServiceLog.h"
#import "MSDBStorage.h"

static const int kMSNumLogs = 50;
static const int kMSNumServices = 5;
static NSString *const kMSTestGroupId = @"TestGroupId";

@interface MSStoragePerfomanceTests : XCTestCase
@end

@interface MSStoragePerfomanceTests ()

@property(nonatomic) MSDBStorage *dbStorage;

@end

@implementation MSStoragePerfomanceTests

@synthesize dbStorage;

- (void)setUp {
  [super setUp];
  self.dbStorage = [MSDBStorage new];
}

- (void)tearDown {
  [super tearDown];
  [self.dbStorage deleteLogsWithGroupId:kMSTestGroupId];
}

#pragma mark - Database storage tests

- (void)testDatabaseWriteShortLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithShortServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

- (void)testDatabaseWriteLongLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithLongServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

- (void)testDatabaseWriteVeryLongLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithVeryLongServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

#pragma mark - File storage tests

- (void)testFileStorageWriteShortLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithShortServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

- (void)testFileStorageWriteLongLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithLongServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

- (void)testFileStorageWriteVeryLongLogsPerformance {
  NSArray<MSStartServiceLog *> *arrayOfLogs =
      [self generateLogsWithVeryLongServicesNames:kMSNumLogs withNumService:kMSNumServices];
  [self measureBlock:^{
    for (MSStartServiceLog *log in arrayOfLogs) {
      [self.dbStorage saveLog:log withGroupId:kMSTestGroupId];
    }
  }];
}

#pragma mark - Private

- (NSArray<MSStartServiceLog *> *)generateLogsWithShortServicesNames:(int)kMSNumLogs withNumService:(int)kMSNumServices {
  NSMutableArray<MSStartServiceLog *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumLogs; ++i) {
    MSStartServiceLog *log = [MSStartServiceLog new];
    log.services = [self generateServicesWithShortNames:kMSNumServices];
    [dic addObject:log];
  }
  return dic;
}

- (NSArray<MSStartServiceLog *> *)generateLogsWithLongServicesNames:(int)kMSNumLogs withNumService:(int)kMSNumServices {
  NSMutableArray<MSStartServiceLog *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumLogs; ++i) {
    MSStartServiceLog *log = [MSStartServiceLog new];
    log.services = [self generateServicesWithLongNames:kMSNumServices];
    [dic addObject:log];
  }
  return dic;
}

- (NSArray<MSStartServiceLog *> *)generateLogsWithVeryLongServicesNames:(int)kMSNumLogs withNumService:(int)kMSNumServices {
  NSMutableArray<MSStartServiceLog *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumLogs; ++i) {
    MSStartServiceLog *log = [MSStartServiceLog new];
    log.services = [self generateServicesWithVeryLongNames:kMSNumServices];
    [dic addObject:log];
  }
  return dic;
}

- (NSArray<NSString *> *)generateServicesWithShortNames:(int)kMSNumServices {
  NSMutableArray<NSString *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumServices; ++i) {
    [dic addObject:[[NSUUID UUID] UUIDString]];
  }
  return dic;
}

- (NSArray<NSString *> *)generateServicesWithLongNames:(int)kMSNumServices {
  NSMutableArray<NSString *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumServices; ++i) {
    NSString *value = @"";
    for (int j = 0; j < 10; ++j) {
      value = [value stringByAppendingString:[[NSUUID UUID] UUIDString]];
    }
    [dic addObject:value];
  }
  return dic;
}

- (NSArray<NSString *> *)generateServicesWithVeryLongNames:(int)kMSNumServices {
  NSMutableArray<NSString *> *dic = [NSMutableArray new];
  for (int i = 0; i < kMSNumServices; ++i) {
    NSString *value = @"";
    for (int j = 0; j < 50; ++j) {
      value = [value stringByAppendingString:[[NSUUID UUID] UUIDString]];
    }
    [dic addObject:value];
  }
  return dic;
}

@end
