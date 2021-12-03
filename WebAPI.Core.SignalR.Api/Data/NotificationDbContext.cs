using Microsoft.EntityFrameworkCore;

namespace WebAPI.Core.SignalR.Api.Data
{
    public class NotificationDbContext : DbContext
    {
        public NotificationDbContext(DbContextOptions<NotificationDbContext> options) : base(options)
        {}

        public DbSet<Notification> Notification { get; set; }
        public DbSet<MessageTypes> MessageTypes { get; set; }
    }
}
