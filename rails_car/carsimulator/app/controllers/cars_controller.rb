class CarsController < ApplicationController
  def index
  end

  def create
    make = params[:make]
    model_year = params[:model_year]
    @car = Car.new(make, model_year)
    cookies[:car] = @car.to_yaml
  end

  def accelerate
    @car = YAML.load(cookies[:car])
    @car.accelerate
    cookies[:car] = @car.to_yaml
    render 'create.html.erb'
  end

  def brake
    @car = YAML.load(cookies[:car])
    @car.brake
    cookies[:car] = @car.to_yaml
    render 'create.html.erb'
  end
end
