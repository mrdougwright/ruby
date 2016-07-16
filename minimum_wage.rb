class Workers

  def initialize(*outputs)    # each output is 1 hour of work from 1 worker
    @outputs = outputs        # wage/output earned/produced each hour
    self.stats
  end                         # i.e. Workers.new(5, 10, 15, 20, etc)


  def stats
    puts "Labor force: #{total_workers} people"
    puts "Labor force participation: #{participation_rate}"
    puts "GDP: #{gdp}"
    puts "GDP per capita: #{gdp_per_capita}"
    puts "Median wage: #{median_wage}"
    puts "#{employed_workers.count} employed out of #{total_workers} workers."
  end

  def gdp
    @outputs.inject(0){ |sum, output| sum += output }
  end

  def gdp_per_capita
    gdp / total_workers
  end

  def median_wage
    sorted = employed_workers.sort
    length = sorted.length
    "$#{(sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0}"
  end

  def participation_rate
    "#{(employed_workers.count / total_workers.to_f) * 100}%"
  end

  def employed_workers
    @outputs.select{|worker| worker > 0 }
  end

  def total_workers
    @outputs.count
  end
end


# from IRB:
# $ load(Dir.pwd + '/Desktop/minimum_wage.rb')
# $ workers = Workers.new(5 10 15 20 25)
# $ workers.gdp
# => 75


# http://www.forbes.com/sites/realspin/2016/07/04/high-minimum-wage-everyone-worse-off/#2e7256bc1b20
