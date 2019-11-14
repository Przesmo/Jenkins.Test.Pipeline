using Microsoft.AspNetCore.Mvc;

namespace Test.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {

        [HttpGet]
        public string Test()
        {
            return "Pass";
        }
    }
}