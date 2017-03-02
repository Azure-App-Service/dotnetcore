using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.FileProviders;

namespace hostingstart
{
    public class Startup
    {
        public void Configure(IApplicationBuilder app)
        {
              DefaultFilesOptions options = new DefaultFilesOptions();
              
              options.DefaultFileNames.Clear();
              options.DefaultFileNames.Add("hostingstart.html");
              
              app.UseDefaultFiles(options);
              app.UseStaticFiles();
        }
    }
}
