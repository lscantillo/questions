class EmptyHeader < StandardError
  attr_reader :code

  def initialize(code)
    super
    @code = code
  end
end
