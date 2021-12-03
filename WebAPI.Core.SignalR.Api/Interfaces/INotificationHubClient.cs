using System.Threading;
using System.Threading.Tasks;
using WebAPI.Core.SignalR.Api.Data;
//using WebAPI.Core.SignalR.Api.Data;
//using WebAPI.Core.SignalR.Api.Models;

namespace WebAPI.Core.SignalR.Api.Interfaces
{
    public interface INotificationHubClient
    {
        //Task SendMessage(Message message, CancellationToken cancellationToken);
        Task BroadcastMessage(Notification notifications, CancellationToken cancellationToken);
        //Task<int> NotificationIndicatorCount();

        //Task<Message> ReceiveMessage(Message message, CancellationToken cancellationToken);
        //Task<int> GetUnreadNotificationCount(string username, CancellationToken cancellationToken);
    }
}
