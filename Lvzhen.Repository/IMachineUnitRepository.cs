using Lvzhen.Model.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Lvzhen.Repository
{
    public interface IMachineUnitRepository : IRepository<MachineUnit>
    {

        IList<MachineUnit> GetMachineUnit();


    }
}
