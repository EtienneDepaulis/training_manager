class UserDecorator < Draper::Decorator
  delegate_all

  def phone
  	return '' if object.phone.blank?

		object.phone.gsub(/\s/, '')
  end

end
