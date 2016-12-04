//
//  ShareDataBase.h
//  Liankeji
//
//  Created by 李自豪 on 16/12/1.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
@interface ShareDataBase : NSObject
+ (ShareDataBase*)shareDataBase;

- (FMDatabase*)getDataBase:(NSString*)_dataBaseName;//直接在Documents文件夹下创建该名称的数据库

- (BOOL)openDataBase;//打开数据库

- (BOOL)createTable:(NSString *)_createSqlString;//创建表

- (BOOL)insertDataIntoTable:(NSString *)_insertSqlStr insertDataArray:(NSArray*)_insertDataArray error:(NSError*)_error;//插入数据
//更新表
- (BOOL)updateDataBase:(NSString*)_updateSqlStr updateContentArray:(NSArray*)_arr error:(NSError*)_error;
//查询表
-(FMResultSet*)searchTable:(NSString*)_searchSqlStr searchValues:(NSArray*)_searchArray error:(NSError*)_error;
//删除数据
- (BOOL)deleteRecordFromTable:(NSString*)_deleteSqlStr valuesArray:(NSArray*)_valuesArray deleteError:(NSError*)_error ;

@end
