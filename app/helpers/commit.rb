class Commit
  attr_reader :message, :author_name, :time, :humanized_time_difference, :sha

  def initialize(**data)
    @message = data[:message]
    @is_remote = data[:is_remote]
    @time = data[:time]
    @humanized_time_difference = data[:humanized_time_difference]
    @author_name = data[:author_name]
    @sha = data[:sha]
  end

  def is_remote?
    @is_remote
  end

  def is_local?
    !is_remote?
  end

end