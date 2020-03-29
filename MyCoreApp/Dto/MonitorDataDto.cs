using Lvzhen.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyCoreApp.Dto
{
    public class MonitorDataDto
    {

        public class EchartData
        {
            public List<string> xAxis { get; set; }
            public List<double> yAxis { get; set; }
        }
        public List<Tuple<string, string>> ScatterPoints;
        public List<Tuple<string, string>> Trend;
    }
}
