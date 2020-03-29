using Lvzhen.DAL;
using Lvzhen.Model;
using Lvzhen.Model.Dto;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Linq;
using Lvzhen.Model.Models;
using Lvzhen.Model.Echart;
using System.Collections;

namespace Lvzhen.Repository
{
    public class MonitorDataRepository : Repository<MonitorDatas>, IRepository<MonitorDatas>, IMonitorDataRepository
    {

        public MonitorDataRepository()
        {

        }

        public IList<MonitorDatas> GetDatasByCondition(MonitorDataQuery condition)
        {
            Expression<Func<MonitorDatas, bool>> seleWhere = n => n.MachineUnitName == condition.machineUnit_Name && n.CreateTime >= condition.create_time_begin && n.CreateTime <= condition.create_time_end;

            return baseDAL.GetList(seleWhere);
        }

        public IList<string> GetMachineUnit()
        {
            return baseDAL.GetAll<MonitorDatas>().Select(
                (n) => n.MachineUnitName
                ).Distinct().ToList();
        }
        public Dictionary<string, EchartEntity> GetChartEntity(IList<MonitorDatas> sourceData, DateTime start, DateTime end)
        {
            Dictionary<string, EchartEntity> dict = new Dictionary<string, EchartEntity>();
            EchartEntity entity1 = new EchartEntity();
            EchartEntity entity2 = new EchartEntity();
            entity1.times.Add(start.ToShortDateString());
            entity1.lineData.Add(0);
            entity1.scatterData1.Add(new decimal[2] { 0, 0 });
            entity1.scatterData2.Add(new decimal[3] { 0, 0, 0 });
            entity2.times.Add(start.ToShortDateString());
            entity2.lineData.Add(0);
            entity2.scatterData1.Add(new decimal[2] { 0, 0 });
            entity2.scatterData2.Add(new decimal[3] { 0, 0, 0 });
            dict.Add("机舱", entity1);
            dict.Add("塔基", entity2);
            foreach (MonitorDatas data in sourceData)
            {
                var entity = new EchartEntity();
                if (dict.ContainsKey(data.Position)) entity = dict[data.Position];
                else dict[data.Position] = entity;
                entity.times.Add(data.CreateTime.Value.ToShortDateString());
                entity.lineData.Add(data.Value1.Value);
       
                    entity.scatterData1.Add(new decimal[2] { data.Value2.Value, data.Value3.Value});
                    entity.scatterData2.Add(new decimal[3] { data.Value2.Value, data.Value3.Value, data.Value4.Value });

            }
            foreach (EchartEntity item in dict.Values)
            {
                item.times.Add(end.ToShortDateString());
                item.lineData.Add(0);
                item.scatterData1.Add(new decimal[2] { 0, 0 });
                item.scatterData2.Add(new decimal[3] { 0,0,0});
            }
            return dict;
        }
    }
}
