require "employee"

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(otherstartup)
        @funding > otherstartup.funding
    end

    def hire(name, title)
        if salaries[title]
            @employees << Employee.new(name, title)
        else
            raise "Title is Invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        if @funding > @salaries[employee.title]
            pay = @salaries[employee.title]
            employee.pay(pay)
            @funding -= pay
        else
            raise "rut roh"
        end
    end

    def payday()
        @employees.each { |employee| pay_employee(employee)}
    end

    def average_salary
        sum = 0
        count = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
            count += 1
        end
        sum / count
    end


    def close
        @employees = []
        @funding = 0
    end

    def acquire(otherstartup)
        @funding += otherstartup.funding

        newkeys = otherstartup.salaries.keys - @salaries.keys

        newkeys.each do |newkey|
            @salaries[newkey] = otherstartup.salaries[newkey]
        end

        otherstartup.employees.each { |employee| @employees << employee}

        otherstartup.close

    end


   
end


# => salaries (hash) containing `title` => `salary` pairs