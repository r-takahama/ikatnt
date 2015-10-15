class MypageController < ApplicationController
  def index
  	@feses = Fes.all
  end
end
