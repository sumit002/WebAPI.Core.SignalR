using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using WebAPI.Core.SignalR.Api.Data;
using WebAPI.Core.SignalR.Api.Interfaces;
using WebAPI.Core.SignalR.Api.Models;

namespace WebAPI.Core.SignalR.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotificationController : ControllerBase
    {
        private readonly ILogger<NotificationController> _logger;
        private IHubContext<NotifyHub> _hubContext;
        private readonly NotificationDbContext _dbContext;
        public NotificationController(ILogger<NotificationController> logger, IHubContext<NotifyHub> hubContext,
          NotificationDbContext dbContext)
        {
            _logger = logger;
            _hubContext = hubContext;
            _dbContext = dbContext;
        }

        // GET: api/Notification
        /*
         * http://localhost:50500/api/Notification
         {
            "MessageTypeId": "14B47F02-8E34-4B60-8430-C1C902566A83",
            "SenderId": "2BE97FE4-CE53-4457-8536-0DD12ED49371",
            "UserId": "970D514F-AA74-4A1F-BA72-EEA9A874119C",
            "Subject": "User registered.",
            "Body": "",
            "IsMarkedImportant": false
        }
         */
        [HttpPost]
        public async Task Create(Notification notification, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                notification.SetAuditFields(Guid.Parse(Constants.Constant.AdminUser), null);

                _dbContext.Notification.Add(notification);
                await _dbContext.SaveChangesAsync();

                // SignalR BroadcastMessage
                //await _hubContext.Clients.All.BroadcastMessage(notifications, cancellationToken);
                await _hubContext.Clients.All.SendAsync("BroadcastNotification", notification, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception in Create Notifications!");
                throw;
            }
        }

        // GET: api/Notification/notificationcount  
        [Route("notificationcount")]
        [HttpGet]
        public async Task<ActionResult<NotificationCountResult>> GetNotificationCount(CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();
            
            try
            {
                var notifications = await _dbContext.Notification.ToListAsync(cancellationToken);
                NotificationCountResult result = new NotificationCountResult
                {
                    Count = notifications.Count
                };

                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception in GetNotificationCount!");
                throw;
            }
        }

        // GET: api/Notification/NotificationResult
        [Route("NotificationResult")]
        [HttpGet]
        public async Task<ActionResult<List<Notification>>> NotificationResults(CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var results = await _dbContext.Notification.ToListAsync(cancellationToken);
                //results.Add(new NotificationResult() { EmployeeName = "EmployeeName1", TranType = "TranType1" });
                //results.Add(new NotificationResult() { EmployeeName = "EmployeeName2", TranType = "TranType2" });
                //results.Add(new NotificationResult() { EmployeeName = "EmployeeName3", TranType = "TranType1" });
                //results.Add(new NotificationResult() { EmployeeName = "EmployeeName4", TranType = "TranType2" });
                return results;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception in GetNotificationMessage!");
                throw;
            }
        }

        // DELETE: api/Notification/DeleteNotifications  
        [HttpDelete]
        [Route("DeleteNotifications")]
        public async Task<IActionResult> DeleteNotifications(Guid notificationId, CancellationToken cancellationToken)
        {
            //await _context.Database.ExecuteSqlRawAsync("TRUNCATE TABLE Notification");
            //await _context.SaveChangesAsync();

            cancellationToken.ThrowIfCancellationRequested();

            try
            {
                var notification = _dbContext.Notification.FirstOrDefault(n=> n.Id == notificationId);

                _dbContext.Remove(notification);

                // SignalR BroadcastMessage
                //await _hubContext.Clients.All.BroadcastMessage(notification, cancellationToken);
                await _hubContext.Clients.All.SendAsync("BroadcastNotification", notification, cancellationToken);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Exception in Create Notifications!");
                throw;
            }

            //var msg = new Message() { Information = "asdasd" };
            //await _hubContext.Clients.All.SendNotification(msg, cancellationToken);
            return NoContent();
        }
    }
}
