class SlickButton
  attr_accessor :command

  def initialize(&block)
    @command = block
  end

  def on_button_push
    @command.call if @command
  end
end

save_button = SlickButton.new { print 'EXECUTE!' }
save_button.on_button_push
