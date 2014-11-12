class Commit
  attr_reader :message, :time, :humanized_time_difference

  def initialize(**data)
    @message = data[:message]
    @is_remote = data[:is_remote]
    @time = data[:time]
    @humanized_time_difference = data[:humanized_time_difference]
  end

  def is_remote?
    @is_remote
  end

end