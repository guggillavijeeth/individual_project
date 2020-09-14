class SolvesController < ApplicationController
   
   def index
      solve_list = Solve.all
      @solves = solve_list
      @best_solve = solve_list.first.seconds
      solve_list.each do |current_solve|
         if current_solve.seconds < @best_solve
            @best_solve = current_solve.seconds.to_f.round(3).to_s
         end
      end
      all_times = []
      solve_list.each do |current_solve|
         all_times.push(current_solve.seconds.to_f)
      end
      @average_solve_time = (all_times.sum/all_times.length).round(3).to_s
   end
   
   def new
      @generated_scramble = generate_scramble
      @solve = Solve.new
   end
   
   def create
      @solve = Solve.new(solve_params)
      if @solve.save
         flash[:success] = "Solve saved!"
         redirect_to solves_path
      else
         render 'new'
      end
   end
   
   private 
      
      def solve_params
         params.require(:solve).permit(:seconds, :scramble)
      end
      
      def generate_scramble
         possible_moves = %w[R L U D F B R' L' U' D' F' B' R2 L2 U2 D2 F2 B2]
         temp = []
         20.times{temp.push(possible_moves.shuffle.first)}
         result = temp.join(" ")
         return result
      end
end