 Then(/^I should see the following movies$/) do |table|
  # Obtén todas las filas de la tabla HTML que contiene la lista de películas
  rows = page.all('table#movies tbody tr')

  # Verifica que el número de filas coincida con el número de filas en la tabla del paso
  expect(rows.count).to eq(table.hashes.count)

  # Verifica que cada película de la tabla del paso esté presente en la lista de películas
  table.hashes.each do |movie|
    expect(page).to have_content(movie['Movie Title'])
    expect(page).to have_content(movie['Rating'])
    expect(page).to have_content(movie['Release Date'])
  end
end
```
