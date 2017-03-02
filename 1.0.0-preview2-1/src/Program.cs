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
                .UseUrls("http://*:80")
                .UseStartup<Startup>()
                .UseWebRoot("/defaulthome/hostingstart/static")
                .Build();

            host.Run();
        }
    }
}
