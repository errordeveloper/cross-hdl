require 'icarus_flags.rb'

class Icarus
  include IcarusFlags

  def initialize(path_prefix = "/usr",
		 name_prefix = "",
		 name_suffix = "")

    ## I cannot see any rational way
    ## to try setting anything other
    ## then @prefix, if a user really
    ## wants to use a funky layaout -
    ## there is very little chance
    ## for such mess to work :)

    @prefix = path_prefix

    ## for now put down everything:
    @dirs = {
    :bin=> "#{@prefix}/bin/",
    :lib=> "#{@prefix}/lib64/ivl/",
    :inc=> "#{@prefix}/include/iverilog",
    }
    ## can probably use RUBY_PLATFORM
    ## to check whether it's 64-bit..

    ## perhaps this can be a class or
    ## a module, but leave it here for
    ## now and see what it shall be!
    @cmds = {
    :generic => ## or :preproc ??
      "iverilog",
    :vpicomp =>
      "iverilog-vpi",
    :execute =>
      "vvp",
    }
    ## following may become a method
    ## '.cmds_set_full_name'..
    @cmds.each_pair do |k,v|
      @cmds[k] = "#{@dirs[:bin]}#{name_prefix}#{v}#{name_suffix}"
    end

    @verilog = @cmds[:generic]

    @vflags_all = self.read_flags

    ## it may be a good idea to
    ## move thse into IcarusFlags
    @default = [
      @warnings	[:all],
      @vstd	[:std2005],
      @vams	[:no],
    ]


  def get_default
    return @default
  end

  def get_command
    return @verilog
  end

  ## If .set_command is needed
  ## then can use the '-B' flag

  end
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
