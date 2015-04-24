require "gosu"
require "./lib/position"

class Game < Gosu::Window
  attr_accessor :width, :cell_width, :position

  def initialize
    @width = 600
    @cell_width = @width/
    @position = Position.new
    @font = Gosu::Font.new(self, Gosu::default_font_name, cell_width)
    super(width, width, false)
  end


  def button_down(id)
  case id
  when Gosu::KbQ then close
  when Gosu::MsLeft then @position = @position.move((mouse_x/cell_width).to_i + 3*(mouse_y/cell_width).to_i)
  end


  def needs_cursor?
    true
  end

  def draw
    [cell_width, cell_width*2].each do |w|
    draw_line(w, 0, Gosu::Color::WHITE, w, width, Gosu::Color::White)
    draw_line(0, w, Gosu::Color::WHITE, width, w, Gosu::Color::White)
  end

  
  position.board.each.with_index do |p,i|
    if p != "-"
      x = (i%3)*cell_width
      y = (i/3)*cell_width
      @font.draw(p, x, y, 0)
      end
    end
  end

end

game = Game.new
game.show

