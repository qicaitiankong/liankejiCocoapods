//
//  ShareDataBase.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/1.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "ShareDataBase.h"
#import "ShareHomePath.h"
static ShareDataBase *shareDataBase = nil;
FMDatabase *dataBase = nil;
@implementation ShareDataBase
+(ShareDataBase*)shareDataBase{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        shareDataBase = [[ShareDataBase alloc]init];
    });
    return shareDataBase;
}
- (FMDatabase*)getDataBase:(NSString*)_dataBaseName{
    NSString *documentPath = [[ShareHomePath GetShareHome] getDocumentsPath];
    NSString *dataBaseName = _dataBaseName;
    NSString *dataBasePath = [documentPath stringByAppendingPathComponent:dataBaseName];
    dataBase = [FMDatabase databaseWithPath:dataBasePath];
    return dataBase;
}
- (BOOL)openDataBase{
    BOOL suc = NO;
    if(dataBase){
        suc = [dataBase open];
        if(suc){
            NSLog(@"success");
        }else{
            NSLog(@"error");
        }
    }
    return suc;
}
/**
 *  建表
 *
 *  @param _createSqlString <#_createSqlString description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)createTable:(NSString *)_createSqlString{
    NSString *createSqlStr = _createSqlString;
    BOOL suc = [dataBase executeStatements:createSqlStr];
    return suc;
}
- (BOOL)insertDataIntoTable:(NSString *)_insertSqlStr insertDataArray:(NSArray*)_insertDataArray error:(NSError*)_error{
    NSString *insertSqlStr = _insertSqlStr;
    BOOL suc = [dataBase executeUpdate:insertSqlStr values:_insertDataArray error:&_error];
    return suc;
}
-(BOOL)updateDataBase:(NSString*)_updateSqlStr updateContentArray:(NSArray*)_arr error:(NSError*)_error{
    NSString *updateSqlStr = _updateSqlStr;
    BOOL suc = [dataBase executeUpdate:updateSqlStr values:_arr error:&_error];
    return suc;
}
-(FMResultSet*)searchTable:(NSString*)_searchSqlStr searchValues:(NSArray*)_searchArray error:(NSError*)_error{
    NSString *searchSqlStr = _searchSqlStr;
    FMResultSet *resultSet = [dataBase executeQuery:searchSqlStr values:_searchArray error:&_error];
    return resultSet;
}
- (BOOL)deleteRecordFromTable:(NSString*)_deleteSqlStr valuesArray:(NSArray*)_valuesArray deleteError:(NSError*)_error {
    NSString *deleteStr =_deleteSqlStr;
    BOOL suc = [dataBase executeUpdate:deleteStr values:_valuesArray error:&_error];
    return suc;
}
@end
