require 'Qt'

module Desktop

  def move_to_center(window)
    frame = window.frame_geometry
    desktop_widget = Qt::DesktopWidget.new
    center = desktop_widget.available_geometry.center
    frame.move_center(center)
    window.move(frame.top_left)
  end

end