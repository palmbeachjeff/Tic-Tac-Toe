require 'spec_helper'
require 'Tic-Tac-Toe'

#add array without commas, use spaces in between to create board
describe Position do 
  context "#new" do
    it "should create a new board" do
      position = Position.new
      position.board.should == %w(- - -
                                  - - -
                                  - - -)

      position.turn.should ==  "x"    

  
end