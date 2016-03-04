module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success then 'alert-success'
      when :error   then 'alert-danger'
      when :alert   then 'alert-warning'
      when :notice  then 'alert-info'
      else
        flash_type.to_s
    end
  end

  def swatch_class
    @swatch_class ||= "swatch-#{swatch_options.sample}"
  end

  private

  def swatch_options
    %w(pink green blue dark-blue violet orange yellow dark-green black)
  end
end
