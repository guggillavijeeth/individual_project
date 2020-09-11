class SolvesController < ApplicationController
   
   def index
      solve_list = Solve.all
      @solves = solve_list
      @best_solve = solve_list.first.seconds
      solve_list.each do |current_solve|
         if current_solve.seconds < @best_solve
            @best_solve = current_solve.seconds
         end
      end
      all_times = []
      solve_list.each do |current_solve|
         all_times.push(current_solve.seconds.to_f)
      end
      @average_solve_time = (all_times.sum/all_times.length).to_s
   end
         
end


 