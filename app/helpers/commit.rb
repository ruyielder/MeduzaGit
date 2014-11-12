class Commit
  attr_reader :message

  def initialize(message, is_remote)
    @message = message
    @is_remote = is_remote
  end

  def is_remote?
    @is_remote
  end

end