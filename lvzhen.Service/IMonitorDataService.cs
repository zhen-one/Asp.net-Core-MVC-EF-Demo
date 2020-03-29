using Lvzhen.Model;
using Lvzhen.Model.Dto;
using Lvzhen.Model.Echart;
using Lvzhen.Model.Models;
using System;
using System.Collections.Generic;

namespace lvzhen.Service
{
    public interface IMonitorDataService
    {

        IList<MonitorDatas> GetDatasByCondition(MonitorDataQuery condition);
        IList<MachineUnit> GetMachineUnit() ;
        Dictionary<string, EchartEntity> GetChartEntity(MonitorDataQuery condition, DateTime start, DateTime end);
    }
}
