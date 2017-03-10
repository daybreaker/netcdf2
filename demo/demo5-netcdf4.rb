require "numru/netcdf"
include NumRu

file3 = NetCDF.create("test_nc3.nc")

NetCDF.creation_format = ( NetCDF::NC_NETCDF4 | NetCDF::NC_CLASSIC_MODEL )
file4 = NetCDF.create("test_nc4.nc")

nx, ny = 100, 50

[ file3, file4 ].each do |file|
  xdim = file.def_dim("x",nx)
  ydim = file.def_dim("y",ny)
  x = file.def_var("x","sfloat",[xdim])
  y = file.def_var("y","sfloat",[ydim])

  v1 = file.def_var("v1","sfloat",[xdim,ydim])
  v2 = file.def_var("v2","int",[xdim,ydim])

  if /nc4/ =~ file.path
    v1.deflate(2)       # set the deflation (compression) level 2
    v2.deflate(2,true)  # set the deflation level 2 with the shuffle filter

    puts "v1 deflate params:"
    p v1.deflate_params
    puts "v2 deflate params:"
    p v2.deflate_params
  end

  file.enddef

  x.put( NArray.float(nx).indgen! )
  y.put( NArray.float(ny).indgen! )

  z = NArray.float(nx,ny).indgen! + 1000000
  z[true,ny/2..-1] = 0  # to see the impac
  
  v1.put(z)
  v2.put(z)
  file.close
end

puts "Created test_nc3.nc test_nc4.nc.", "File size comparison:"
print `ls -l test_nc3.nc test_nc4.nc`
