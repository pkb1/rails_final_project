class SearchController < ApplicationController
  def search_student
    if params["q"].present?
      abc = params["q"].downcase
    @students = Student.where(Student.arel_table[:first_name].lower.matches("%#{abc.downcase}%")).or(Student.where(Student.arel_table[:last_name].lower.matches("%#{abc.downcase}%")))
    respond_to do |format|
      format.js{render layout: false, content_type: "text/javascript", collection: @students}
    end
    else 
      flash[:error]="Search Cannot Found"
      redirect_to_root_path
      end
  end
  def search_book
    if params["q"].present?
      abc = params["q"].downcase
    @items = Item.where(Item.arel_table[:name].lower.matches("%#{abc.downcase}%"))
    respond_to do |format|
      format.js{render layout: false, content_type: "text/javascript", collection: @items}
    end
    else 
      flash[:error]="Search Cannot Found"
      redirect_to_root_path
      end
  end
end
