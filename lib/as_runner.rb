class AsRunner
  def initialize(script, args=nil)
    puts '='*80
    puts script, args
    @script = script
    @args = *args
  end

  def run
    puts '-'*80
    puts @args
    puts "/usr/bin/osascript \"#@script\" \"#{@args.join ' '}\""
    %x{/usr/bin/osascript "#@script" #{as_arguments}}
  end

private

  def as_arguments
    unless @args.blank?
      @args.map{|arg| %Q("#{arg}")}.join ' '
    end
  end
end
