*** Settings ***
Resource        ../Pages/P01-HomePage.robot
Resource        ../Pages/P02-SearchResultsPage.robot
Resource        ../Pages/P03-ProductDetailsPage.robot
Resource        ../Pages/P04-ExtendedWarrantyPage.robot
Resource        ../Pages/P05-ShoppingCartPage.robot

Suite setup         Open web browser
Suite teardown      Close browser

*** Test Cases ***
01 - Add item to shopping cart
	Given that I am in Americanas home page
	When I search for a product using the word "Samsung"
	Then a screen containing the search results is displayed
	When I click on the first product from the result list
	Then a screen containing the product details is displayed
	When I click on the button labeled comprar on product detail screen
	Then I should see a screen containing information about extended warranty is displayed
	When I click on continuar button on extended warranty screen
	Then I should see my shopping cart with the item listed in it

02 - Remove item from shopping cart
	Given that I have an Item in my shopping cart
	When I click on the button labeled remover on the desired item
	Then I should see an empty shopping cart