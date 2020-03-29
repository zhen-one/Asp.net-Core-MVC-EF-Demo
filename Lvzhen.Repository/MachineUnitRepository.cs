using Lvzhen.Model.Models;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Linq;

namespace Lvzhen.Repository
{
    public class MachineUnitRepository : Repository<MachineUnit>, IRepository<MachineUnit>, IMachineUnitRepository
    {
        public IList<MachineUnit> GetMachineUnit()
        {
            Expression<Func<MachineUnit, bool>> condition = n => !"Y".Equals(n.DeleteFlag) && !"N".Equals(n.EnableFlag);
            return base.GetByWhere(condition);
        }
    }
}
