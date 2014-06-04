class MainController < ApplicationController
  def index
  end

  def game

  	if !session[:gold]
  		session[:gold] = 0
  		session[:logs] = Array.new
  	end

  	room = params[:room]

  	if room == 'house'
  		gold = rand(5..10)
  		session[:gold] += gold
  	elsif room == 'farm'
  		gold = rand(1..5)
  		session[:gold] += gold

  	elsif room == 'casino'
  		luck = rand(0..1)
  		if luck == 1
  			gold = rand(15..30)
  		else
  			gold = rand(-30..-15)
  		end

  		session[:gold] += gold
  	else
  		gold = rand(8..15)
  		session[:gold] += gold
  	end

  	if gold > 0 
  		session[:logs] <<  "you went to a #{room} and you found #{gold} gold"
  	else
  		session[:logs] << "you went to the casino and you lost #{gold.abs} gold...idiot"
  	end

  	redirect_to('/main/index')
  end

  def reset
  	session.delete :logs
  	session.delete :gold
  	redirect_to('/main/index')
  end
end
