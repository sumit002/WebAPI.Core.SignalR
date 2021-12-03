using System;

namespace WebAPI.Core.SignalR.Api.Data
{
    public class MessageTypes : EntityBase<Guid>
    {
        public string Name { get; set; }
    }
}
