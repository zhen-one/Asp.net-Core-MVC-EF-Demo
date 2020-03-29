using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using lvzhen.Service;
using Lvzhen.DAL;
using Lvzhen.Model.Models;
using Lvzhen.Repository;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using MyCoreApp.Models;

namespace MyCoreApp
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        //public void ConfigureServices(IServiceCollection services)
        //{
        //    services.Configure<CookiePolicyOptions>(options =>
        //    {
        //        // This lambda determines whether user consent for non-essential cookies is needed for a given request.
        //        options.CheckConsentNeeded = context => true;
        //        options.MinimumSameSitePolicy = SameSiteMode.None;
        //    });
        //    services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
        //}
        public void ConfigureServices(IServiceCollection services)
        {
            var sqlConnection = Configuration.GetConnectionString("SqlServerConnection");
            services.AddDbContext<testDbContext>(option => option.UseSqlServer(sqlConnection));
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped(typeof(IMonitorDataRepository), typeof(MonitorDataRepository));
            services.AddScoped(typeof(IMachineUnitRepository), typeof(MachineUnitRepository));
            services.AddTransient<IMonitorDataService, MonitorDataService>();


            services.AddMvc().AddJsonOptions(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            });
        }



        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=MonitorData}/{action=Index}/{id?}");
            });
        }
    }
}
