module UsersHelper
  def total(cantidades)
    @acum = 0
    cantidades.each do |value|
      @acum = value.last + @acum
    end
    @acum
  end
end
