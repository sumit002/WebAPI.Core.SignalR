using System;

namespace WebAPI.Core.SignalR.Api.Models
{
    public class Message
    {
        public MessageType Type { get; set; }
        public string Information { get; set; }
        public DateTime CreatedOn { get; set; }
    }

    public enum MessageType { 
        Info,
        Warning,
        Error
    }
}
