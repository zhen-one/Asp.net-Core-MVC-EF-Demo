using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using lvzhen.Service;
using Lvzhen.Model;
using Lvzhen.Model.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using MyCoreApp.Dto;
using MyCoreApp.Models;
using System.Linq;
using System.Collections;
using Lvzhen.Model.Models;
using Lvzhen.Model.Echart;

namespace MyCoreApp.Controllers
{

    public class MonitorDataController : Controller
    {


        IMonitorDataService monitorDataService;
        public MonitorDataController(IMonitorDataService monitorDataService)
        {
            this.monitorDataService = monitorDataService;
        }
        public IList<MachineUnit> InitComboxData()
        {
            return monitorDataService. GetMachineUnit();
        }
        public IActionResult Index()
        {
            var comboxData = InitComboxData();
            var selectList = comboxData.Select(unit=> new SelectListItem
            {
                Text = unit.MachineUnitName,
                Value = unit.MachineUnitName
            });
            return View("MonitorData", selectList);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [HttpPost]
        public IActionResult GetMonitorData(MonitorDataQuery monitorDataDto)
        {
            Dictionary<string, EchartEntity> result = monitorDataService.GetChartEntity(monitorDataDto, monitorDataDto.create_time_begin, monitorDataDto.create_time_end);
            if (result == null || !result.Any())
            {
                return Json(new ResponseData()
                {
                    Code = ResponseData.ResponseCode.failed,
                    Msg = "暂无数据",
                    Data = null
                });
            }
            ResponseData responseData = new ResponseData()
            {
                Code = ResponseData.ResponseCode.Success,
                Msg = "请求成功",
                Data = result
            };
            return Json(responseData);
        }


        #region private methods

        #endregion
    }
}