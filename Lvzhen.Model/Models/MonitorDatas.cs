using System;
using System.Collections.Generic;

namespace Lvzhen.Model.Models
{
    public partial class MonitorDatas
    {
        public int Id { get; set; }
        public int? MachineUnitId { get; set; }
        public string MachineUnitName { get; set; }
        public int? PositionId { get; set; }
        public string Position { get; set; }
        public decimal? Value1 { get; set; }
        public decimal? Value2 { get; set; }
        public decimal? Value3 { get; set; }
        public decimal? Value4 { get; set; }
        public decimal? Value5 { get; set; }
        public DateTime? CreateTime { get; set; }
    }
}
