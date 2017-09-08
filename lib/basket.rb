class Basket
attr_reader :sheet

  def initialize
    @sheet = Hash.new{0}
  end

end