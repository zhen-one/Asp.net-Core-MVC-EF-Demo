using System;
using System.Collections.Generic;

namespace Lvzhen.Model.Models
{
    public partial class MachineUnit
    {
        public int Id { get; set; }
        public string MachineUnitNo { get; set; }
        public string MachineUnitName { get; set; }
        public string EnableFlag { get; set; }
        public string DeleteFlag { get; set; }
        public DateTime? CreateTime { get; set; }
    }
}
