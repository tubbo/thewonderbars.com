class EnvFile
  def initialize location=".env"
    @contents = File.read location
  end

  def self.read method
    new.send method
  end

  def self.get setting
    new.exports[setting]
  end

  def exports
    contents.select { |line| line =~ /\Aexport\s/ }
            .map { |line| line.gsub(/\Aexport\s/, '').split '=' }
            .reduce({}) { |hash,(key,value)| hash.merge key => value }
  end
end
