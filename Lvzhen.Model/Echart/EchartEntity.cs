using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace Lvzhen.Model.Echart
{
    public class EchartEntity
    {
        //yyyy-mm-dd
        public List<string> times = new List<string>();
        public List<decimal> lineData = new List<decimal>();
        public List< decimal[]> scatterData1 = new List<decimal[]>();
        public List<decimal[]> scatterData2 = new List<decimal[]>();
    }
}
