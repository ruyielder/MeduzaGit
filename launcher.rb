require 'Qt'
require_relative 'app/helpers/desktop'

class Launcher
  include Desktop

  def launch
    app = Qt::Application.new(ARGV)
    widget = Qt::Widget.new
    widget.show
    move_to_center(widget)
    app.exec
  end

end

Launcher.new.launch