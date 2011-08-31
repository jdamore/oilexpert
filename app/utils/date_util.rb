module DateUtil

  def format_dd_MM_yyyy date_time
    date_time!=nil ? date_time.strftime('%d/%m/%Y'):nil
  end

  def format_dd_MM_yyyy_hh_mm date_time
    date_time!=nil ? date_time.strftime('%d/%m/%Y %H:%m'):nil
  end

  def format_MM_dd_yyyy_hh_mm date_time
    date_time!=nil ? date_time.strftime('%m/%d/%Y %H:%m'):nil
  end

end