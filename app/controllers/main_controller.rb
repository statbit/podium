class MainController < ApplicationController
  def show
  end

  def all_on_spotify
    airfoil_service = AirfoilService.new(
      source: :spotify,
      speakers: :all
    )
    airfoil_service.make_it_so
    flash[:success] = 'Nailed it'
    redirect_to '/'
  end

  def most_on_spotify
    airfoil_service = AirfoilService.new(
      source: :spotify,
      speakers: :some
    )
    airfoil_service.make_it_so
    flash[:success] = 'Nailed it'
    redirect_to '/'
  end

  def all_on_itunes
    airfoil_service = AirfoilService.new(
      source: :itunes,
      speakers: :all
    )
    airfoil_service.make_it_so
    flash[:success] = 'Nailed it'
    redirect_to '/'
  end

  def most_on_itunes
    airfoil_service = AirfoilService.new(
      source: :itunes,
      speakers: :some
    )
    airfoil_service.make_it_so
    flash[:success] = 'Nailed it'
    redirect_to '/'
  end

  def off
    AirfoilService.off
    flash[:success] = 'Silenced!'
    redirect_to '/'
  end
end
