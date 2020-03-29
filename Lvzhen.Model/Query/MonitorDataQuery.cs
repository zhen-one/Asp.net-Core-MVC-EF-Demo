using System;
using System.Collections.Generic;
using System.Text;

namespace Lvzhen.Model.Dto
{
    public class MonitorDataQuery
    {
        public int machineUnit_id { get; set; }
        public string machineUnit_Name { get; set; }
        public DateTime create_time_begin { get; set; }
        public DateTime create_time_end { get; set; }
    }
}
