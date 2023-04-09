# frozen_string_literal: true

# спидометр в киллометрах/час
class Russian_Speedometr
  attr_accessor :speed_km_h
  def initialize(speed_km_h)
    self.speed_km_h = speed_km_h
  end

  def set_speed(speed_km_h)
    self.speed_km_h = speed_km_h
  end

  def get_speed
    "установленная скорость = #{self.speed_km_h} км/ч"
  end
end

# спидометр в миль/час
class American_Speedometr
  attr_accessor :speed_ml_h
  def initialize(speed_ml_h)
    self.speed_ml_h = speed_ml_h
  end

  def set_speed(speed_ml_h)
    self.speed_ml_h = speed_ml_h
  end

  def get_speed
    "установленная скорость = #{self.speed_ml_h} мл/ч"
  end
end

# класс, адаптирующий спидометр с миль/ч
# в спидометр с измерением км/ч
class Speedometr_Adapter < Russian_Speedometr
  def initialize(american_speedometr)
    @speedometr = american_speedometr
    self.speed_km_h = @speedometr.speed_ml_h * 1.609
  end

  def set_speed(speed_km_h)
    @speedometr.speed_ml_h = speed_km_h / 1.609
    super
  end

  def get_speed
    super
  end
end

#американский спидометр с установленной скоростью 120 миль/ч
am_speedmtr = American_Speedometr.new(120)

#адаптер
adapter = Speedometr_Adapter.new(am_speedmtr)

puts am_speedmtr.get_speed #120 миль/ч
puts adapter.get_speed  #193.08 км/ч

adapter.set_speed(1) #установили 1 км/ч

puts adapter.get_speed #1 км/ч
puts am_speedmtr.get_speed #0,621 миль/ч