module StudentsHelper
    def name(student)
        if student.gender.downcase == "m" or student.gender.downcase == "male"
         "Mr."+" "+student.first_name+" "+student.last_name
        else
            "Mrs."+" "+student.first_name+" "+student.last_name
        end
    end

    def age(student)
        time=Time.new
        age = time.year-student.year_of_birth
        return age
    end
end
