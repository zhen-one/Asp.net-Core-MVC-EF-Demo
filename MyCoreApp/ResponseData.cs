using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MyCoreApp
{
    public class ResponseData
    {
        public enum ResponseCode
        {
            Success=1,
            failed=0
        }

        public object Data { get; set; }
        public string Msg { get; set; }
        public ResponseCode Code  { get; set; }
    }
}
