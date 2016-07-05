class EnquiriesController < ApplicationController
  def create
    @enquiry = Enquiry.new(enquiry_params)
    if @enquiry.save
      redirect_to root_path, notice: 'We will contact you shortly.'
    else
      render 'welcome/contact'
    end
  end

  private

  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :subject, :message, :humanizer_answer, :humanizer_question_id)
  end
end
