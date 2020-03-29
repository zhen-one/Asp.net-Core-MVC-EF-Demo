using System;
using System.Collections.Generic;

namespace Lvzhen.Model.Models
{
    public partial class MachinePosition
    {
        public int Id { get; set; }
        public string MachinePositionNo { get; set; }
        public string MachinePositionName { get; set; }
        public string DeleteFlag { get; set; }
        public string EnableFlag { get; set; }
        public DateTime? CreateTime { get; set; }
    }
}
