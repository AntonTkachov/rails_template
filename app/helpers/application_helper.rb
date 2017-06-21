module ApplicationHelper
  def bootstrap_class_for(flash_type)
    debugger
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type
  end
end
