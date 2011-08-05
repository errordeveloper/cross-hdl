require 'icarus_flags.rb'

class Icarus
  include IcarusFlags

  def initialize

    ## for now put down everything:
    @dirs = {
    :bin=> "/usr/bin/",
    :lib=> "/usr/lib64/ivl/",
    :inc=> "/usr/include/iverilog",
    }
    ## can probably use RUBY_PLATFORM
    ## to check whether it's 64-bit

    @cmds = {
    :generic => ## or :preproc ??
      "#{@dirs[:bin]}iverilog",
    :vpicomp =>
      "#{@dirs[:bin]}iverilog-vpi",
    :execute =>
      "#{@dirs[:bin]}vvp"
    }

    @verilog = @cmds[:generic]

    @vflags_all = self.read_flags

    @default = [
      @warnings	[:all],
      @vstd	[:std2005],
      @vams	[:no],
    ]

  end

  def get_default
    return @default
  end

  def get_command
    return @verilog
  end

  ## If .set_command is needed
  ## then can use the '-B' flag

  def get_version
    version = `#{@verilog} -V`
    version = version.split("\n")[0]
    ## it should be similar to:
    ## "Icarus Verilog version 0.9.1 (v0_9_1)"
    version = version.split("\ ")[3]
    ## return version
  end

  def output_info
    puts "#{self.get_command} (#{self.get_version})"
  end

end

test=Icarus.new
test.output_info
puts "Default flags: #{test.get_default}"

## NOTE: (temp)
## if it's hash-in-hash, then
## verilog_flags[:vstd][:std1995]
## is the way to access it, but
## if it's array-of-hashes, then
## each hash can be accessed by
## it's name, i.e. vstd[:std2005]
