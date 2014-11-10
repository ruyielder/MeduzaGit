require 'Qt'
require_relative 'app/widgets/main_window'
require_relative 'app/helpers/desktop'

class Launcher
  include Desktop

  def launch
    app = Qt::Application.new(ARGV)
    window = MainWindow.new
    window.show
    move_to_center(window)
    app.exec
  end

end

Launcher.new.launch