class EnvFile
  def initialize location=".env"
    raise "Error: .env file not found" unless File.exists? location
    @contents = File.read(location).split "\n"
  end

  def exports
    @contents.select { |line| line =~ /\Aexport\s/ }
             .map { |line| line.gsub(/\Aexport\s/, '').split '=' }
             .reduce({}) { |hash,(key,value)| hash.merge key => value }
  end
end
