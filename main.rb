require_relative 'railway'

CREATE_STATION = 1
CREATE_TRAIN = 2
CREATE_ROUTE = 3
CREATE_WAGON = 4
LIST_STATIONS = 5
LIST_TRAINS = 6
LIST_ROUTES = 7
LIST_WAGONS = 8
ADD_STATION_TO_ROUTE = 9
DELETE_STATION_FROM_ROUTE = 10
TAKE_ROUTE = 11
ATTACH_WAGON = 12
UNHOOK_WAGON = 13
MOVE_AHEAD = 14
MOVE_BACK = 15
SHOW_STATIONS = 16
EXIT = 0

@railway = Railway.new

def show_main_menu
  puts "Выберите пункт меню"
  puts "1. Создать станцию"
  puts "2. Создать поезд"
  puts "3. Создать маршрут"
  puts "4. Создать вагон"
  puts "5. Список станций "
  puts "6. Список поездов "
  puts "7. Список маршрутов"
  puts "8. Список вагонов"
  puts "9. Добавить промежуточную станцию в маршрут"
  puts "10. Удалить промежуточную станцию из маршрута"
  puts "11. Назначить маршрут поезду"
  puts "12. Прицепить вагон к поезду"
  puts "13. Отцепить вагон от поезда"
  puts "14. Переместить поезд на следующую станцию"
  puts "15. Переместить поезд на предыдущую станцию"
  puts "16. Проссмотреть список станций и список поездов на станции"
  puts "0. Выход"
end

def runner
  loop do
    show_main_menu

    index = gets.chomp.to_i
    
    case index
    when CREATE_STATION
      puts 'Введите имя станции:'
      name = gets.chomp
      @railway.create_station(name)
    when CREATE_TRAIN
      puts 'Выберите тип поезда: 0 - пассажирский; 1 - грузовой'
      type = gets.chomp.to_i
      puts 'Введите номер поезда:'
      train_number = gets.chomp
      if type == 0
        @railway.create_passenger_train(train_number)
      elsif type == 1
        @railway.create_cargo_train(train_number)
      end
    when CREATE_ROUTE
      @railway.stations_with_index
      
      puts 'Введите индекс № начальной станции маршрута'
      start_station_index = gets.chomp.to_i
      
      puts 'Введите индекс № конечной станции маршрута'
      finish_station_index = gets.chomp.to_i
      
      @railway.create_route(start_station_index, finish_station_index)
    when CREATE_WAGON
      puts 'Выберите тип вагона: 0 - пассажирский; 1 - грузовой'
      type = gets.chomp.to_i
      puts 'Введите номер вагона:'
      wagon_number = gets.chomp
      if type == 0
        @railway.create_passenger_wagon(wagon_number)
      elsif type == 1
        @railway.create_cargo_wagon(wagon_number)
      end
    when LIST_STATIONS
      @railway.stations_with_index
    when LIST_TRAINS
      @railway.trains_with_index
    when LIST_ROUTES
      @railway.routes_with_index
    when LIST_WAGONS
      @railway.wagons_with_index
    when ADD_STATION_TO_ROUTE
      @railway.routes_with_index
      puts 'Введите индекс № маршрута:'
      route_index = gets.chomp.to_i
      
      @railway.stations_with_index
      puts 'Введите индекс № станции для добавления:'
      station_index = gets.chomp.to_i
      
      @railway.add_interval_stations(route_index, station_index)
    when DELETE_STATION_FROM_ROUTE
      @railway.routes_with_index
      puts 'Введите индекс № маршрута:'
      route_index = gets.chomp.to_i

      @railway.stations_with_index
      puts 'Введите индекс № станции для удаления:'
      station_index = gets.chomp.to_i
      delete_interval_stations(route_index, station_index)
    when TAKE_ROUTE
      @railway.trains_with_index
      puts 'Введите индекс № поезда, которому нужно добавить маршрут:'
      train_index = gets.chomp.to_i
      
      @railway.routes_with_index
      puts 'Введите индекс № маршрута:'
      route_index = gets.chomp.to_i
      
      @railway.take_route(train_index, route_index)
    when ATTACH_WAGON
      @railway.trains_with_index
      puts 'Введите индекс № поезда, которому нужно добавить вагон:'
      train_index = gets.chomp.to_i

      @railway.wagons_with_index
      puts 'Введите индекс № вагона для добавления к поезду:'
      wagon_index = gets.chomp.to_i
      
      @railway.attach_wagon(train_index, wagon_index)
    when UNHOOK_WAGON
      @railway.trains_with_index
      puts 'Введите индекс № поезда, от которого нужно отцепить вагон:'
      train_index = gets.chomp.to_i

      @railway.train_by_index(train_index).wagons_with_index
      puts 'Введите индекс № вагона для отцепления от поезда:'
      wagon_index = gets.chomp.to_i

      @railway.unhook_wagon(train_index, wagon_index)
    when MOVE_AHEAD
      @railway.trains_with_index
      puts 'Введите индекс № поезда для отправления на следующую станцию:'
      train_index = gets.chomp.to_i
      
      @railway.move_ahead(train_index)
    when MOVE_BACK
      @railway.trains_with_index
      puts 'Введите индекс № поезда для отправления на предыдущую станцию:'
      train_index = gets.chomp.to_i
      
      @railway.move_back(train_index)
    when SHOW_STATIONS
      @railway.show_stations
    when EXIT then break
    end
  end
end

runner
