using Lvzhen.Model;
using System.Collections.Generic;
using System.Linq;

namespace Lvzhen.Repository
{
    public interface IRepository<TEntity>
    {
        bool Delete(TEntity entity);
        bool DeleteByEntityId(object primaryKey);
        bool Exists(object primaryKey);
        TEntity Get(object primaryKey);
        IEnumerable<TEntity> GetAll();
        IEnumerable<TEntity> GetAll(string orderBy);
        bool Insert(TEntity entity);
        IEnumerable<TEntity> PopulateEntitiesByEntityIds<TEntity>(IEnumerable<TEntity> entityIds);
        bool Update(TEntity entity);
    }
}
