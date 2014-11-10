require 'Qt'

app = Qt::Application.new(ARGV)
widget = Qt::Widget.new
widget.show
app.exec