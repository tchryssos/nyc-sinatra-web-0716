require 'pry'

class FiguresController < ApplicationController

  get "/figures/new" do
    erb :"figures/new_figure"
  end

  post '/figures' do
    @figure=Figure.create(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures' do
    # binding.pry
    @figures=Figure.all
    erb :"figures/index"
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    # binding.pry
    erb :"figures/show"
  end

  post '/figures/:id' do
    @figure=Figure.find(params[:id])
    @figure.update(params["figure"])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    erb :"figures/edit"
  end

end
