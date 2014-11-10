require 'Qt'

class MainWindow < Qt::MainWindow

  def initialize
    super
    set_window_title 'MeduzaGit'
  end

end