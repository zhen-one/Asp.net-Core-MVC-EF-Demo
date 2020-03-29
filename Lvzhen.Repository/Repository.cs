using Lvzhen.DAL;
using Lvzhen.Model;
using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Lvzhen.Repository
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : class
    {
        protected BaseDAL baseDAL = new BaseDAL();
        public bool Delete(TEntity entity)
        {
            return baseDAL.Delete<TEntity>(entity);
        }

        public bool DeleteByEntityId(object primaryKey)
        {
            return baseDAL.DeleteById<TEntity>(primaryKey);
        }

        public bool Exists(object primaryKey)
        {
            return baseDAL.GetSingleById<TEntity>(primaryKey) != null;
        }

        public TEntity Get(object primaryKey)
        {
            return baseDAL.GetSingleById<TEntity>(primaryKey);
        }

        public TEntity GetByWhere(TEntity t)
        {
            var Conditions = t.GetFunc<TEntity>();

            return baseDAL.GetSingle<TEntity>(Conditions);
        }
        public IList<TEntity> GetByWhere(Expression<Func<TEntity, bool>> seleWhere )
        {

            return baseDAL.GetList<TEntity>(seleWhere);
        }
        public IEnumerable<TEntity> GetAll()
        {
            return baseDAL.GetAll<TEntity>();
        }

        public IEnumerable<TEntity> GetAll(string orderBy)
        {
            throw new NotImplementedException();
        }

        public bool Insert(TEntity entity)
        {
            return baseDAL.Add<TEntity>(entity);
        }

        public IEnumerable<TEntity> PopulateEntitiesByEntityIds<TEntity>(IEnumerable<TEntity> entityIds)
        {
            throw new NotImplementedException();
        }

        public bool Update(TEntity entity)
        {
            return baseDAL.Update<TEntity>(entity);
        }


    }
}
