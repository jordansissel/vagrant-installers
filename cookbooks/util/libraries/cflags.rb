# Returns a hash of the proper CFLAGS/LDFLAGS for compiling
def cflags
  flags = {
    "LDFLAGS" => "-I#{embedded_dir}/include -L#{embedded_dir}/lib",
    "CLFAGS"  => "-I#{embedded_dir}/include -L#{embedded_dir}/lib"
  }

  if platform?("windows")
    # Paths must be Windows-ified
    flags.each do |key, value|
      flags[key] = value.gsub("/", "\\")
    end
  elsif platform?("mac_os_x")
    # Actually not quite sure if I need this... yet
    flags["LDFLAGS"] += " -R#{embedded_dir}/lib"
  end

  return flags
end
