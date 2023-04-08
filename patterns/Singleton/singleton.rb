
class Singleton
  private_class_method :new
  attr_accessor :x, :y, :z

  @instance = nil

  def self.instance
    @instance ||= new
  end

  def do_something
    puts "i doing something"
  end
end

a = Singleton.instance
b = Singleton.instance
puts a
puts b

