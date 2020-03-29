using Lvzhen.Model;
using Lvzhen.Model.Dto;
using Lvzhen.Model.Echart;
using Lvzhen.Model.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace Lvzhen.Repository
{
    public interface IMonitorDataRepository : IRepository<MonitorDatas>
    {
        IList<MonitorDatas> GetDatasByCondition(MonitorDataQuery condition);
        IList<string> GetMachineUnit();
        Dictionary<string, EchartEntity> GetChartEntity(IList<MonitorDatas> sourceData, DateTime start, DateTime end);

    }
}
