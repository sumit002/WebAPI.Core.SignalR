using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;
using WebAPI.Core.SignalR.Api.Interfaces;
using WebAPI.Core.SignalR.Api.Models;

namespace WebAPI.Core.SignalR.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessageController : ControllerBase
    {
        private readonly ILogger<MessageController> _logger;
        private IHubContext<NotifyHub> _hubContext;
        public MessageController(ILogger<MessageController> logger, IHubContext<NotifyHub> hubContext)
        {
            _logger = logger;
            _hubContext = hubContext;
        }

        [HttpGet]
        public string Get(CancellationToken cancellationToken)
        {
            _logger.LogInformation("Message Get Called.");
            string status = string.Empty;
            try
            {
                var msg = new Message()
                {
                    Type = MessageType.Info,
                    Information = $"Welcome message: {Guid.NewGuid()}",
                    CreatedOn = DateTime.UtcNow
                };

                //_hubContext.Clients.All.SendMessage(msg, cancellationToken);
                _hubContext.Clients.All.SendAsync("BroadcastMessage");
                status = "Success";
            }
            catch (Exception ex)
            {
                throw;
            }

            return status;
        }

        // GET: api/Message/messagecount  
        [Route("messagecount")]
        [HttpGet]
        public async Task<ActionResult<NotificationCountResult>> GetMessageCount(CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                NotificationCountResult result = new NotificationCountResult
                {
                    Count = new Random().Next(10, 100)
                };

                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception in GetMessageCount!");
                throw;
            }
        }
    }
}
