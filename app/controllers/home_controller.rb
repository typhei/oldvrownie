# coding: utf-8
class HomeController < ApplicationController
  def top
    i = Page.maximum(:number)
    count = 1
    @page = []
    @toparticle = Page.find_by(:number => i)
    @start = params[:start].to_i
    if @start < 1 then
      @start = 1
    end
    i -= 1
    if !@start.nil? then
      i -= (@start-1)*10
    end
    while(!(Page.find_by(:number => i).nil?)) do
      @page.push(Page.find_by(:number => i))
      i-=1
      count += 1
      if count > 10 then
        break
      end
    end
  end

  def about
  end

  def inqury
  end
end
