class Member
  attr_reader :name,
              :role,
              :house,
              :patronus

  def initialize(member_info)
    @name = member_info[:name]
    @role = member_info[:role]
    @house = member_info[:house]
    @patronus = member_info[:patronus]
  end
end
