using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using WebAPI.Core.SignalR.Api.Data;

namespace WebAPI.Core.SignalR.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder => builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader()
                .AllowCredentials()
                .WithOrigins("http://localhost:4200"));
            });

            services.AddControllers();

            // AddSignalR Service
            services.AddSignalR();

            services.AddEntityFrameworkSqlServer().AddDbContextPool<NotificationDbContext>(options =>
                options.UseSqlServer(Configuration["ConnectionStrings:DefaultConnection"]));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
                app.UseDeveloperExceptionPage();

            // It is important to call the UseCors method before the UseAuthorization or UseEndpoints methods
            app.UseCors("CorsPolicy");

            //app.UseSignalR(routes =>
            //    {
            //        routes.MapHub<NotifyHub>("/notify");
            //    }
            //);

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
                // Register Hub for SignalR
                endpoints.MapHub<NotifyHub>("/notifyhub");
            });
        }
    }
}
