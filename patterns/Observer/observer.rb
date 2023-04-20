# frozen_string_literal: true

class TrafficLight
  attr_reader :cur_light
  def initialize(light)
    #список наблюдателей
    @observers = []

    @cur_light = light
  end

  #добавить наблюдателя
  def add_observer(observer)
    @observers << observer
  end

  #удалить наблюдателя
  def delete_observer(observer)
    @observers.delete(observer)
  end

  #изменить цвет
  def chang_light(new_light)
    @cur_light = new_light
    notify
  end

  protected
  #сообщить наблюдателям обизменении
  def notify
    @observers.each do |obs|
      obs.reaction
    end
  end
end

class Driver
  def initialize(traffic_light)
    @traffic_light = traffic_light
    @traffic_light.add_observer(self)
  end

  #среагировать на событие наблюдаемого объекта
  def reaction
    if @traffic_light.cur_light == 'green'
      puts "#{self} : Жму на газ!"
    end
    if @traffic_light.cur_light == 'red'
      puts "#{self}: торможу и жду зеленый"
    end
  end
end

traffic_light = TrafficLight.new('red')
driver1 = Driver.new(traffic_light)
driver2 = Driver.new(traffic_light)
traffic_light.chang_light('green')
traffic_light.chang_light('red')