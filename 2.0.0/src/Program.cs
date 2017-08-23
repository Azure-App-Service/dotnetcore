using System;
using Microsoft.AspNetCore.Hosting;

namespace hostingstart
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseStartup<Startup>()
                .UseWebRoot("/home/site/wwwroot")
                .Build();

            host.Run();
        }
    }
}
