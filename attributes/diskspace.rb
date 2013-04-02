 default[:diamond][:collectors][:DiskSpaceCollector][:filesystems] = 'ext2,ext3,xfs'
 default[:diamond][:collectors][:DiskSpaceCollector][:exclude_filters] = "'^/export/home'"
 default[:diamond][:collectors][:DiskSpaceCollector][:byte_unit] = "megabyte"
