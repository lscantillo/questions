class Api::EmptyHeader < StandardError
  attr_reader :code, :message

  def initialize(code)
    super
    @code = code
    @message = "No authorization token provided in header"
  end
end
