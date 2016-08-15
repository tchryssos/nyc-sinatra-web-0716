require 'pry'

class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark=Landmark.create(params["figure"])
    redirect to "landmarks/#{@landmark.id}"
  end

  get '/landmarks' do
    @landmarks=Landmark.all
    erb :'landmarks/index'
  end


  get '/landmarks/:id/edit' do
    @landmark=Landmark.find(params[:id])
    erb :"landmarks/edit"
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    @landmark.update(params["landmark"])
    redirect to "figures/#{@figure.id}"
  end

end
