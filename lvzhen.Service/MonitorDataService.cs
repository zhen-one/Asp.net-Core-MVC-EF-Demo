using System;
using System.Collections.Generic;
using System.Text;
using Lvzhen.Model;
using Lvzhen.Model.Dto;
using Lvzhen.Model.Echart;
using Lvzhen.Model.Models;
using Lvzhen.Repository;

namespace lvzhen.Service
{
    public class MonitorDataService : IMonitorDataService
    {
        private IMonitorDataRepository monitorDataRepository;
        private IMachineUnitRepository machineUnitRepository;

        public MonitorDataService(IMonitorDataRepository monitorDataRepository
            , IMachineUnitRepository machineUnitRepository)
        {
            this.monitorDataRepository = monitorDataRepository;
            this.machineUnitRepository = machineUnitRepository;
        }
       
        public IList<MonitorDatas> GetDatasByCondition(MonitorDataQuery condition)
        {
            return monitorDataRepository.GetDatasByCondition(condition);
        }
        public Dictionary<string, EchartEntity> GetChartEntity(MonitorDataQuery condition, DateTime start, DateTime end)
        {
            IList<MonitorDatas> monitorDatas= GetDatasByCondition(condition);
           return monitorDataRepository.GetChartEntity(monitorDatas, condition.create_time_begin, condition.create_time_end);
        }

        public IList<MachineUnit> GetMachineUnit()
        {
            return machineUnitRepository.GetMachineUnit();
        }
    }
}
