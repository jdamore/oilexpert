module StringUtil

  def generate_email
    generate_string(15) + "@" + generate_string(10) +'.com'
  end

  def generate_string length
    (0...length).map{65.+(rand(25)).chr}.join
  end

end