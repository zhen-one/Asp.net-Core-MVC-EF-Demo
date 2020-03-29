using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Lvzhen.Model.Models
{
    public partial class testDbContext : DbContext
    {
        public testDbContext()
        {
        }

        public testDbContext(DbContextOptions<testDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<MachinePosition> MachinePosition { get; set; }
        public virtual DbSet<MachineUnit> MachineUnit { get; set; }
        public virtual DbSet<MonitorDatas> MonitorDatas { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=192.168.43.118;Database=testDb;uid=sa;pwd=123");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MachinePosition>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnName("create_time")
                    .HasColumnType("datetime");

                entity.Property(e => e.DeleteFlag)
                    .HasColumnName("delete_flag")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.EnableFlag)
                    .HasColumnName("enable_flag")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.MachinePositionName)
                    .HasColumnName("machinePosition_Name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MachinePositionNo)
                    .HasColumnName("machinePosition_No")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MachineUnit>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreateTime)
                    .HasColumnName("create_time")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.DeleteFlag)
                    .HasColumnName("delete_flag")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.EnableFlag)
                    .HasColumnName("enable_flag")
                    .HasMaxLength(1)
                    .IsUnicode(false);

                entity.Property(e => e.MachineUnitName)
                    .HasColumnName("machineUnit_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MachineUnitNo)
                    .HasColumnName("machineUnit_No")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MonitorDatas>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreateTime)
                    .HasColumnName("create_time")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.MachineUnitId).HasColumnName("machineUnit_id");

                entity.Property(e => e.MachineUnitName)
                    .HasColumnName("machineUnit_Name")
                    .HasMaxLength(100);

                entity.Property(e => e.Position)
                    .HasColumnName("position")
                    .HasMaxLength(50);

                entity.Property(e => e.PositionId).HasColumnName("position_id");

                entity.Property(e => e.Value1).HasColumnName("value1");

                entity.Property(e => e.Value2).HasColumnName("value2");

                entity.Property(e => e.Value3).HasColumnName("value3");

                entity.Property(e => e.Value4).HasColumnName("value4");

                entity.Property(e => e.Value5).HasColumnName("value5");
            });
        }
    }
}
