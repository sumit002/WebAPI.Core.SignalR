using System;
using System.ComponentModel.DataAnnotations;

namespace WebAPI.Core.SignalR.Api.Data
{
    public class Notification : EntityBase<Guid>
    {
        public Guid MessageTypeId { get; set; }
        public Guid SenderId { get; set; }
        public Guid UserId { get; set; }
        [MaxLength(1000)]
        public string Subject { get; set; }
        public string Body { get; set; }
        public bool IsRead { get; set; }
        public bool IsTrash { get; set; }
        public DateTime DateReceivedOn { get; set; }
        public DateTime? DateReadOn { get; set; }
        public DateTime DateTimeSentOn { get; set; }
        public bool IsMarkedImportant { get; set; }

        public void SetAuditFields(Guid userId, Guid? id)
        {
            Id = id ?? Guid.NewGuid();
            CreatedById = userId;
            ModifiedById = userId;
            CreatedOn = DateTime.UtcNow;
            ModifiedOn = DateTime.UtcNow;

            IsRead = false;
            IsTrash = false;
            DateReceivedOn = DateTime.UtcNow;
            DateTimeSentOn = DateTime.UtcNow;
        }
    }
}
