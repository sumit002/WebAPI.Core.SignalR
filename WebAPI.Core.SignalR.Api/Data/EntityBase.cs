using System;
using System.ComponentModel.DataAnnotations;

namespace WebAPI.Core.SignalR.Api.Data
{
    public class EntityBase<T>
    {
        [Key]
        public T Id { get; set; }
        public Guid CreatedById { get; set; }
        public DateTime CreatedOn { get; set; }
        public Guid ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
    }
}
