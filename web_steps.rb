 Given(/^I check the following ratings: (.+)$/) do |ratings|
  ratings.split(', ').each do |rating|
    step "I check the \"#{rating}\" checkbox"
  end
end
