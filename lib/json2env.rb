require 'json'

class JSON2Env
  attr_accessor :env, :dir

  class TargetHasSubdirs < Exception ; end 
  class TargetNotADirectory < Exception ; end 

  def initialize(json, dir)
    @env = JSON.load(json)
    @dir = dir
  end

  def create
    if File.exists?(dir)
      raise TargetNotADirectory unless File.directory?(dir)
      clean_dir
    end
    Dir.mkdir(dir)
    @env.each do |key, value| 
      File.open("#{dir}/#{key}", "w") do |file|
        file.write(value.to_s.gsub(/\r\n|\r|\n/, "\0"))
      end
    end
  end

  def clean_dir
    raise TargetHasSubdirs if files.detect { |f| File.directory?(f) }
    files.each { |f| File.delete(f) }
    Dir.delete(@dir);
  end

  def files
    Dir.glob("#{@dir}/*")
  end
end

