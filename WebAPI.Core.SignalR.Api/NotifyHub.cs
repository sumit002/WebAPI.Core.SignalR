using Microsoft.AspNetCore.SignalR;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebAPI.Core.SignalR.Api.Data;
using WebAPI.Core.SignalR.Api.Interfaces;

namespace WebAPI.Core.SignalR.Api
{
    /// <summary>
    /// Hub for the SignalR
    /// </summary>
    public class NotifyHub : Hub
    {
        //public NotifyHub()
        //{ }

        //public async Task NewMessage(string msg)
        //{
        //    await Clients.All.SendAsync("MessageReceived", msg);
        //}

        //public async Task SendMessage(string user, string message)
        //{
        //    await Clients.All.SendAsync("ReceiveMessage", user, message);
        //}

        public async Task SendNotification(List<Notification> notifications)
        {
            await Clients.All.SendAsync("BroadcastNotification", notifications);
        }

        public async Task GetNotificationIndicatorCount(string msg)
        {
            await Clients.All.SendAsync("BroadcastNotificationUnreadCount", 12);
        }
    }
}
