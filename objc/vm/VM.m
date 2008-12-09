// VM.m
//                           wookay.noh at gmail.com

#import "VM.h"
#import <mach/mach_host.h>
#import <sys/sysctl.h>

@implementation VM

@synthesize wired;
@synthesize active;
@synthesize inactive;
@synthesize free;

+ (VM*) vm {
  int mib[6] = { CTL_HW, HW_PAGESIZE };
  int pagesize;
  size_t length = sizeof(pagesize);
  sysctl(mib, 2, &pagesize, &length, NULL, 0);

  vm_statistics_data_t vmstat;
  mach_msg_type_number_t count;
  host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmstat, &count);

  VM* vm = [[VM alloc] init];
  vm.wired = vmstat.wire_count * pagesize;
  vm.active = vmstat.active_count * pagesize;
  vm.inactive = vmstat.inactive_count * pagesize;
  vm.free = vmstat.free_count * pagesize;
  return vm;
}

- (double) total {
  return self.wired + self.active + self.inactive + self.free;
}

@end
