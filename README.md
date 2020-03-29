1.修改dbcontext中的连接字符串  
2.打开程序包管理器控制台 切换到lvzhen.model 
3.执行dotnet ef migrations add mirgation1 -v --新增migrations 
4.执行dotnet ef database update--更新数据库  
5.修改MycoreApp中的appsettings.json 连接字符串
