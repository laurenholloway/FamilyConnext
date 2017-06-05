using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FamilyConnext.Startup))]
namespace FamilyConnext
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
