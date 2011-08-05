## These option had been taken
## from Icarus Verilog 0.9.1

## NOTE: (temp)
## This may become YAML code
## but for now let's define
## the hash structure.

module IcarusFlags
  def read_flags
  return [

  @vstd = {
  :std1995 => "-g1995",
  :std2001 => "-g2001",
  :std2005 => "-g2005",
  },

  @vams = {
  :yes => "-gverilog-ams",
  :no  => "-gno-verilog-ams"
  },

  @include_std = {
  :yes => "-gstd-include",
  :no  => "-gno-std-include"
  },

  @include_rel = {
  :yes => "-grelative-include",
  :yes => "-gno-relative-include"
  },

  @extended_types = {
  :yes => "-gxtypes",
  :no  => "-gno-xtypes"
  },

  @specify_blocks = {
  :yes => "-gspecify",
  :no  => "-gno-specify"
  },

  @io_range_error = {
    :yes => "-gio-range-error",
    :no  => "-gno-io-range-error"
  },

  @strict_ca_eval = {
    :yes => "-gstrict-ca-eval",
    :no  => "-gno-strict-ca-eval"
  },

  ## let's keep it this way,
  ## though one can use 'no-',
  ## i.e. '-Wno-implicit'
  @warnings = {
    :all => "-Wall",
    :implicit   => "-Wimplicit",
    :portbind   => "-Wportbind",
    :timescale  => "-Wtimescale",
    :infloop    => "-Winfloop",
  },

  ## TODO: targets

  ]
  end

end
