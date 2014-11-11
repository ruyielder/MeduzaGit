require 'Qt'

class ListWidgetPaginatorWidget < Qt::Widget
  slots :display_prev_items,
        :display_next_items

  def initialize(parent, list_widget)
    super(parent)
    @list_widget = list_widget
    @prev_button = Qt::PushButton.new
    @next_button = Qt::PushButton.new

    setup_widgets
    setup_layout
    setup_slots
  end

  def setup_widgets
    @prev_button.text = 'Poprzednia'
    @next_button.text = 'Następna'
  end

  def setup_layout
    layout = Qt::VBoxLayout.new(self)
    layout.add_widget(@list_widget)
    buttons_layout = Qt::HBoxLayout.new(self)
    buttons_layout.add_widget(@prev_button)
    buttons_layout.add_widget(@next_button)
    layout.add_layout(buttons_layout)
    set_layout(layout)
  end

  def setup_slots
    connect(@prev_button, SIGNAL(:clicked), self, SLOT(:display_prev_items))
    connect(@next_button, SIGNAL(:clicked), self, SLOT(:display_next_items))
  end

  def display_prev_items
    update_buttons
    @list_widget.display_prev_items
  end

  def display_next_items
    update_buttons
    @list_widget.display_next_items
  end

  def update_buttons
    @next_button.enabled = @list_widget.has_next_items?
    @prev_button.enabled = @list_widget.has_prev_items?
  end

end