require_relative "room"

class Hotel
  def initialize(name, roomhash)
    @name = name
    @rooms = {}
    roomhash.each do |rhk, rhv|
      @rooms[rhk] = Room.new(rhv)
    end
  end

  def name
    @name.split(" ").map { |word| word[0].upcase + word[1..-1]}.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(roomname)
    @rooms.keys.include?(roomname)
  end

  def check_in(person, roomname)
    if room_exists?(roomname)
      if @rooms[roomname].add_occupant(person) #this executes the code, doesn't just evaluate
        print "check in successful"
      else
        print "sorry, room is full"
      end
    else
      print "sorry, room does not exist"
    end
  end

  def has_vacancy?
    !@rooms.each_key.all? { |k| @rooms[k].full? }
  end

  def list_rooms     
    @rooms.each do |name, v|
      puts name + " " + @rooms[name].available_space.to_s
    end
  end
end

