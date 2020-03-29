
using Lvzhen.Model.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;


namespace Lvzhen.DAL
{
    public class BaseDAL
    {
        DbContext db;
        public BaseDAL(DbContext db)
        {
           this.db = db;
        }
        //默认库
        public BaseDAL() : this(new testDbContext())
        {

        }

        #region 通用增删改查
        #region 非原始sql语句方式
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns>返回受影响行数</returns>
        public bool Add<T>(T entity) where T : class
        {
            db.Entry<T>(entity).State = EntityState.Added;
            return db.SaveChanges() > 0;
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns>返回受影响行数</returns>
        public bool Update<T>(T entity) where T : class
        {


            db.Set<T>().Attach(entity);
            db.Entry<T>(entity).State = EntityState.Modified;
            return db.SaveChanges() > 0;

        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="entity">实体</param>
        /// <returns>返回受影响行数</returns>
        public bool Delete<T>(T entity) where T : class
        {

            db.Set<T>().Attach(entity);
            db.Entry<T>(entity).State = EntityState.Deleted;
            return db.SaveChanges() > 0;
        }

        public bool DeleteById<T>(object id) where T : class
        {
            T entity = db.Set<T>().Find(id);
            db.Set<T>().Attach(entity);
            db.Entry<T>(entity).State = EntityState.Deleted;
            return db.SaveChanges() > 0;
        }
        /// <summary>
        /// 根据条件删除
        /// </summary>
        /// <param name="deleWhere">删除条件</param>
        /// <returns>返回受影响行数</returns>
        public bool DeleteByConditon<T>(Expression<Func<T, bool>> deleWhere) where T : class
        {

            List<T> entitys = db.Set<T>().Where(deleWhere).ToList();
            entitys.ForEach(m => db.Entry<T>(m).State = EntityState.Deleted);
            return db.SaveChanges() > 0;
        }

        /// <summary>
        /// 查找单个
        /// </summary>
        /// <param name="id">主键</param>
        /// <returns></returns>
        public T GetSingleById<T>(object id) where T : class
        {

            return db.Set<T>().Find(id);
        }

        /// <summary>
        /// 查找单个
        /// </summary>
        /// <param name="seleWhere">查询条件</param>
        /// <returns></returns>
        public T GetSingle<T>(Expression<Func<T, bool>> seleWhere) where T : class
        {

            var resultList = db.Set<T>().Where(seleWhere);
            if (!resultList.Any()) return null;
            if (resultList != null && resultList.Count() > 1)
            {
                throw new Exception("结果集内个数不只一个！");
            }
            return resultList.First();
        }
        /// <summary>
        /// 查找单个
        /// </summary>
        /// <param name="seleWhere">查询条件</param>
        /// <returns></returns>
        public T GetSingle<T>(Func<T, bool> seleWhere) where T : class
        {

            var resultList = db.Set<T>().Where(seleWhere);
            if (!resultList.Any()) return null;
            if (resultList != null && resultList.Count() > 1)
            {
                throw new Exception("结果集内个数不只一个！");
            }
            return resultList.First();
        }
        /// <summary>
        /// 获取所有实体集合
        /// </summary>
        /// <returns></returns>
        public List<T> GetAll<T>() where T : class
        {

            {
                return db.Set<T>().ToList<T>();
            }
        }

        /// <summary>
        /// 获取所有实体集合(单个排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetAll<T, Tkey>(Expression<Func<T, Tkey>> orderWhere, bool isDesc) where T : class
        {

            {
                return CommonSort(db.Set<T>(), orderWhere, isDesc).ToList<T>();
            }
        }

        /// <summary>
        /// 获取所有实体集合(多个排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetAll<T>(params OrderModelField[] orderByExpression) where T : class
        {

            {
                return CommonSort(db.Set<T>(), orderByExpression).ToList();
            }
        }

        /// <summary>
        /// 单个排序通用方法
        /// </summary>
        /// <typeparam name="Tkey">排序字段</typeparam>
        /// <param name="data">要排序的数据</param>
        /// <param name="orderWhere">排序条件</param>
        /// <param name="isDesc">是否倒序</param>
        /// <returns>排序后的集合</returns>
        public IQueryable<T> CommonSort<T, Tkey>(IQueryable<T> data, Expression<Func<T, Tkey>> orderWhere, bool isDesc) where T : class
        {
            if (isDesc)
            {
                return data.OrderByDescending(orderWhere);
            }
            else
            {
                return data.OrderBy(orderWhere);
            }
        }

        /// <summary>
        /// 多个排序通用方法
        /// </summary>
        /// <typeparam name="Tkey">排序字段</typeparam>
        /// <param name="data">要排序的数据</param>
        /// <param name="orderWhereAndIsDesc">字典集合(排序条件,是否倒序)</param>
        /// <returns>排序后的集合</returns>
        public IQueryable<T> CommonSort<T>(IQueryable<T> data, params OrderModelField[] orderByExpression) where T : class
        {
            //创建表达式变量参数
            var parameter = Expression.Parameter(typeof(T), "o");

            if (orderByExpression != null && orderByExpression.Length > 0)
            {
                for (int i = 0; i < orderByExpression.Length; i++)
                {
                    //根据属性名获取属性
                    var property = typeof(T).GetProperty(orderByExpression[i].PropertyName);
                    //创建一个访问属性的表达式
                    var propertyAccess = Expression.MakeMemberAccess(parameter, property);
                    var orderByExp = Expression.Lambda(propertyAccess, parameter);

                    string OrderName = "";
                    if (i > 0)
                    {
                        OrderName = orderByExpression[i].IsDESC ? "ThenByDescending" : "ThenBy";
                    }
                    else
                        OrderName = orderByExpression[i].IsDESC ? "OrderByDescending" : "OrderBy";

                    MethodCallExpression resultExp = Expression.Call(typeof(Queryable), OrderName, new Type[] { typeof(T), property.PropertyType },
                    data.Expression, Expression.Quote(orderByExp));

                    data = data.Provider.CreateQuery<T>(resultExp);
                }
            }
            return data;
        }

        /// <summary>
        /// 根据条件查询实体集合
        /// </summary>
        /// <param name="seleWhere">查询条件 lambel表达式</param>
        /// <returns></returns>
        public List<T> GetList<T>(Expression<Func<T, bool>> seleWhere) where T : class
        {

            {

                return db.Set<T>().AsQueryable().Where(seleWhere).ToList();
            }
        }

        /// <summary>
        /// 根据条件查询实体集合
        /// </summary>
        /// <param name="seleWhere">查询条件 lambel表达式</param>
        /// <returns></returns>
        public List<T> GetList<T, TValue>(Expression<Func<T, TValue>> seleWhere, IEnumerable<TValue> conditions) where T : class
        {

            {

                return db.Set<T>().WhereIn<T, TValue>(seleWhere, conditions).ToList();
            }
        }

        /// <summary>
        /// 根据条件查询实体集合(单个字段排序)
        /// </summary>
        /// <param name="seleWhere">查询条件 lambel表达式</param>
        /// <returns></returns>
        public List<T> GetList<T, Tkey>(Expression<Func<T, bool>> seleWhere, Expression<Func<T, Tkey>> orderWhere, bool isDesc) where T : class
        {

            {
                return CommonSort(db.Set<T>().Where(seleWhere), orderWhere, isDesc).ToList();
            }
        }

        /// <summary>
        /// 根据条件查询实体集合(多个字段排序)
        /// </summary>
        /// <param name="seleWhere">查询条件 lambel表达式</param>
        /// <returns></returns>
        public List<T> GetList<T>(Expression<Func<T, bool>> seleWhere, params OrderModelField[] orderByExpression) where T : class
        {

            {
                return CommonSort(db.Set<T>().Where(seleWhere), orderByExpression).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(无条件无排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T, Tkey>(int pageIndex, int pageSize, out int totalcount) where T : class
        {

            {
                totalcount = db.Set<T>().Count();//获取总数
                                                 //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return db.Set<T>().Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(无条件单个排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T, Tkey>(int pageIndex, int pageSize, Expression<Func<T, Tkey>> orderWhere, bool isDesc, out int totalcount) where T : class
        {

            {
                totalcount = db.Set<T>().Count();//获取总数
                                                 //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return CommonSort(db.Set<T>(), orderWhere, isDesc).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(无条件多字段排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T>(int pageIndex, int pageSize, out int totalcount, params OrderModelField[] orderByExpression) where T : class
        {

            {
                totalcount = db.Set<T>().Count();//获取总数
                                                 //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return CommonSort(db.Set<T>(), orderByExpression).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(有条件无排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T, Tkey>(int pageIndex, int pageSize, Expression<Func<T, bool>> seleWhere, out int totalcount) where T : class
        {

            {
                totalcount = db.Set<T>().Where(seleWhere).Count();//获取总数
                                                                  //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return db.Set<T>().Where(seleWhere).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(有条件单个排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T, Tkey>(int pageIndex, int pageSize, Expression<Func<T, bool>> seleWhere,
            Expression<Func<T, Tkey>> orderWhere, bool isDesc, out int totalcount) where T : class
        {

            {
                totalcount = db.Set<T>().Where(seleWhere).Count();//获取总数
                                                                  //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return CommonSort(db.Set<T>().Where(seleWhere), orderWhere, isDesc).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }

        /// <summary>
        /// 获取分页集合(有条件多字段排序)
        /// </summary>
        /// <returns></returns>
        public List<T> GetListPaged<T>(int pageIndex, int pageSize, Expression<Func<T, bool>> seleWhere,
            out int totalcount, params OrderModelField[] orderModelFiled) where T : class
        {

            {
                totalcount = db.Set<T>().Where(seleWhere).Count();//获取总数
                                                                  //需要增加AsExpandable(),否则查询的是所有数据到内存，然后再排序  AsExpandable是linqkit.dll中的方法
                return CommonSort(db.Set<T>().Where(seleWhere), orderModelFiled).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
            }
        }
        #endregion

  

        #endregion



    }
    public static class QueryableExtension
    {
        /// <summary>
        /// 扩展方法  支持 in 操作
        /// </summary>
        /// <typeparam name="TEntity">需要扩展的对象类型</typeparam>
        /// <typeparam name="TValue">in 的值类型</typeparam>
        /// <param name="source">需要扩展的对象</param>
        /// <param name="valueSelector">值选择器 例如c=>c.UserId</param>
        /// <param name="values">值集合</param>
        /// <returns></returns>
        public static IQueryable<TEntity> WhereIn<TEntity, TValue>(this IQueryable<TEntity> source, Expression<Func<TEntity, TValue>> valueSelector,
            IEnumerable<TValue> values)
        {
            if (null == valueSelector) { throw new ArgumentNullException("valueSelector"); }
            if (null == values) { throw new ArgumentNullException("values"); }
            ParameterExpression p = valueSelector.Parameters.Single();

            if (!values.Any())
            {
                return source;
            }
            var equals = values.Select(value => (Expression)Expression.Equal(valueSelector.Body, Expression.Constant(value, typeof(TValue))));
            var body = equals.Aggregate<Expression>((accumulate, equal) => Expression.Or(accumulate, equal));
            return source.Where(Expression.Lambda<Func<TEntity, bool>>(body, p));
        }
    }
    public struct OrderModelField
    {

        public bool IsDESC { get; set; }
        public string PropertyName { get; set; }
    }

    public class ParameterRebinder : ExpressionVisitor
    {
        private readonly Dictionary<ParameterExpression, ParameterExpression> map;
        public ParameterRebinder(Dictionary<ParameterExpression, ParameterExpression> map)
        {
            this.map = map ?? new Dictionary<ParameterExpression, ParameterExpression>();
        }
        public static Expression ReplaceParameters(Dictionary<ParameterExpression, ParameterExpression> map, Expression exp)
        {
            return new ParameterRebinder(map).Visit(exp);
        }
        protected override Expression VisitParameter(ParameterExpression p)
        {
            ParameterExpression replacement;
            if (map.TryGetValue(p, out replacement))
            {
                p = replacement;
            }
            return base.VisitParameter(p);
        }
    }

    public static class PredicateExtensions
    {
        public static Expression<Func<T, bool>> True<T>() { return f => true; }
        public static Expression<Func<T, bool>> False<T>() { return f => false; }
        public static Expression<T> Compose<T>(this Expression<T> first, Expression<T> second, Func<Expression, Expression, Expression> merge)
        {
            // build parameter map (from parameters of second to parameters of first)  
            var map = first.Parameters.Select((f, i) => new { f, s = second.Parameters[i] }).ToDictionary(p => p.s, p => p.f);

            // replace parameters in the second lambda expression with parameters from the first  
            var secondBody = ParameterRebinder.ReplaceParameters(map, second.Body);

            // apply composition of lambda expression bodies to parameters from the first expression   
            return Expression.Lambda<T>(merge(first.Body, secondBody), first.Parameters);
        }

        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second)
        {
            return first.Compose(second, Expression.And);
        }

        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> first, Expression<Func<T, bool>> second)
        {
            return first.Compose(second, Expression.Or);
        }
        /// 根据属性类型及属性值进行比较
        /// </summary>
        /// <param name="_type">属性类型</param>
        /// <param name="val1">待比较的值</param>
        /// <param name="val2">比较值</param>
        /// <returns></returns>
        public static bool PropIsEquals(Type _type, object val1, object val2)
        {
            if (val1 == null) return true;//如果属性值为空，则不进行比较，返回true

            if (val2 != null && val1 == null) return false;//如果比较值不为Null但是待比较的值为Null，则肯定不相等，返回false

            if (val2 == null && val1 != null) return true;

            //String
            if (_type == typeof(String))
            {
                if (val2.ToString() == String.Empty) return true;//视为空，不比较
                return val1.ToString().Contains(val2.ToString());//like查询，可改成Equals
            }
            else if (_type == typeof(Nullable<DateTime>))
            {
                return val1.ToString().Contains(val1.ToString());
            }

            //Int32
            if (_type == typeof(Int32))
            {
                if (Convert.ToInt32(val2) == 0) return true;//视为空，不比较
                return Convert.ToInt32(val1) == Convert.ToInt32(val2);
            }
            else if (_type == typeof(Nullable<Int32>))
            {
                return Convert.ToInt32(val1) == Convert.ToInt32(val2);
            }

            //DateTime
            if (_type == typeof(DateTime))
            {
                if (Convert.ToDateTime(val2) == DateTime.MinValue) return true;//视为空，不比较
                return Convert.ToDateTime(val1) == Convert.ToDateTime(val2);
            }
            else if (_type == typeof(Nullable<DateTime>))
            {
                return Convert.ToDateTime(val1) == Convert.ToDateTime(val2);
            }

            //Boolean
            if (_type == typeof(Boolean))
            {
                if (Convert.ToBoolean(val2) == false) return true;//视为空，不比较
                return Convert.ToBoolean(val1) == Convert.ToBoolean(val2);
            }
            else if (_type == typeof(Nullable<DateTime>))
            {
                return Convert.ToBoolean(val1) == Convert.ToBoolean(val2);
            }

            //Boolean
            if (_type == typeof(Guid))
            {
                if (Guid.Parse(val2.ToString()) == Guid.Empty) return true;//视为空，不比较
                return Guid.Parse(val1.ToString()) == Guid.Parse(val2.ToString());
            }
            else if (_type == typeof(Nullable<Guid>))
            {
                return Guid.Parse(val1.ToString()) == Guid.Parse(val2.ToString());
            }

            return true;
        }

        /// <summary>
        /// 根据传递的对象生成Func表达式，作为Linq的Where参数
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="obj"></param>
        public static Func<T, bool> GetFunc<T>(this T obj)
        {
            if (obj == null) return null;
            Func<T, bool> func = item =>
            {
                Type t = typeof(T);
                foreach (var prop in t.GetProperties())
                {
                    if (!PropIsEquals(prop.PropertyType, prop.GetValue(item), prop.GetValue(obj)))//此处判断item是否符合搜索条件
                    {
                        return false;
                    }
                }
                return true;
            };
            return func;

        }
    }
}
