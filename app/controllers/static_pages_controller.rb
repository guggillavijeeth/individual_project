class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def random
    @algs=["U2 D2 F2 B2 L2 R2", 
    "R2 U2 R2 U2 R2 U2 L2 D2 L2 D2 L2 D2 L2 R2", 
    "U B2 R2 B2 L2 F2 R2 D' F2 L2 B F' L F2 D U' R2 F' L' R'", 
    "F L F U' R U F2 L2 U' L' B D' B' L2 U", 
    "U D' R L' F B' U D'", 
    "F2 L2 R2 B2 E2", 
    "D' B2 F2 L2 U' F2 R2 D F2 U2 L' B R' U' L' F D' F L D2"]
    @result = @algs.shuffle.first
  end
end
